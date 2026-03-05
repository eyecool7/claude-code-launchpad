# /launchpad:design

프로젝트의 디자인 DNA를 결정합니다.
개별 속성이 아닌 **Personality → 안전한 조정** 2단계로 진행합니다.

---

## 실행 흐름

### STEP 1 — Personality 선택

아래 5가지 중 하나를 선택하게 안내한다.
각 옵션은 이름 + 한 줄 설명 + 대표 키워드만 보여준다. 예시 사이트 언급은 하지 않는다.

```
어떤 디자인 성격을 원하시나요?

A. Editorial Authority
   절제된 권위감. 여백이 말하고, 타입이 구조를 만든다.
   → 여백 / 세리프 헤드라인 / 모노크롬 + 포인트 1색 / 하프톤 가능

B. Brutalist Raw
   날것의 충격. 규칙을 알고 의도적으로 깬다.
   → 강한 대비 / 하드 섀도 / 굵은 테두리 / 비대칭 그리드

C. Tech Precision
   데이터가 미학이다. 모든 요소는 기능을 따른다.
   → 모노스페이스 / 딥 다크 / 미세한 그리드선 / 색 최소화

D. Organic Warm
   손의 온기. 스크린이지만 만질 수 있을 것 같은 느낌.
   → 곡선 / 종이 질감 / 크림·어스톤 / 아날로그 타이포

E. Luxury Minimal
   있는 듯 없는 듯. 침묵이 럭셔리다.
   → 극단적 여백 / 얇은 세리프 / 골드·실버 포인트 / 마이크로 디테일
```

사용자가 선택하면 STEP 2로 진행한다.

---

### STEP 2 — 안전한 조정 옵션 제시

선택된 Personality에 따라 **아래 해당 블록만** 보여준다.
각 항목은 라디오 선택지처럼 A/B/C 형태로 제시한다.
설명은 짧게. 기술 용어 최소화.

---

#### A. Editorial Authority 선택 시

```
좋아요. Editorial Authority 안에서 3가지를 정합니다.

1. 색온도
   A) 차갑게 — 블루·그레이 계열, 날카롭고 현대적
   B) 따뜻하게 — 크림·세피아 계열, 클래식하고 진중함

2. 밀도
   A) Airy — 넓은 여백, 요소가 숨 쉬는 느낌
   B) Compact — 타이트한 그리드, 더 많은 정보 노출

3. 텍스처
   A) Clean — 텍스처 없음, 완전히 플랫
   B) Subtle — 미세한 노이즈 또는 그레인
   C) Expressive — 하프톤 또는 리소그래프 느낌

[잠금 — 변경 불가]
- 타입: 세리프 헤드라인 + 산세리프 본문 (대비가 Editorial의 핵심)
- 색상 개수: 메인 1색 + 포인트 1색 이하
- 그림자: Flat 또는 Hard shadow만 (Soft shadow 없음)
```

---

#### B. Brutalist Raw 선택 시

```
좋아요. Brutalist Raw 안에서 3가지를 정합니다.

1. 배경
   A) 백지 위 — 흰 배경, 검은 요소가 충돌
   B) 역전 — 검은 배경, 흰/원색 요소

2. 포인트 색
   A) 원색 — 빨강, 노랑, 파랑 중 1색
   B) 무채색만 — 흑백으로만 승부

3. 그리드 파괴 강도
   A) Mild — 의도적 비대칭이지만 읽기 편함
   B) Full — 요소가 겹치고, 넘치고, 깨짐

[잠금 — 변경 불가]
- 그림자: Hard shadow만 (4px~8px solid offset, blur 없음)
- 테두리: 굵은 solid border (2px 이상)
- 폰트: 임팩트 있는 굵은 산세리프 (얇은 폰트 없음)
- 모서리: 0px (완전한 직각만)
```

---

#### C. Tech Precision 선택 시

