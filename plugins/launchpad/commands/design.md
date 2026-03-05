---
description: 프론트엔드 디자인 방향 수립. 인터랙티브 프리뷰로 무드·팔레트·효과 선택 → design-tokens.md 생성. 디자인, design, 스타일, theme, 테마 시 사용.
---

# 프론트엔드 디자인 수립

프로젝트의 시각적 정체성을 정하고, 빌드 세션에서 참조할 `design-tokens.md`를 생성한다.
setup 직후, build 전에 한 번 실행한다. 재실행 시 기존 토큰을 덮어쓴다.

**전제 조건:** `/launchpad:setup` 완료 상태. `CLAUDE.md`와 `project-plan.md` 존재.

**활용 스킬:**
- `frontend-design` — 디자인 기본 가이드 + 코드 생성
- `impeccable` — 17개 전문 디자인 커맨드 (팔레트, 타이포그래피, 모션 등)
- `theme-factory` — 큐레이팅된 프리셋 테마로 빠른 시작

## Step 0: 디자인 모드 선택

AskUserQuestion으로 사용자에게 디자인 방식을 묻는다:

```
프론트엔드 디자인을 설정합니다. 어떤 방식으로 진행할까요?

1. 기본 세팅 (화이트/블랙) — 디자인 없이 바로 빌드. 나중에 다시 실행 가능
2. 디자인 컨피규레이터 — 브라우저에서 무드·컬러·폰트를 직접 선택
```

### 선택 1: 기본 세팅

아래 기본 토큰으로 `design-tokens.md`를 즉시 생성하고 **Step 4 빌드 연동**으로 건너뛴다.

```markdown
# Design Tokens

## Identity
- Mood: Default
- Surface: Flat
- Motion: None (CSS only)

## Palette
| Role | Light | Dark |
|------|-------|------|
| primary | #18181B | #FAFAFA |
| secondary | #71717A | #A1A1AA |
| accent | #3B82F6 | #60A5FA |
| neutral-50 | #FAFAFA | #18181B |
| neutral-100 | #F4F4F5 | #27272A |
| neutral-200 | #E4E4E7 | #3F3F46 |
| neutral-700 | #3F3F46 | #D4D4D8 |
| neutral-900 | #18181B | #FAFAFA |
| success | #16A34A | #4ADE80 |
| warning | #D97706 | #FBBF24 |
| error | #DC2626 | #F87171 |
| info | #2563EB | #60A5FA |

## Typography
- Heading: Inter (weight: 600)
- Body: Inter (weight: 400)
- Mono: JetBrains Mono
- Scale: 16px / 1.25

## Spacing
- Unit: 4px
- Radius: sm/md/lg = 4px/8px/12px

## Shadows
none — border only (1px solid neutral-200)

## Motion
- Duration: 0
- Easing: none
- Patterns: none

## Action Feedback
- Level: Minimal
- Loading: 텍스트 → "처리 중..." (disabled)
- Success: 텍스트 → "완료" (1.5초 후 복귀)
- Error: 텍스트 → "실패" (error 색상)
- Toast: 없음

## Component Conventions
- Button: solid bg primary, white text, 1px border, no shadow
- Card: 1px border neutral-200, bg white, no shadow
- Input: 1px border neutral-200, focus ring accent, bg white
```

안내 후 완료:
```
기본 디자인 토큰이 설정되었습니다. (화이트/블랙, 모션 없음)
나중에 `/launchpad:design`을 다시 실행하면 커스터마이징할 수 있습니다.
```

### 선택 2: 디자인 컨피규레이터

아래 Step 1로 진행한다.

## Step 1: 인터랙티브 디자인 컨피규레이터 생성

`.claude/design-preview.html`을 생성하여 브라우저에서 연다. 사용자가 시각적으로 디자인을 조합하고 확인할 수 있는 **라이브 프리뷰 도구**다.

### 레이아웃

