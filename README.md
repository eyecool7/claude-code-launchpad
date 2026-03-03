# Claude Code Launchpad

바이브 코더를 위한 컨텍스트 최적화 워크플로우

Optimized PBS 하나로 프로젝트 맞춤 계획(Plan)부터 구축(Build), 보안(Shield)까지 원스톱으로.

[English](README.en.md)

---

## Optimized PBS

| 요소 | 의미 | 포함 |
|------|------|------|
| **Plan** (계획) | 프로젝트 맞춤 설계도 | CLAUDE.md, Rules, Skills, decisions.md, lessons.md |
| **Build** (구축) | 자동화된 구축 시스템 | Agents, Commands, Phase별 구축 가이드, TDD 판정 |
| **Shield** (보안) | 철통 보안 파이프라인 | 보안 훅 7개, /security 스캔, pre-commit 검증 |

> **Optimized** = 각 프로젝트의 스택, 규모, 요구사항에 맞춰 컨텍스트를 최적화하는 워크플로우 + 철통보안

---

## 이런 분을 위한 워크플로우입니다

- 계획서가 중요한 건 아는데 뭘 적어야 할지 모르겠는 분
- CLAUDE.md, 서브에이전트, 스킬, MCP — 뭘 어떻게 세팅해야 할지 막막한 분
- 세팅에서 끝나지 않고, 매 세션마다 계획서 기반으로 구축을 가이드받고 싶은 분
- 세션이 바뀔 때마다 맥락을 잃어 같은 실수를 반복하는 분

---

## 어떻게 작동하나요?

Optimized PBS 순서대로 5단계 명령어를 따라가면, 프로젝트 세팅과 구축이 완성됩니다.

0. **`/launchpad:guide`** — 온보딩: 전체 워크플로우 안내 (처음 사용 시)
1. **`/launchpad:plan`** — 계획서 작성: 구조화된 인터뷰를 통해 프로젝트 계획서 생성
2. **`/launchpad:refine`** — 계획서 고도화: 기술 심층 리뷰와 스킬·MCP 탐색으로 계획서 완성
3. **`/launchpad:setup`** — 프로젝트 세팅: 계획서 기반 CLAUDE.md 및 설정 파일 자동 생성
4. **`/launchpad:build`** — 프로젝트 구축: 매 세션마다 현황 분석과 구축 계획 제시

---

## 핵심 기능

### 1. 2-pass 계획서 설계

claude.ai에서 인터뷰로 기획 → Claude Code에서 기술 심층 리뷰. 두 단계를 거쳐 빈틈 없는 계획서를 완성합니다. 1-pass에서는 제품 컨텍스트, 핵심 기능, 워크플로우, 구현 순서를 구조화된 인터뷰로 잡고, 2-pass에서는 스택 호환성 검증, 의존성 충돌 점검, 필요한 스킬·MCP 추천까지 기술적 깊이를 더합니다. 각 단계에 맞는 project-plan-prompt와 project-refine-prompt를 제공하므로, 프롬프트를 직접 작성할 필요가 없습니다.

### 2. Optimized PBS 자동화

/plan → /refine → /setup → /build 명령어를 순서대로 실행하면 계획/세팅/구축이 완성됩니다. setup 단계에서 CLAUDE.md, rules, skills, agents, commands, hooks, settings까지 24개 파일이 계획서 기반으로 자동 생성됩니다. CLAUDE.md의 길이, 보안 설정의 수준, 에이전트 구성까지 모두 계획서가 결정하므로 일관된 프로젝트 환경이 만들어지고 기획의도에 충실한 결과물이 구축됩니다.

### 3. Tier별 작업 모드

프로젝트 규모에 따라 작업 방식을 자동 판단하여 필요한 에이전트 구조와 스킬을 갖춥니다. 계획서의 기능 수, Phase 구조, 병렬 작업 가능 여부를 분석해서 Tier를 결정합니다. Tier가 올라갈수록 독립 에이전트, 에이전트 간 통신 스킬 등 더 복잡한 구성이 자동으로 추가됩니다.

| Tier | 모드 | 적합한 경우 |
|------|------|-------------|
| 1 | 순차 작업 | 기능 3개 이하, 단순한 프로젝트 |
| 2 | 서브에이전트 | 독립 작업 블록이 있고 컨텍스트 절약이 필요한 경우 |
| 3 | 에이전트 팀 | 대규모 병렬 세션, 에이전트 간 소통이 필요한 경우 |

### 4. 스킬·MCP 자동 탐색

refine 단계에서 계획서의 기술 스택과 요구사항을 분석하여 커뮤니티 카탈로그에서 필요한 스킬과 MCP 서버를 자동으로 검색합니다. 검색 결과는 목록으로 제시되며, 사용자가 확인한 항목만 설치됩니다. Remotion, Stripe, react-pdf 같은 특정 라이브러리 전용 스킬도 자동으로 찾아줍니다.