```
좋아요. Tech Precision 안에서 3가지를 정합니다.

1. 배경 모드
   A) Dark — 딥 다크 배경 (개발 툴 느낌)
   B) Light — 흰 배경 + 그레이 그리드선

2. 포인트 색
   A) Terminal Green — 클래식 터미널 (#00FF41 계열)
   B) Electric Blue — 데이터 시각화 느낌
   C) Amber — 레트로 모니터 느낌

3. 정보 밀도
   A) Focused — 핵심만, 많은 여백
   B) Dense — 데이터 대시보드처럼 빽빽하게

[잠금 — 변경 불가]
- 폰트: 모노스페이스 헤드라인 필수
- 그림자: 없음 또는 glow만 (박스 섀도 없음)
- 모서리: 0~2px (날카롭게)
- 애니메이션: 없음 또는 타이핑 커서만
```

---

#### D. Organic Warm 선택 시

```
좋아요. Organic Warm 안에서 3가지를 정합니다.

1. 질감 강도
   A) Subtle — 아주 미세한 종이 느낌
   B) Tactile — 확실히 느껴지는 질감

2. 색 팔레트
   A) Cream & Ink — 크림 배경 + 진한 잉크색
   B) Earth — 테라코타·올리브·베이지 조합
   C) Sage — 세이지 그린 + 오프화이트

3. 곡선 강도
   A) Soft — 살짝 둥근 모서리 (8~16px)
   B) Flowing — 물방울·꽃잎 형태의 유기적 곡선

[잠금 — 변경 불가]
- 폰트: 손글씨 느낌의 세리프 또는 인쇄체
- 그림자: 없음 또는 따뜻한 색상의 subtle shadow
- 그리드: 정렬보다 흐름 우선 (완벽한 열 정렬 금지)
```

---

#### E. Luxury Minimal 선택 시

```
좋아요. Luxury Minimal 안에서 3가지를 정합니다.

1. 배경
   A) Pure White — 순백, 아무것도 없는 캔버스
   B) Off-Black — 거의 검정이지만 완전한 검정은 아님 (#0A0A0A)

2. 포인트 소재
   A) Gold — 얇은 골드 선, 골드 텍스트
   B) Silver — 차가운 실버, 메탈릭
   C) No accent — 포인트 없이 타이포만으로

3. 타이포 강도
   A) Whisper — 아주 얇고 작게, 있는 듯 없는 듯
   B) Statement — 하나만 크게, 나머지는 아주 작게

[잠금 — 변경 불가]
- 폰트: 얇은 세리프 필수 (Light ~ Regular weight만)
- 여백: 최소 섹션 패딩 120px (타협 없음)
- 색상: 2색 이하 (포인트 포함)
- 애니메이션: 없음 또는 0.8s 이상의 아주 느린 페이드만
```

---

### STEP 3 — 브랜드 예외 처리

```
마지막으로 2가지만 확인합니다.

1. 브랜드 색상이 이미 있나요?
   있다면: 어떤 색인가요? (헥스코드 또는 설명)
   → 포인트 색을 이 색으로 오버라이드합니다.
   없다면: Personality 기본값을 사용합니다.

2. 다크모드가 필요한가요?
   예 / 아니오
```

---

### STEP 4 — 결과 요약 출력 후 확인

선택 내용을 아래 형식으로 요약 출력한다.

```
🎨 디자인 DNA 확정

Personality: Editorial Authority
색온도: 차갑게
밀도: Airy
텍스처: Expressive (하프톤)
브랜드색: 없음 (기본값 사용)
다크모드: 아니오

[잠금]
타입 대비: 세리프 헤드라인 + 산세리프 본문
색상 수: 2색 이하
그림자: Flat/Hard only

이 내용으로 design-rules를 생성할까요?
```

확인 받으면 STEP 5 실행.

---

### STEP 5 — design-rules 파일 생성

`.claude/skills/design-rules/` 디렉토리를 생성하고 아래 로직에 따라 6개 파일을 출력한다.