```
┌─────────────────────────────────────────────────────────┐
│  🎨 Design Configurator            [Dark/Light] [확정]  │
├──────────────────┬──────────────────────────────────────┤
│  컨트롤 패널      │  라이브 프리뷰                        │
│  (스크롤 가능)     │  (실시간 반영)                        │
│                  │                                      │
│  ▸ 무드 선택      │  ┌──────────────────────────────┐   │
│   ○ Clean Prof.  │  │  Heading Sample (h1)         │   │
│   ● Bold Creat.  │  │  Body text sample paragraph  │   │
│   ○ Warm Friend. │  │                              │   │
│   ○ Min. Elegant │  │  [Primary Btn] [Secondary]   │   │
│                  │  │  [Ghost Btn]                 │   │
│  ▸ 표면 선택      │  │                              │   │
│   ○ Flat         │  │  ┌─Card─┐  ┌─Card─┐         │   │
│   ● Soft Shadow  │  │  │      │  │      │         │   │
│   ○ Glass        │  │  │      │  │      │         │   │
│   ○ Neumorphism  │  │  └──────┘  └──────┘         │   │
│                  │  │                              │   │
│  ▸ 모션 선택      │  │  [Input field    ]           │   │
│   ○ None         │  │  ✓ Success  ⚠ Warn  ✕ Error │   │
│   ● Subtle       │  │                              │   │
│   ○ Expressive   │  │  ┌─Palette Swatches────────┐ │   │
│                  │  │  │ ■ ■ ■ ■ ■  ■ ■ ■ ■     │ │   │
│  ▸ Primary 컬러   │  │  └────────────────────────┘ │   │
│   [#3B82F6] 🎨   │  └──────────────────────────────┘   │
│                  │                                      │
│  ▸ 폰트 선택      │                                      │
│   Heading: [▼]   │                                      │
│   Body:    [▼]   │                                      │
│                  │                                      │
│  ▸ Radius        │                                      │
│   ○ Sharp (2px)  │                                      │
│   ● Rounded (8px)│                                      │
│   ○ Pill (999px) │                                      │
└──────────────────┴──────────────────────────────────────┘
```

### 컨트롤 패널 (왼쪽)

**라디오 버튼 그룹:**

| 그룹 | 옵션 | 변경 시 프리뷰 반영 |
|------|------|-------------------|
| 무드 (Mood) | Clean Professional, Warm Friendly, Bold Creative, Minimal Elegant | 전체 분위기 프리셋 (컬러 팔레트 + 폰트 + 여백 비율) |
| 표면 (Surface) | Flat, Soft Shadow, Glassmorphism, Neumorphism | 카드·버튼·인풋의 그림자/배경 |
| 모션 (Motion) | None, Subtle, Expressive | hover/click 시 애니메이션 강도 |
| Radius | Sharp (2px), Rounded (8px), Pill (999px) | 모든 컴포넌트 모서리 |
| 액션 피드백 (Feedback) | Minimal, Standard, Rich | 버튼 클릭 후 상태 표현 방식 |

**컬러 피커:**

| 항목 | 동작 |
|------|------|
| Primary | `<input type="color">` + HEX 직접 입력. 변경 시 Secondary/Accent 자동 파생, 프리뷰 즉시 반영 |

Secondary, Accent은 Primary에서 HSL 변환으로 자동 파생하되, 개별 오버라이드 토글 제공.

**폰트 페어링 선택:**

무드 선택 시 추천 페어링이 자동 세팅되지만, 드롭다운으로 개별 변경 가능.

| 카테고리 | Heading 후보 | Body 후보 | 적합 무드 |
|---------|-------------|----------|----------|
| **모던 산세리프** | Inter, Manrope, Space Grotesk | Inter, Source Sans 3, IBM Plex Sans | Clean Professional |
| **기하학 산세리프** | Poppins, Montserrat, Outfit | Noto Sans KR, Lato, Open Sans | Warm Friendly |
| **세리프 믹스** | Playfair Display, DM Serif Display, Merriweather | Source Serif 4, Crimson Text, Lora | Minimal Elegant |
| **특징적 디스플레이** | Space Grotesk, Sora, Clash Display | Inter, Pretendard, IBM Plex Sans | Bold Creative |
| **한국어 특화** | Pretendard, Noto Sans KR | Pretendard, Noto Sans KR | 전체 (한국어 콘텐츠) |

