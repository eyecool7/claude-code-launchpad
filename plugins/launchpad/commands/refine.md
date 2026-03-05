---
description: 프로젝트 계획서 고도화 프롬프트를 파일로 생성. Claude Code에서 사용.
---

# 프로젝트 계획서 고도화

## 실행 절차

1. Bash 도구로 플러그인 루트 경로를 읽는다:
   ```bash
   PLUGIN_ROOT=$(cat /tmp/.launchpad-root 2>/dev/null)
   if [ -z "$PLUGIN_ROOT" ]; then
     PLUGIN_ROOT="${CLAUDE_PLUGIN_ROOT:-}"
   fi
   if [ -z "$PLUGIN_ROOT" ]; then
     for CANDIDATE in ~/.claude/plugins/launchpad ./plugins/launchpad; do
       if [ -f "$CANDIDATE/.claude-plugin/plugin.json" ]; then
         PLUGIN_ROOT="$CANDIDATE"
         break
       fi
     done
   fi
   echo "${PLUGIN_ROOT:-NOT_FOUND}"
   ```
   출력된 경로를 `PLUGIN_ROOT`로 사용한다.
   NOT_FOUND이면 → "플러그인 경로를 찾을 수 없습니다. Claude Code를 재시작하거나 플러그인 설치를 확인하세요." 안내 후 중단.

2. Read 도구로 템플릿 파일을 읽는다:
   `$PLUGIN_ROOT/templates/project-refine-prompt.md`

3. skill-discovery SKILL.md를 프로젝트에 미리 복사한다 (refine 프롬프트에서 참조하므로):
   - 소스: `$PLUGIN_ROOT/templates/skills/skill-discovery/SKILL.md`
   - 대상: `.claude/skills/skill-discovery/SKILL.md`
   - `.claude/skills/skill-discovery/` 디렉토리가 없으면 생성한다.
   - 이미 존재하면 덮어쓰지 않는다.

4. Write 도구로 프로젝트 루트에 `project-refine-prompt.md`로 저장한다.

5. 사용자에게 다음만 전달한다:

---

`project-refine-prompt.md` 파일을 프로젝트 루트에 생성했습니다.

**사용법:**
1. `project-refine-prompt.md`를 열어서 프롬프트 내용을 **claude code** 채팅창에 붙여넣습니다.
2. claude code 와 대화하며 `project-plan.md` 계획서를 고도화하세요.
3. 수정된 계획서를 프로젝트 루트에 project-plan.md로 다시 저장합니다. (기존 파일 덮어쓰기)
4. **`/clear` 후** `/launchpad:setup` 명령어를 실행하여 다음 단계로 넘어갑니다.
   - refine 대화 히스토리가 setup 컨텍스트를 오염시키므로 반드시 `/clear`로 정리.

**전제 조건:**
- 계획서 작성이 완료되어 `project-plan.md`가 프로젝트 루트에 있어야 한다.
- /launchpad:plan 을 먼저 거쳐야 함

---

**중요: 템플릿 내용을 화면에 출력하지 말 것. 파일 저장 + 위 안내만 출력.**