---

#### 생성 로직 개요

```
1. 선택된 Personality의 템플릿 파일 6개를 베이스로 읽는다
2. STEP 2에서 받은 조정값을 해당 파일의 특정 섹션에 오버라이드한다
3. STEP 3의 브랜드색/다크모드 설정을 02-color.md에 추가 반영한다
4. 최종 파일을 .claude/skills/design-rules/ 에 쓴다
```

---

#### 각 Personality별 오버라이드 맵

아래는 STEP 2 선택값이 어느 파일의 어느 부분을 바꾸는지 명시한다.
템플릿에 없는 내용은 추가하고, 충돌하는 내용은 선택값으로 덮어쓴다.

---

##### A. Editorial Authority 오버라이드 맵

**조정 1: 색온도 → `02-color.md` 팔레트 섹션 오버라이드**

```
차갑게 선택 시:
  Background: #F8F9FA (쿨 그레이)
  Text Primary: #0F1117 (쿨 다크)
  Accent 방향: 딥 블루/인디고 계열 (#1A1AFF / #2D3BFF)
  Surface: #F0F2F5

따뜻하게 선택 시:
  Background: #FAF7F2 (크림)
  Text Primary: #1A1208 (웜 다크)
  Accent 방향: 버건디/브라운 계열 (#8B2A2A / #6B4226)
  Surface: #F2EDE4
```

**조정 2: 밀도 → `03-space.md` 밀도 설정 섹션 오버라이드**

```
Airy 선택 시:
  섹션 패딩: 96~128px
  카드 패딩: 32px
  요소 간 최소 간격: 24px
  본문 max-width: 680px

Compact 선택 시:
  섹션 패딩: 48~64px
  카드 패딩: 20px
  요소 간 최소 간격: 16px
  본문 max-width: 800px
```

**조정 3: 텍스처 → `04-surface.md` 텍스처 섹션 오버라이드**

```
Clean 선택 시:
  텍스처 없음. 배경은 단색만.
  04-surface.md의 "텍스처: Expressive" 섹션 전체 제거 후 아래로 대체:
  "이 프로젝트는 텍스처를 사용하지 않는다. 배경은 항상 단색이다."

Subtle 선택 시:
  배경에 CSS noise 적용, opacity 0.03~0.04
  구현: background-image + SVG feTurbulence 또는 noise PNG

Expressive 선택 시:
  하프톤 패턴 적용 (템플릿 기본값 유지)
  이미지 처리: 흑백 + 하프톤 오버레이 (mix-blend-mode: multiply)
```

---

##### B. Brutalist Raw 오버라이드 맵

**조정 1: 배경 → `02-color.md` 팔레트 섹션 오버라이드**

```
백지 위 선택 시:
  Background: #FFFFFF
  Text/구조: #000000
  Hard shadow 색: #000000

역전 선택 시:
  Background: #000000
  Text/구조: #FFFFFF
  Hard shadow 색: #FFFFFF
  (모든 컴포넌트 색상 반전 적용)
```

**조정 2: 포인트 색 → `02-color.md` Accent 섹션 오버라이드**

```
원색 선택 시 → 원색 3가지 중 사용자가 고른 것:
  Raw Red: --accent: #FF0000
  Electric Yellow: --accent: #FFE600 (텍스트는 #000000)
  Brutal Blue: --accent: #0000FF

무채색만 선택 시:
  Accent 없음. 02-color.md의 Accent 섹션을 아래로 대체:
  "이 프로젝트는 Accent 색을 사용하지 않는다.
   모든 강조는 크기, 굵기, 위치로만 표현한다."
```

**조정 3: 그리드 파괴 강도 → `03-space.md` 그리드 파괴 섹션 오버라이드**

```
Mild 선택 시: 03-space.md에 "Mild 모드 활성" 명시, Full 모드 관련 내용 제거
Full 선택 시: 03-space.md에 "Full 모드 활성" 명시, 겹침/overflow 예시 유지
```