Mono (코드): JetBrains Mono, Fira Code, IBM Plex Mono (고정)

폰트 선택 시 Google Fonts CDN을 동적 로드하여 프리뷰에 즉시 반영. 한국어 폰트는 한글 샘플 텍스트도 함께 표시.

### 라이브 프리뷰 (오른쪽)

컨트롤 변경 시 **JavaScript로 CSS 변수를 즉시 업데이트**하여 프리뷰를 실시간 반영한다.

**프리뷰 컴포넌트:**
- Typography: h1, h2, h3, body paragraph, code block
- Buttons: Primary, Secondary, Ghost, Destructive — 각각 default / hover / active / disabled 4가지 상태 표시
- **Button 액션 데모**: "저장하기" 버튼을 클릭하면 선택한 피드백 스타일로 실제 상태 전환을 시연:
  - idle → loading (스피너/텍스트 변경) → success (체크 아이콘/색상 변경) → idle 복귀
  - idle → loading → error (에러 색상/흔들림) → idle 복귀
- Cards: 2–3장 (이미지 placeholder + 제목 + 설명)
- Form: Input + Label, Textarea, Select (focus/error/disabled 상태 포함)
- Toast/Notification: 액션 완료 시 나타나는 알림 스타일 (위치: 우상단/하단중앙)
- Status: Success/Warning/Error/Info 배지 + Alert
- Palette 스와치: 모든 색상을 HEX 코드와 함께 블록으로 표시

**Dark/Light 토글:** 우측 상단 토글 버튼. 다크모드 팔레트도 실시간 확인.

### 액션 피드백 패턴

사용자가 버튼을 누른 후 "작동했는지"를 인지하는 방식. 3단계 중 선택:

| 레벨 | 버튼 상태 | 완료 알림 | 에러 표현 |
|------|----------|----------|----------|
| **Minimal** | 텍스트 → "처리 중..." (disabled) | 텍스트 → "완료" (1.5초 후 복귀) | 텍스트 → "실패" (빨간색) |
| **Standard** | 스피너 아이콘 + disabled | Toast 알림 (우상단, 3초 후 사라짐) | Toast 에러 알림 + 버튼 흔들림 |
| **Rich** | 스피너 + 프로그레스 바 + disabled | 버튼 → 체크 아이콘 변환 + Toast + 성공 사운드(선택) | 버튼 흔들림 + 에러 모달 + 재시도 버튼 |

프리뷰에서 "저장하기" 데모 버튼을 클릭하면 선택한 레벨의 전체 플로우를 시연한다:
`idle → loading (1.5초) → success (2초) → idle`

각 피드백 레벨의 구현에 필요한 컴포넌트도 명시:

| 레벨 | 필요 컴포넌트 |
|------|-------------|
| Minimal | 없음 (버튼 텍스트 변경만) |
| Standard | Toast 컴포넌트, Spinner 아이콘 |
| Rich | Toast, Spinner, Progress Bar, Modal, Icon 변환 애니메이션 |

### 무드 프리셋

무드를 선택하면 관련 값들이 한 번에 세팅된다 (사용자가 개별 오버라이드 가능):

```javascript
const PRESETS = {
  'clean-professional': {
    primary: '#3B82F6', surface: 'soft-shadow', motion: 'subtle',
    radius: '8px', headingFont: 'Manrope', bodyFont: 'Inter',
    monoFont: 'JetBrains Mono', feedback: 'standard',
  },
  'warm-friendly': {
    primary: '#F59E0B', surface: 'soft-shadow', motion: 'subtle',
    radius: '12px', headingFont: 'Poppins', bodyFont: 'Noto Sans KR',
    monoFont: 'Fira Code', feedback: 'standard',
  },
  'bold-creative': {
    primary: '#8B5CF6', surface: 'glassmorphism', motion: 'expressive',
    radius: '16px', headingFont: 'Space Grotesk', bodyFont: 'Inter',
    monoFont: 'JetBrains Mono', feedback: 'rich',
  },
  'minimal-elegant': {
    primary: '#1F2937', surface: 'flat', motion: 'none',
    radius: '2px', headingFont: 'Playfair Display', bodyFont: 'Source Serif 4',
    monoFont: 'IBM Plex Mono', feedback: 'minimal',
  },
};
```