### 5. 세션 간 컨텍스트 연속

`decisions.md`에는 기술 결정(스택 변경, API 확정, 설계 변경 등)이, `lessons.md`에는 빌드 실패 원인과 해결책이 자동으로 축적됩니다. 새 세션에서 `/launchpad:build`를 실행하면 계획서 전체 + 축적된 기록 + `git log`를 읽고, 어디까지 완료했는지 판별한 뒤 오늘 할 일을 제시합니다. 며칠 후 돌아와도 맥락을 처음부터 설명할 필요가 없습니다.

### 6. 철통 보안 (Shield)

7개 보안 훅이 개발 전 과정을 자동으로 감시합니다. API 키 유출 감지(secret-guard), 위험 명령 차단(command-guard), 민감 파일 수정 알림(security-trigger), 파괴적 SQL 차단(db-guard), 커밋 전 검증(pre-commit-check)이 자동 작동합니다. `/launchpad:security`로 CWE Top 25 기반 보안 스캔도 수시로 실행할 수 있습니다. setup 과정에서는 검증 스크립트가 스택 충돌, 환경 설정 누락, 보안 허점을 사전에 잡아냅니다.

---

## 설치 방법

### 방법 1: Claude Code 플러그인 (권장)

Claude Code 안에서 먼저 마켓플레이스를 추가합니다.

```
/plugin marketplace add eyecool7/claude-code-launchpad
```

그 다음 플러그인을 설치합니다.

```
/plugin install launchpad@eyecool7
```

### 방법 2: 터미널 CLI

일반 터미널 (zsh/bash)에서 아래를 복붙하여 실행하세요.

```bash
claude plugin marketplace add eyecool7/claude-code-launchpad
claude plugin install launchpad@eyecool7

# 설치 확인
claude plugin list
```

### 요구사항

- Claude Code v1.0.33 이상 (`claude --version`)
- 업데이트: `npm update -g @anthropic-ai/claude-code`

---

## 단계별 사용 가이드

### Step 0. 가이드 (처음 사용 시)

`/launchpad:guide` 명령어 실행 → 전체 워크플로우와 생성되는 파일 안내 출력

### Step 1. 계획서 작성

`/launchpad:plan` 명령어 실행 → `project-plan-prompt.md` 자동 생성 → 프롬프트를 claude.ai에 붙이고 인터뷰를 통해 `project-plan.md` 완성 → 프로젝트 루트에 `project-plan.md` 저장

> **명령어 실행 시 안내 문구:**
> 1. `project-plan-prompt.md`를 열어서 `[프로젝트 이름]`과 `프로젝트 개요`를 채우세요.
> 2. 프롬프트 전체 내용을 **claude.ai** 채팅창에 붙여넣고 대화하며 계획서를 완성하세요.
> 3. 완성된 계획서를 `project-plan.md`로 저장하고 프로젝트 루트에 넣으세요.
> 4. `/launchpad:refine`을 실행하여 다음 단계로 넘어갑니다.

### Step 2. 계획서 고도화

`/launchpad:refine` 명령어 실행 → `project-refine-prompt.md` 자동 생성 → 프롬프트를 Claude Code에 붙이고 기술 리뷰 + 스킬/MCP 검색 → `project-plan.md` 고도화 → 프로젝트 루트에 저장 (엎어쓰기)

> **명령어 실행 시 안내 문구:**
> 1. `project-refine-prompt.md`를 열어서 프롬프트 내용을 **Claude Code** 채팅창에 붙여넣습니다.
> 2. Claude Code와 대화하며 `project-plan.md` 계획서를 고도화하세요.
> 3. 수정된 계획서를 프로젝트 루트에 `project-plan.md`로 다시 저장합니다.
> 4. `/launchpad:setup`을 실행하여 다음 단계로 넘어갑니다.

### Step 3. 프로젝트 세팅

`/launchpad:setup` 명령어 실행 → 계획서 기반 스킬/MCP 서칭 → 세팅 미리보기 출력/컨펌 → CLAUDE.md 및 설정파일 자동 생성 → 셋업 완료 시 `project-plan.md`에 **셋업 결과** 자동 추가 (`/clear` 후에도 셋업 맥락 보존 가능)

