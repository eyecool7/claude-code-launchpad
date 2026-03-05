# Typography — Luxury Minimal

## 핵심 원칙

타이포그래피는 속삭인다. 소리치지 않는다.
얇은 세리프가 주인공이고, 극단적인 크기 대비가 긴장감을 만든다.

## 타입 스케일

극단적 스케일 대비. 아주 크거나 아주 작다.

| 역할 | 크기 | 비고 |
|------|------|------|
| Display | 80~120px | 얇은 세리프, weight 300 |
| H1 | 56px | |
| H2 | 36px | |
| H3 | 24px | |
| Body | 15px | |
| Body Small | 13px | |
| Label / Caption | 10~11px | 대문자 + 넓은 자간 |

Display와 Label의 크기 차이가 **10배 이상**이다. 이 대비가 Luxury의 생명이다.

## 폰트 역할 분배

```
헤드라인 (Display~H2): 얇은 세리프
→ Cormorant Garamond / EB Garamond / Playfair Display 중 택1
→ weight: 300 (Light) — 400까지만 허용
→ 굵은 weight 금지 (600 이상)

본문 (Body): 산세리프 또는 얇은 세리프
→ Inter (weight 300~400) / DM Sans (weight 300~400)
→ 또는 본문도 세리프 (Cormorant weight 400)

라벨 / 캡션: 산세리프
→ weight 300, ALL CAPS, 넓은 자간
```

## 자간 (Letter Spacing) 규칙

| 역할 | 자간 |
|------|------|
| Display / H1 | 0 ~ -0.01em |
| H2 / H3 | 0 |
| Body | 0.01em (아주 미세하게) |
| Label / Caption (ALL CAPS) | +0.15em ~ +0.2em |
| 버튼 텍스트 | +0.2em |

**+0.15em 이상의 넓은 자간 + ALL CAPS**가 Luxury Minimal의 서명이다.

## 행간 (Line Height)

| 역할 | 행간 |
|------|------|
| Display | 1.0~1.1 |
| H1~H3 | 1.2 |
| Body | 1.8 (넉넉하게) |
| Label | 1.4 |

본문 행간 1.8은 호흡을 만든다. 1.6 이하로 줄이지 않는다.

## 금지 조합

- weight 600 이상 전면 금지
- Bold(700) 전면 금지 — 굵은 글자는 소리치는 것이다
- 둥근 산세리프 (Nunito, Quicksand) 금지
- 모노스페이스 금지 (코드 블록 제외)
- 자간이 좁은(-0.03em 이하) 헤드라인 금지
- 3개 이상 폰트 패밀리 금지

## ALL CAPS 사용 기준

Label, Caption, 버튼 텍스트, 네비게이션 메뉴에만.
반드시 넓은 자간(+0.15em 이상)과 함께 사용한다.
헤드라인에 ALL CAPS 금지 — 헤드라인은 sentence case로 우아하게.

## Claude에게

글자가 "두꺼워 보인다"면 weight를 낮춰라. 300이 기본이다.
자간을 넓히고 싶을 때는 +0.15em 이상으로. 중간은 없다 — 좁거나 넓거나.