### 확정 버튼

우측 상단 "확정" 버튼 클릭 시:
1. 현재 선택 상태를 JSON으로 직렬화
2. `.claude/design-config.json`에 저장 (Blob URL → download, 또는 localStorage 임시 저장)
3. 화면에 "설정이 저장되었습니다. Claude Code로 돌아가세요." 메시지 표시

**저장 방식:** 브라우저에서 로컬 파일 쓰기가 제한되므로, 두 가지 방식 중 택 1:
- **방식 A (권장):** "확정" 클릭 → JSON을 `<textarea>`에 표시 + 클립보드 자동 복사. 사용자가 Claude에게 "확정했어" 라고 말하면 Claude가 클립보드에서 읽거나, 사용자가 붙여넣기.
- **방식 B:** "확정" 클릭 → JSON 파일 다운로드 (`design-config.json`). Claude가 다운로드 폴더에서 읽음.

### HTML 생성 규칙

- **단일 파일.** `<style>` + `<script>` 인라인. 외부 의존성은 Google Fonts CDN만.
- CSS 변수 기반: `--primary`, `--secondary`, `--accent`, `--neutral-50` ~ `--neutral-900`, `--success`, `--warning`, `--error`, `--info`, `--radius`, `--shadow`, `--font-heading`, `--font-body`
- 반응형: 1200px 이상이면 좌우 분할, 미만이면 상하 분할 (컨트롤 위, 프리뷰 아래)
- 팔레트 자동 파생: Primary HSL → Secondary (hue ±30), Accent (hue ±180, saturation ↑), Neutral (saturation 10%, lightness 5단계)

### 브라우저 열기

```bash
open .claude/design-preview.html
```

사용자에게 안내:

```
디자인 컨피규레이터가 브라우저에서 열렸습니다.
왼쪽에서 무드·컬러·폰트를 선택하면 오른쪽 프리뷰에 바로 반영됩니다.
마음에 드는 조합을 찾으면 우측 상단 [확정] 버튼을 눌러주세요.
```

## Step 2: 설정 수신 + 효과 라이브러리 확정

사용자가 "확정했어" (또는 JSON 붙여넣기)라고 하면:

1. 확정된 설정 JSON을 파싱
2. 모션 선택에 따른 효과 라이브러리를 확정한다:

| 모션 선택 | 기본 추천 | 대안 |
|-----------|----------|------|
| None | CSS only | — |
| Subtle | CSS transitions + `@starting-style` | Tailwind `animate-*` |
| Expressive | Framer Motion | React Spring, Auto Animate |

3. 사용자에게 라이브러리 추천을 간단히 안내하고 승인받는다.

## Step 3: design-tokens.md 생성

확정된 설정 JSON + 효과 라이브러리를 기반으로 `design-tokens.md`를 생성한다.
**50–80줄, compact 포맷.** 빌드 세션에서 매번 참조하므로 간결해야 한다.

### 파일 위치

```
.claude/design-tokens.md
```

### 파일 구조

