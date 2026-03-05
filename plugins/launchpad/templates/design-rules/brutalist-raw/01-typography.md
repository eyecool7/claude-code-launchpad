# Typography — Brutalist Raw

## 핵심 원칙

타이포그래피가 이미지를 대체한다.
글자 자체가 비주얼이다. 크고, 굵고, 대문자로.

## 타입 스케일

과격한 스케일. 중간이 없다 — 크거나 작거나.

| 역할 | 크기 | 비고 |
|------|------|------|
| Display | 120~200px | 화면을 채울 정도로 |
| H1 | 72px | 대문자 필수 |
| H2 | 48px | 대문자 권장 |
| H3 | 28px | |
| Body | 16px | |
| Label / Caption | 11px | 대문자 + 넓은 자간 |

Display는 뷰포트 너비를 넘어도 된다. 잘려도 된다.

## 폰트 역할 분배

```
헤드라인 (Display~H2): 극도로 굵은 산세리프
→ Inter Black (900) / Archivo Black / Anton
→ 세리프 금지

본문 (Body): 산세리프
→ Inter / DM Sans
→ weight: 400~500

코드 블록: 모노스페이스
→ JetBrains Mono / Fira Code

한 프로젝트에 2개 패밀리만. 3개 이상 금지.
```

## 자간 (Letter Spacing) 규칙

| 역할 | 자간 |
|------|------|
| Display / H1 | -0.03em ~ -0.05em (좁게 압축) |
| H2 / H3 | -0.02em |
| Body | 0 |
| Label / Caption | +0.12em (넓게 — 대문자와 함께) |
| ALL CAPS 텍스트 | +0.08em 이상 |

## 행간 (Line Height)

| 역할 | 행간 |
|------|------|
| Display / H1 | 0.85~0.95 (글자가 겹칠 정도로) |
| H2 / H3 | 1.0~1.1 |
| Body | 1.6 |
| Caption | 1.3 |

행간이 1.0 미만이면 글자끼리 겹친다. Brutalist에서 이것은 허용된다.

## 금지 조합

- 세리프 폰트 사용 전면 금지
- weight 400 미만 (Light, Thin) 금지
- italic 금지 — 기울어지는 것은 나약함이다
- 중앙 정렬 금지 — 왼쪽 정렬 또는 의도적 비대칭만
- 부드러운 곡선 폰트 (Quicksand, Nunito 등) 금지

## ALL CAPS 사용 기준

어디서든 허용. H1, H2, 라벨, 네비게이션, 버튼 전부 대문자.
소문자는 본문에서만 허용한다.
