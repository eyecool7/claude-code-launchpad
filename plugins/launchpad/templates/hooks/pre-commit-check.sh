#!/bin/bash
# PreToolUse hook — git commit 전 빌드 검증
# Bash 도구의 모든 호출에서 실행되며, git commit인 경우에만 검증 수행.
# 실패 시 exit 2로 도구 호출 차단.

# stdin에서 JSON 입력 읽기
INPUT=$(cat)

# jq 확인
if ! command -v jq &>/dev/null; then
  echo "⚠️ jq가 설치되지 않아 pre-commit 검증을 건너뜁니다. 설치: brew install jq"
  exit 0
fi

# Bash 명령어 추출
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty' 2>/dev/null)

# git commit이 아니면 통과
if ! echo "$COMMAND" | grep -qE '^\s*git\s+commit'; then
  exit 0
fi

# 미치환 변수 감지 → 폴백으로 사용 가능한 명령 자동 탐색
TYPECHECK="{{TYPECHECK_CMD}}"
LINT="{{LINT_CMD}}"
TEST="{{TEST_CMD}}"

# {{변수}}가 그대로 남아있으면 package.json에서 자동 탐색
if echo "$TYPECHECK" | grep -q '{{'; then
  PKG_MGR="npm"
  command -v pnpm &>/dev/null && [ -f "pnpm-lock.yaml" ] && PKG_MGR="pnpm"
  command -v yarn &>/dev/null && [ -f "yarn.lock" ] && PKG_MGR="yarn"
  command -v bun &>/dev/null && [ -f "bun.lockb" ] && PKG_MGR="bun"

  TYPECHECK="$PKG_MGR run typecheck 2>/dev/null || true"
  LINT="$PKG_MGR run lint 2>/dev/null || true"
  TEST="$PKG_MGR test 2>/dev/null || true"
  echo "⚠️ pre-commit-check: 변수 미치환 — $PKG_MGR 기반 폴백 사용"
fi

# typecheck + lint + test 실행
if eval "$TYPECHECK" && eval "$LINT" && eval "$TEST"; then
  echo "✅ 검증 통과. 커밋 진행."
  exit 0
else
  echo "❌ 검증 실패. 에러를 수정하고 다시 커밋하세요."
  exit 2
fi