```markdown
# Design Tokens

## Identity
- Mood: {무드명}
- Surface: {표면명}
- Motion: {모션명} ({라이브러리명})

## Palette
| Role | Light | Dark |
|------|-------|------|
| primary | #XXXXXX | #XXXXXX |
| secondary | #XXXXXX | #XXXXXX |
| accent | #XXXXXX | #XXXXXX |
| neutral-50 | #XXXXXX | #XXXXXX |
| neutral-100 | #XXXXXX | #XXXXXX |
| neutral-200 | #XXXXXX | #XXXXXX |
| neutral-700 | #XXXXXX | #XXXXXX |
| neutral-900 | #XXXXXX | #XXXXXX |
| success | #XXXXXX | #XXXXXX |
| warning | #XXXXXX | #XXXXXX |
| error | #XXXXXX | #XXXXXX |
| info | #XXXXXX | #XXXXXX |

## Typography
- Heading: {폰트명} (weight: 600–700)
- Body: {폰트명} (weight: 400)
- Mono: {폰트명}
- Scale: {base}px / {ratio} (예: 16px / 1.25)

## Spacing
- Unit: {N}px
- Radius: {sm/md/lg} = {값}

## Shadows
{표면 스타일에 따른 그림자 정의. Flat이면 "none — border only"}

## Motion
- Duration: {fast/normal/slow} = {값}
- Easing: {이징 함수}
- Patterns: {주요 인터랙션 패턴 한 줄씩}

## Action Feedback
- Level: {Minimal/Standard/Rich}
- Loading: {스피너 스타일 설명}
- Success: {완료 표현 방식}
- Error: {에러 표현 방식}
- Toast: {위치, 지속시간} (Standard/Rich만)

## Component Conventions
- Button: {variant별 스타일 한 줄 요약 — primary/secondary/ghost/destructive}
- Card: {카드 스타일 한 줄 요약}
- Input: {인풋 스타일 한 줄 요약 — focus/error/disabled 포함}
```

### 생성 규칙

- Light/Dark 모드 모두 정의 (다크모드가 불필요해도 기본 제공)
- CSS 변수명이 아닌 **역할 기반 이름** 사용 (구현 시 프레임워크에 맞게 변환)
- 폰트는 Google Fonts에서 사용 가능한 것으로 선택
- 80줄 초과 금지. 초과 시 Component Conventions를 줄여 조정

## Step 3.5: [선택] Figma 미세 조정

생성된 `design-tokens.md`를 사용자에게 보여준 후 안내한다:

```
design-tokens.md가 생성되었습니다.

이대로 빌드를 진행할 수 있습니다.
Figma에서 미세 조정하고 싶으면:
1. Figma Tokens Plugin (무료)으로 토큰을 JSON으로 import
2. Figma에서 시각적으로 조정
3. JSON export → design-tokens.md에 반영

이 단계를 건너뛰어도 빌드에 영향 없습니다.
```

이 단계는 **안내만** 한다. 자동 실행하지 않는다.

## Step 4: 빌드 연동

### 4-1. rules/frontend/styles.md 업데이트

`design-tokens.md`의 팔레트와 타이포그래피를 `.claude/rules/frontend/styles.md`에 반영한다.
이미 파일이 있으면 Edit으로 업데이트, 없으면 생성.

### 4-2. CLAUDE.md 핵심 경로에 추가

CLAUDE.md의 핵심 경로 섹션에 `design-tokens.md` 경로를 추가한다:

```
.claude/design-tokens.md  # 디자인 토큰 (팔레트, 타이포, 모션)
```

### 4-3. 정리

`.gitignore`에 프리뷰 파일 추가:

```
.claude/design-preview.html
.claude/design-config.json
```

### 4-4. 완료 안내

```
디자인 토큰이 설정되었습니다.

| 항목 | 결과 |
|------|------|
| 무드 | {무드명} |
| 표면 | {표면명} |
| 모션 | {모션명} + {라이브러리명} |
| Primary | {컬러코드} |
| 폰트 | {Heading} / {Body} |
| 파일 | .claude/design-tokens.md ({줄 수}줄) |

`/launchpad:build`를 실행하면 이 토큰을 기반으로 UI를 구축합니다.
```

## 주의사항

- 이 커맨드는 `design-preview.html`, `design-tokens.md`, `styles.md`를 생성·수정한다. 실제 UI 코드는 건드리지 않는다.
- 빌드 세션에서 `frontend-design`, `impeccable`, `design-rules` 스킬이 이 토큰을 참조하여 코드를 생성한다.
- 토큰을 변경하고 싶으면 이 커맨드를 재실행한다. 기존 파일을 덮어쓴다.
- theme-factory 프리셋을 사용하면 무드 프리셋으로 빠르게 시작할 수 있다. 사용자가 "프리셋으로 하자"고 하면 theme-factory 스킬을 invoke하여 프리셋 목록을 보여준다.
- design-preview.html은 단일 HTML 파일이며 빌드에 포함되지 않는다. 디자인 확인 용도로만 사용.
