#!/bin/bash
# 템플릿 파일 일괄 복사 + 변수 치환 스크립트
# "그대로 복사" 14개 + "변수 치환" 5개 = 19개 파일을 한 번에 처리.
# Claude가 Read/Write할 필요 없는 파일들을 자동화하여 컨텍스트를 절약한다.
#
# 사용법:
#   bash generate-files.sh <PLUGIN_ROOT> <PROJECT_ROOT> <PKG_MANAGER> <TEST_CMD> <TYPECHECK_CMD> <LINT_CMD> [HAS_DB]
#
# 예시:
#   bash generate-files.sh ~/.claude/plugins/launchpad ./my-project npm "npm test" "npx tsc --noEmit" "npm run lint"
#   bash generate-files.sh ~/.claude/plugins/launchpad ./my-project bun "bun test" "bunx tsc --noEmit" "bun run lint" true

set -euo pipefail

PLUGIN_ROOT="${1:?❌ PLUGIN_ROOT 필수}"
PROJECT_ROOT="${2:?❌ PROJECT_ROOT 필수}"
PKG_MANAGER="${3:?❌ PKG_MANAGER 필수 (npm|pnpm|yarn|bun)}"
TEST_CMD="${4:?❌ TEST_CMD 필수}"
TYPECHECK_CMD="${5:?❌ TYPECHECK_CMD 필수}"
LINT_CMD="${6:?❌ LINT_CMD 필수}"
HAS_DB="${7:-false}"

TPL="$PLUGIN_ROOT/templates"
OUT="$PROJECT_ROOT/.claude"

# ───────────────────────────────────────────
# 디렉토리 생성
# ───────────────────────────────────────────
mkdir -p "$OUT/rules/frontend" \
         "$OUT/skills/easy-refactoring" \
         "$OUT/skills/skill-discovery" \
         "$OUT/agents" \
         "$OUT/commands" \
         "$OUT/hooks"

# ───────────────────────────────────────────
# 1. 그대로 복사 (14개)
# ───────────────────────────────────────────
COPY_FILES=(
  # rules
  "rules/conventions.md:rules/conventions.md"
  # skills
  "skills/easy-refactoring/SKILL.md:skills/easy-refactoring/SKILL.md"
  "skills/skill-discovery/SKILL.md:skills/skill-discovery/SKILL.md"
  # commands
  "commands/review.md:commands/review.md"
  "commands/commit-push-pr.md:commands/commit-push-pr.md"
  # hooks
  "hooks/session-start.sh:hooks/session-start.sh"
  "hooks/edit-monitor.sh:hooks/edit-monitor.sh"
  "hooks/secret-guard.sh:hooks/secret-guard.sh"
  "hooks/command-guard.sh:hooks/command-guard.sh"
  "hooks/security-trigger.sh:hooks/security-trigger.sh"
  # agents
  "agents/code-reviewer.md:agents/code-reviewer.md"
  "agents/debugger.md:agents/debugger.md"
  # 기타
  "lessons.md:lessons.md"
  "decisions.md:decisions.md"
)

COPIED=0
SKIPPED=0

for mapping in "${COPY_FILES[@]}"; do
  SRC="${TPL}/${mapping%%:*}"
  DST="${OUT}/${mapping##*:}"
  if [ -f "$SRC" ]; then
    cp "$SRC" "$DST"
    ((COPIED++))
  else
    echo "⚠️ 템플릿 없음: $SRC"
    ((SKIPPED++))
  fi
done

# ───────────────────────────────────────────
# 2. 변수 치환 복사 (5개)
# ───────────────────────────────────────────
_substitute() {
  local src="$1" dst="$2"
  if [ ! -f "$src" ]; then
    echo "⚠️ 템플릿 없음: $src"
    ((SKIPPED++))
    return
  fi
  sed -e "s|{{PKG_MANAGER}}|${PKG_MANAGER}|g" \
      -e "s|{{TEST_CMD}}|${TEST_CMD}|g" \
      -e "s|{{TYPECHECK_CMD}}|${TYPECHECK_CMD}|g" \
      -e "s|{{LINT_CMD}}|${LINT_CMD}|g" \
      "$src" > "$dst"
  ((COPIED++))
}

# settings.json
_substitute "$TPL/settings.json" "$OUT/settings.json"

# commands (PKG_MANAGER 치환)
_substitute "$TPL/commands/check.md" "$OUT/commands/check.md"
_substitute "$TPL/commands/security-review.md" "$OUT/commands/security-review.md"

# hooks (TYPECHECK_CMD, LINT_CMD, TEST_CMD 치환)
_substitute "$TPL/hooks/pre-commit-check.sh" "$OUT/hooks/pre-commit-check.sh"

# agents (TEST_CMD 치환)
_substitute "$TPL/agents/test-runner.md" "$OUT/agents/test-runner.md"

# ───────────────────────────────────────────
# 3. 조건부 복사: DB 관련 (HAS_DB=true일 때)
# ───────────────────────────────────────────
if [ "$HAS_DB" = "true" ]; then
  if [ -f "$TPL/hooks/db-guard.sh" ]; then
    cp "$TPL/hooks/db-guard.sh" "$OUT/hooks/db-guard.sh"
    ((COPIED++))
  fi
else
  # DB 없으면 settings.json에서 mcp__* > db-guard 블록 제거
  if [ -f "$OUT/settings.json" ]; then
    # mcp__* 매처 블록 전체 제거 (JSON 정리)
    python3 -c "
import json, sys
with open('$OUT/settings.json') as f:
    cfg = json.load(f)
hooks = cfg.get('hooks', {})
for event in list(hooks.keys()):
    entries = hooks[event]
    hooks[event] = [e for e in entries if e.get('matcher') != 'mcp__*']
    if not hooks[event]:
        del hooks[event]
with open('$OUT/settings.json', 'w') as f:
    json.dump(cfg, f, indent=2, ensure_ascii=False)
    f.write('\n')
" 2>/dev/null || echo "⚠️ settings.json에서 db-guard 블록 제거 실패 (수동 확인 필요)"
  fi
fi

# ───────────────────────────────────────────
# 4. 훅 실행 권한 설정
# ───────────────────────────────────────────
chmod +x "$OUT/hooks/"*.sh 2>/dev/null || true

# ───────────────────────────────────────────
# 결과 출력
# ───────────────────────────────────────────
echo ""
echo "✅ generate-files 완료: ${COPIED}개 생성, ${SKIPPED}개 건너뜀"
echo ""
echo "📋 Claude가 직접 Read+커스터마이징해야 할 파일:"
echo "   [Rules]  security.md, error-handling.md, testing.md"
echo "   [Skills] project-directory/SKILL.md"
echo "   [조건부] frontend/react.md, frontend/styles.md, design-rules/SKILL.md"
echo "   [조건부] database.md, dependencies/SKILL.md"
echo "   [항상]   CLAUDE.md (claude-md-template.md 기반)"
echo "   [계획서] 커스텀 스킬, 커스텀 에이전트"
