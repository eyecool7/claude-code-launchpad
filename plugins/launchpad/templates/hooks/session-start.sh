#!/bin/bash
# SessionStart hook — 컨텍스트 로드 + 설정 변경 감지

mkdir -p .claude/cache

HASH_FILE=".claude/cache/.config-hash"
CONTEXT_FILE=".claude/cache/project-context.md"

# 디렉토리 확인
echo "📂 작업 디렉토리: $(pwd)"

# 해시 계산 함수 (Linux/macOS 일관성 보장)
_compute_hash() {
  cat CLAUDE.md .claude/settings.json 2>/dev/null | \
    if command -v md5sum &>/dev/null; then
      md5sum | cut -d' ' -f1
    elif command -v md5 &>/dev/null; then
      md5
    else
      echo "nohash"
    fi
}

# Hash 체크
if [ ! -f "$HASH_FILE" ]; then
  # 최초 세션: hash 생성만, refresh 스킵
  _compute_hash > "$HASH_FILE"
  echo "📎 첫 세션 감지. 설정 hash 생성 완료."
else
  CURRENT_HASH=$(_compute_hash)
  SAVED_HASH=$(cat "$HASH_FILE" 2>/dev/null)
  if [ -n "$CURRENT_HASH" ] && [ "$CURRENT_HASH" != "$SAVED_HASH" ]; then
    echo "⚠️ CLAUDE.md 또는 settings.json이 변경되었습니다. settings.json 변경은 다음 세션에서 반영됩니다."
  fi
fi

# 컨텍스트 로드
if [ -f "$CONTEXT_FILE" ]; then
  LINE_COUNT=$(wc -l < "$CONTEXT_FILE")
  echo "📎 프로젝트 컨텍스트 로드 완료 (${LINE_COUNT}줄)"
fi

# Lessons 로드
LESSONS_FILE=".claude/lessons.md"
if [ -f "$LESSONS_FILE" ]; then
  LESSON_COUNT=$(grep -c "^### " "$LESSONS_FILE" 2>/dev/null || echo "0")
  if [ "$LESSON_COUNT" -gt 0 ]; then
    echo "📎 Lessons: ${LESSON_COUNT}건 — 최근 기록:"
    grep -B0 -A3 "^### " "$LESSONS_FILE" | tail -20
  fi
fi

# Decisions 로드
DECISIONS_FILE=".claude/decisions.md"
if [ -f "$DECISIONS_FILE" ]; then
  DECISION_COUNT=$(grep -c "^### " "$DECISIONS_FILE" 2>/dev/null || echo "0")
  if [ "$DECISION_COUNT" -gt 0 ]; then
    echo "📎 Decisions: ${DECISION_COUNT}건 — 최근 기록:"
    grep -B0 -A4 "^### " "$DECISIONS_FILE" | tail -25
  fi
fi

exit 0