---

##### C. Tech Precision 오버라이드 맵

**조정 1: 배경 모드 → `02-color.md` + `04-surface.md` 오버라이드**

```
Dark 선택 시:
  02-color.md: Dark 모드 팔레트를 기본값으로 지정, Light 팔레트는 주석 처리
  04-surface.md: 배경 텍스처 도트 패턴 색상을 Dark 팔레트 border 색으로

Light 선택 시:
  02-color.md: Light 모드 팔레트를 기본값으로 지정, Dark 팔레트는 주석 처리
  04-surface.md: 배경 그리드선 색상을 Light 팔레트 기준으로
```

**조정 2: 포인트 색 → `02-color.md` Accent 섹션 오버라이드**

```
Terminal Green 선택 시: --accent: #00FF41 활성화, 나머지 주석
Electric Blue 선택 시:  --accent: #3B82F6 활성화, 나머지 주석
Amber 선택 시:          --accent: #F59E0B 활성화, 나머지 주석
```

**조정 3: 정보 밀도 → `03-space.md` 밀도 섹션 오버라이드**

```
Focused 선택 시: Focused 모드 내용 유지, Dense 섹션 제거
Dense 선택 시:   Dense 모드 내용 유지, Focused 섹션 제거
                 + 05-components.md 카드 패딩을 16px로 오버라이드
```

---

##### D. Organic Warm 오버라이드 맵

**조정 1: 질감 강도 → `04-surface.md` 텍스처 섹션 오버라이드**

```
Subtle 선택 시:
  Subtle 모드 CSS 코드 유지
  텍스처 opacity 범위: 0.03~0.04

Tactile 선택 시:
  Tactile 모드 CSS 코드 유지
  텍스처 opacity 범위: 0.08~0.12
  + 00-personality.md에 "이 프로젝트의 질감은 확실히 느껴져야 한다" 추가
```

**조정 2: 색 팔레트 → `02-color.md` 팔레트 섹션 오버라이드**

```
Cream & Ink 선택 시: 팔레트 A 활성화, B·C 제거
Earth 선택 시:       팔레트 B 활성화, A·C 제거
Sage 선택 시:        팔레트 C 활성화, A·B 제거

+ 선택된 팔레트의 Text Primary RGB 값으로
  04-surface.md와 05-components.md의 rgba([Text Primary RGB], ...) 자리를 채운다
```

**조정 3: 곡선 강도 → `03-space.md` + `05-components.md` 오버라이드**

```
Soft 선택 시:
  03-space.md: "곡선 강도: Soft (8~16px)" 명시
  05-components.md: 모든 border-radius를 Soft 값으로 통일
    카드: 16px / 버튼: 24px / 인풋: 10px

Flowing 선택 시:
  03-space.md: "곡선 강도: Flowing (유기적 곡선)" 명시
  05-components.md: 모든 border-radius를 Flowing 값으로 통일
    카드: 24px 8px 24px 8px / 버튼: 40% 60% 60% 40% / 50%
  04-surface.md: 섹션 divider에 clip-path 웨이브 추가
```

---

##### E. Luxury Minimal 오버라이드 맵

**조정 1: 배경 → `02-color.md` 팔레트 섹션 오버라이드**

```
Pure White 선택 시: Pure White 모드 팔레트 활성화, Off-Black 제거
Off-Black 선택 시:  Off-Black 모드 팔레트 활성화, Pure White 제거
```

**조정 2: 포인트 소재 → `02-color.md` + `04-surface.md` + `05-components.md` 오버라이드**

