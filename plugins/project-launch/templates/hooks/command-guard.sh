#!/bin/bash
# PreToolUse hook — 위험한 Bash 명령어 차단
# 7개 카테고리의 파괴적/위험 명령어를 감지하여 실행을 차단한다.
# exit 2로 도구 호출 차단.

INPUT=$(cat)

if ! command -v jq &>/dev/null; then
  exit 0
fi

COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty' 2>/dev/null)
if [ -z "$COMMAND" ]; then
  exit 0
fi

BLOCKED=""
CATEGORY=""

# 1. 파괴적 파일 삭제
if echo "$COMMAND" | grep -qE '(rm\s+(-[a-zA-Z]*)?r[a-zA-Z]*f|rm\s+(-[a-zA-Z]*)?f[a-zA-Z]*r)\s+(/|~|\$HOME|\.\.)'; then
  BLOCKED="$COMMAND"
  CATEGORY="파괴적 파일 삭제 (루트/홈/상위 디렉토리)"
fi

# 2. 환경 변수 유출
if echo "$COMMAND" | grep -qE '(cat|less|more|head|tail|bat)\s+\.env|printenv|env\s*$|env\s*\|'; then
  BLOCKED="$COMMAND"
  CATEGORY="환경 변수 유출 위험"
fi

# 3. 시크릿 파일 외부 전송
if echo "$COMMAND" | grep -qE '(curl|wget|nc|ncat)\s+.*\.(env|pem|key|p12|pfx|jks)'; then
  BLOCKED="$COMMAND"
  CATEGORY="시크릿 파일 외부 전송"
fi

# 4. 디스크/파티션 파괴
if echo "$COMMAND" | grep -qE '(mkfs|dd\s+if=|fdisk|parted)\s+/dev/'; then
  BLOCKED="$COMMAND"
  CATEGORY="디스크/파티션 조작"
fi

# 5. 권한 에스컬레이션
if echo "$COMMAND" | grep -qE '(chmod\s+777|chmod\s+-R\s+777|chown\s+-R\s+root)'; then
  BLOCKED="$COMMAND"
  CATEGORY="위험한 권한 변경"
fi

# 6. 위험한 git 명령
if echo "$COMMAND" | grep -qE 'git\s+push\s+.*--force\s+(origin\s+)?(main|master)'; then
  BLOCKED="$COMMAND"
  CATEGORY="main/master 브랜치 강제 푸시"
fi

# 7. 프로세스 전체 종료
if echo "$COMMAND" | grep -qE 'kill\s+-9\s+-1|killall\s+-9'; then
  BLOCKED="$COMMAND"
  CATEGORY="전체 프로세스 종료"
fi

if [ -n "$BLOCKED" ]; then
  echo ""
  echo "🛑 위험 명령 차단!"
  echo "   카테고리: $CATEGORY"
  echo "   명령어: $COMMAND"
  echo ""
  echo "   이 명령은 보안 정책에 의해 차단되었습니다."
  echo "   정말 필요한 경우 사용자에게 직접 실행을 요청하세요."
  echo ""
  exit 2
fi

exit 0