> **세팅 미리보기 출력 후 승인을 받고 실행합니다:**
>
> ```
> 📁 생성될 파일 (22개)
> ├── CLAUDE.md (약 82줄)
> ├── .claude/
> │   ├── rules/     → conventions, security, error-handling, testing, frontend
> │   ├── skills/    → project-directory, easy-refactoring, skill-discovery
> │   ├── agents/    → test-runner, code-reviewer, debugger, script-analyzer
> │   ├── commands/  → /check, /review, /commit-push-pr
> │   ├── hooks/     → session-start, edit-monitor, pre-commit-check
> │   │                + secret-guard, command-guard, security-trigger
> │   └── settings.json, lessons.md, decisions.md
> └── .mcp.json (생성 안 함)
>
> 🔌 추가 스킬: remotion-community (커뮤니티 설치)
> 🤖 작업 방식: Tier 2 — 서브에이전트
> 🛡️ 보안: 훅 6개 활성화
> ⚠️ 호환성 주의: Remotion + Next.js 번들러 충돌 (격리 필요)
>
> 이 내용으로 세팅을 진행할까요?
> ```
>
> 승인하면 세팅 실행 → 완료 후 `/clear` → `/launchpad:build`로 구축 시작.

### Step 4. 구축 시작

`/launchpad:build` 명령어 실행 → 계획서 기반 현황 분석 + 구축 계획 출력 → 구축 시작 (며칠 후 재진입해도 계획서 전체 + `decisions.md`, `lessons.md`, `git log`를 읽고 현재 진행 지점 판별)

> **출력 예시:**
> 📋 **프로젝트 현황**
>
> | Phase | 상태 | 비고 |
> |-------|:----:|------|
> | Phase 1: 프로젝트 기반 | ⬜ | 미시작 |
> | Phase 2: 스크립트 파싱 | 🔒 | Phase 1 완료 후 시작 |
> | Phase 3: 콘텐츠 생성 | 🔒 | Phase 2 완료 후 시작 |
> | Phase 4: 배포 연동 | 🔒 | Phase 3 완료 후 시작 |
>
> **현재 Phase:** Phase 1 — 프로젝트 기반
>
> 🔧 **이번 세션 구축 순서**
>
> | # | 작업 | 담당 에이전트 | 활용 스킬 | TDD | 완료 기준 |
> |---|------|:----------:|----------|:---:|----------|
> | 1 | Next.js + Tailwind + shadcn/ui 초기화 | — | dependencies | ❌ | `pnpm dev` 정상 실행 |
> | 2 | 폴더 구조 생성 (`src/app`, `src/lib`, `src/remotion`) | — | project-directory | ❌ | 계획서 폴더 구조와 일치 |
> | 3 | 공통 타입 정의 (`src/types/index.ts`) | — | — | ✅ | 테스트 먼저 → `pnpm run typecheck` 통과 |
>
> **Ralph Loop:** 작업 1,2,3 ✅ (기계적 검증 가능)
>
> 이 순서로 진행할까요?
>
> **주의사항:** Section 7 — Remotion + Next.js 번들러 충돌 (src/remotion/에 격리, Next.js 빌드에서 제외)

---

## 계획서에 포함되는 내용

| 섹션 | 내용 | 필수 |
|------|------|:----:|
| 1. 제품 컨텍스트 | 한줄요약, 배경, 핵심기능+우선순위, 성공기준, 범위밖 | ✅ |
| 2. 워크플로우 | 사용자 플로우, LLM vs 스크립트 구분, 검증+실패처리 | ✅ |
| 3. 툴 설계 | MCP 서버 선정, 스킬 선정, .mcp.json 확정 | ✅ |
| 4. 구현 설계 | 기술스택, 에이전트구조, 스킬목록, 에러전략, 의존성 | ✅ |
| 5. 기술 결정 | UI도구, 데이터흐름, URL구조, 외부서비스 | ⚪ |
| 6. 구현 순서 | Phase별 실행 계획 — 에이전트·스킬·파일 위치·검증 방법 매핑 (섹션 1-5 종합) | ✅ |

---

## 산출물

### CLAUDE.md 설계 철학