```
Gold 선택 시:
  02-color.md: Gold 섹션 활성화
  04-surface.md: .accent-line, .accent-label 디테일 유지
  05-components.md: 버튼 border-color를 Gold Accent로

Silver 선택 시:
  02-color.md: Silver 섹션 활성화
  (나머지 동일 구조)

No accent 선택 시:
  02-color.md: Accent 섹션 전체를 아래로 대체:
  "이 프로젝트는 포인트 색을 사용하지 않는다.
   모든 위계는 폰트 크기, 자간, 여백으로만 표현한다."
  04-surface.md: .accent-line 제거
  05-components.md: 모든 버튼을 Text Primary 색 기준으로
```

**조정 3: 타이포 강도 → `01-typography.md` 오버라이드**

```
Whisper 선택 시: Whisper 모드 스케일 활성화, Statement 제거
Statement 선택 시: Statement 모드 스케일 활성화, Whisper 제거
```

---

#### 브랜드색 오버라이드 (STEP 3)

브랜드색이 있는 경우 `02-color.md` Accent 섹션에 아래를 추가:

```markdown
## ⚠️ 브랜드 오버라이드

이 프로젝트의 Accent 색은 브랜드 색상으로 고정됩니다.
--accent: [입력받은 헥스코드]

Personality 기본 Accent 색 대신 이 색을 모든 곳에 사용합니다.
브랜드색이 Personality 규칙과 충돌할 경우 (예: Luxury Minimal에 채도 높은 색),
브랜드색을 우선하되 사용 빈도를 최소화합니다.
```

#### 다크모드 설정 (STEP 3)

다크모드가 필요한 경우 `02-color.md` 끝에 추가:

```markdown
## 다크모드

이 프로젝트는 다크모드를 지원합니다.
[Personality에 맞는 다크 팔레트 자동 생성]

구현: prefers-color-scheme: dark 또는 .dark 클래스 기반
모든 color 값은 CSS 변수로 관리하여 테마 전환을 지원합니다.
```

---

#### 실제 파일 생성 절차

```
1. mkdir -p .claude/skills/design-rules/

2. 선택된 Personality 템플릿 디렉토리에서 00~05 파일을 읽는다
   → plugins/launchpad/templates/design-rules/[personality-name]/

3. 각 파일에 위의 오버라이드 맵을 적용한다
   → 오버라이드 대상 섹션을 찾아 내용을 교체/추가/삭제

4. 브랜드색·다크모드 설정을 02-color.md에 append한다

5. 최종 6개 파일을 .claude/skills/design-rules/ 에 쓴다
```

생성 완료 후 출력:

```
✅ design-rules 생성 완료

.claude/skills/design-rules/
├── 00-personality.md   [Personality 이름]
├── 01-typography.md    [선택된 타이포 설정 요약]
├── 02-color.md         [선택된 팔레트 + 브랜드색 여부]
├── 03-space.md         [선택된 밀도 설정]
├── 04-surface.md       [선택된 텍스처/질감 설정]
└── 05-components.md    [Personality 컴포넌트 규칙]

Claude Code가 컴포넌트를 짤 때 이 규칙들을 자동으로 참조합니다.
변경하려면 /launchpad:design을 다시 실행하거나 파일을 직접 수정하세요.

다음 단계: /launchpad:setup
```

---

## 주의사항

- Personality 선택 전에 사용자에게 "좋은 선택"이나 "추천" 코멘트를 달지 않는다
- STEP 2에서 잠금 항목은 절대 조정 옵션으로 열어주지 않는다
- 파일 생성 시 CSS 변수 값보다 **판단 기준 문장** 위주로 작성한다
- 브랜드색이 있을 경우 Personality의 색상 규칙과 충돌하면 경고 후 사용자 결정을 따른다
- 오버라이드 적용 후 파일 안에서 모순되는 내용이 없는지 확인한다
  (예: Compact 밀도를 골랐는데 본문에 "넓은 여백을 유지한다"는 문장이 남아있으면 삭제)
- 템플릿의 "선택하지 않은 옵션" 관련 내용은 최종 파일에서 제거한다
  (예: Organic Warm에서 Earth 팔레트를 골랐으면 Cream & Ink, Sage 팔레트 내용 삭제)
