#!/bin/bash
# PostToolUse hook — Bash 출력에서 시크릿 패턴 감지
# 시크릿이 노출되면 경고 메시지를 출력한다. (차단하지 않음, 이미 실행된 후)

INPUT=$(cat)

if ! command -v jq &>/dev/null; then
  exit 0
fi

# Bash 도구의 출력(stdout/stderr)에서만 검사
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // empty' 2>/dev/null)
if [ "$TOOL_NAME" != "Bash" ]; then
  exit 0
fi

OUTPUT=$(echo "$INPUT" | jq -r '.tool_output // empty' 2>/dev/null)
if [ -z "$OUTPUT" ]; then
  exit 0
fi

# 시크릿 패턴 목록
PATTERNS=(
  'sk-[a-zA-Z0-9]{20,}'           # OpenAI API key
  'sk-proj-[a-zA-Z0-9_-]{40,}'    # OpenAI project key
  'AKIA[0-9A-Z]{16}'              # AWS Access Key ID
  'ghp_[a-zA-Z0-9]{36}'           # GitHub personal access token
  'gho_[a-zA-Z0-9]{36}'           # GitHub OAuth token
  'github_pat_[a-zA-Z0-9_]{60,}'  # GitHub fine-grained PAT
  'xoxb-[0-9]{10,}-[a-zA-Z0-9]+'  # Slack bot token
  'xoxp-[0-9]{10,}-[a-zA-Z0-9]+'  # Slack user token
  'AIza[0-9A-Za-z_-]{35}'         # Google API key
  'ya29\.[0-9A-Za-z_-]+'          # Google OAuth token
  'sk_live_[a-zA-Z0-9]{24,}'      # Stripe live key
  'rk_live_[a-zA-Z0-9]{24,}'      # Stripe restricted key
  'SG\.[a-zA-Z0-9_-]{22}\.[a-zA-Z0-9_-]{43}'  # SendGrid API key
  'npd_[a-zA-Z0-9]{40,}'          # npm token
  'PRIVATE KEY-----'              # Private key block
)

FOUND=()
for PATTERN in "${PATTERNS[@]}"; do
  if echo "$OUTPUT" | grep -qE "$PATTERN" 2>/dev/null; then
    FOUND+=("$PATTERN")
  fi
done

if [ ${#FOUND[@]} -gt 0 ]; then
  echo ""
  echo "🚨 시크릿 노출 감지!"
  echo "   출력에 API 키 또는 토큰 패턴이 포함되어 있습니다."
  echo "   → 터미널 히스토리를 확인하고, 노출된 키를 즉시 로테이션하세요."
  echo "   → .env 파일이 .gitignore에 포함되어 있는지 확인하세요."
  echo ""
fi

exit 0