> *"Claude가 이미 아는 건 쓰지 마라. 프로젝트만의 규칙만 남겨라."*
> — [Andrej Karpathy의 Claude Code 원칙](https://github.com/forrestchang/andrej-karpathy-skills) 참고

생성되는 CLAUDE.md는 이 원칙을 따릅니다. Claude가 기본적으로 따르는 범용 모범 사례(PR 분리, 에러 후 재시도 등)는 제외하고, **이 프로젝트에서만 유효한 규칙** — 스택 충돌 경고, 검증 명령어, 핵심 경로, 기록 트리거 — 만 80줄 이내로 담아 컨텍스트를 최적화합니다.

### 항상 생성 (24개 파일)

| 카테고리 | 파일 | 역할 |
|---------|------|------|
| **CLAUDE.md** | 1개 | 계획서 기반 ~80줄. 매 세션 자동 로드 |
| **Rules** | conventions, security, error-handling, testing | 관련 파일 작업 시 자동 로드 |
| **Skills** | project-directory, easy-refactoring, skill-discovery | 파일 배치·리팩토링·외부 스킬 검색 |
| **Agents** | test-runner, code-reviewer, debugger | 테스트·리뷰·디버깅 위임 |
| **Commands** | /check, /review, /commit-push-pr, /security | 타입체크+린트+테스트, 코드리뷰, PR 생성, 보안 스캔 |
| **Hooks** | session-start, edit-monitor, pre-commit-check, secret-guard, command-guard, security-trigger | 세션 시작·편집 감시·커밋 전 검증·시크릿 감지·위험 명령 차단·민감 파일 알림 |
| **기록** | decisions.md, lessons.md | 기술 결정 + 실수/해결책 축적 |
| **설정** | settings.json | 권한/hooks 설정 |

### 조건부 생성

| 파일 | 조건 |
|------|------|
| rules/frontend/ | 프론트엔드 프로젝트 |
| rules/database.md | 백엔드 + DB 사용 |
| skills/design-rules/ | 프론트엔드 프로젝트 |
| skills/ui-ux-pro-max/ | 프론트엔드 (외부 스킬 자동 설치) |
| skills/dependencies/ | 의존성 충돌 감지 시 |
| skills/{도메인-스킬}/ | 계획서에 정의된 스킬 |
| agents/{커스텀}.md | Tier 2+ 에이전트 (계획서 정의) |
| skills/agent-teams/ | Tier 3 에이전트 팀 |
| .mcp.json | MCP 서버 선정 시 |

---

## 셋업 완료 후 프로젝트

```
my-project/
├── CLAUDE.md                  ← ~80줄. 매 세션 자동 로드
├── .claude/
│   ├── commands/              ← /review, /check, /commit-push-pr
│   ├── hooks/                 ← session-start, edit-monitor, pre-commit-check
│   │                             + secret-guard, command-guard, security-trigger
│   ├── rules/                 ← conventions, security, error-handling, testing (+조건부)
│   ├── skills/                ← project-directory, easy-refactoring, skill-discovery (+조건부)
│   ├── agents/                ← test-runner, code-reviewer, debugger (+조건부)
│   ├── decisions.md           ← 기술 결정 기록
│   ├── lessons.md             ← 실수/해결책 축적
│   └── settings.json
├── .mcp.json                  ← MCP 서버 (선택)
└── project-plan.md            ← 참조용 유지
```

**자동 작동:**
- **Rules** — 에러/보안/테스트/컨벤션 규칙이 관련 파일 작업 시 자동 로드
- **Skills** — 파일 배치, 리팩토링, 디자인 워크플로우 자동 발견
- **Agents** — 복잡한 테스트/리뷰/디버깅은 전담 에이전트가 독립 컨텍스트에서 처리
- **Decisions/Lessons** — 기술 결정·실수 기록이 쌓이면 세션마다 알림
- **Skill Discovery** — 외부 스킬이 필요하면 자동 검색·제안 (설치 전 사용자 확인)

---

## 구성요소

| 구성요소 | 설명 |
|----------|------|
| 커맨드 (6개) | `/launchpad:guide`, `plan`, `refine`, `setup`, `build`, `security` |
| 템플릿 (32개) | CLAUDE.md, rules, skills, agents, commands, hooks(보안 4개 포함), settings, records 생성용 + 프롬프트 2개 |
| 스크립트 (3개) | analyze-project, validate-env, validate-setup |

---

## 플러그인 구조

```
claude-code-launchpad/
├── .claude-plugin/marketplace.json
├── plugins/launchpad/
│   ├── .claude-plugin/plugin.json
│   ├── commands/          ← guide, plan, refine, setup, build
│   ├── templates/         ← 생성 시 참조할 템플릿
│   └── scripts/           ← 분석/검증 스크립트
├── README.md
├── README.en.md
└── LICENSE
```

---

## 참고

| 참고 자료 | 설명 |
|-----------|------|
| [Andrej Karpathy's Claude Code Skills](https://github.com/forrestchang/andrej-karpathy-skills) | CLAUDE.md 설계 철학 — 간결함, 프로젝트 특화 규칙만 유지 |
| [Awesome Claude Skills](https://github.com/travisvn/awesome-claude-skills) (⭐ 7.9k) | 스킬 카탈로그 원본 소스 |
| [Awesome Claude Code](https://github.com/hesreallyhim/awesome-claude-code) (⭐ 25.6k) | Claude Code 리소스 집대성 |
| [vive-md](https://github.com/johunsang/vive-md) | 위 소스들의 한국어 가이드 통합본. 스킬/MCP 검색에 사용 |
| [@trq212 (Thariq)](https://x.com/trq212) | spec 기반 개발 워크플로우 원안 |

---

## 라이선스

MIT
