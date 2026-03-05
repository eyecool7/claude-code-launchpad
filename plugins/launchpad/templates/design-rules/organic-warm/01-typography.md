# Typography — Organic Warm

## 핵심 원칙

타이포그래피도 따뜻해야 한다.
헤드라인은 부드러운 세리프로, 본문은 둥근 산세리프로.
글자가 딱딱하게 서 있지 않고 자연스럽게 흐른다.

## 타입 스케일

자연스러운 비율. 극단적 크기 대비를 피한다.

| 역할 | 크기 | 비고 |
|------|------|------|
| Display | 56px | 히어로 영역에만 |
| H1 | 40px | |
| H2 | 30px | |
| H3 | 22px | |
| Body Large | 18px | 리드 문장 |
| Body | 16px | 기본 본문 |
| Body Small | 14px | 보조 텍스트 |
| Caption | 13px | |

## 폰트 역할 분배

```
헤드라인 (Display~H3): 부드러운 세리프
→ Lora / Crimson Text / Crimson Pro 중 택1
→ weight: 400~600
→ italic 허용 (인용문, 강조에)

본문 (Body, Caption): 둥근 산세리프
→ Nunito / Quicksand / DM Sans (Rounded) 중 택1
→ weight: 400~500

코드 블록: 모노스페이스 (최소한으로만)
→ JetBrains Mono
→ weight: 400
```

## 자간 (Letter Spacing) 규칙

| 역할 | 자간 |
|------|------|
| 헤드라인 | -0.01em (아주 살짝 좁게) |
| 본문 | 0 |
| Caption | +0.02em (미세하게) |
| Label | +0.04em |

Organic Warm의 자간은 극단적이지 않다. 자연스러움이 핵심이다.

## 행간 (Line Height)

| 역할 | 행간 |
|------|------|
| 헤드라인 | 1.2~1.3 |
| 본문 | 1.75 (넉넉하게) |
| Caption | 1.5 |

본문 행간이 넉넉해야 읽기 편하고 따뜻하게 느껴진다.

## 금지 조합

- 모노스페이스를 헤드라인에 사용 금지
- weight 700 이상의 극도로 굵은 폰트 금지
- ALL CAPS 최소화 (버튼, 네비게이션에도 sentence case 권장)
- 기하학적 산세리프 (Futura, Helvetica) 금지 — 너무 차갑다
- 자간 +0.08em 이상 금지 — 딱딱해 보인다
- Display 크기 80px 이상 금지 — 공격적이다

## 특수 타이포 요소

```css
/* 인용문 — italic 세리프 */
blockquote {
  font-family: [부드러운 세리프];
  font-style: italic;
  font-size: 20px;
  line-height: 1.5;
  color: var(--text-secondary);
}

/* 강조 — bold 대신 색 변화 */
strong {
  font-weight: 500; /* 600이 아닌 500 */
  color: var(--text-primary);
}
```

## Claude에게

글자가 "소리를 지르는" 느낌이면 크기를 줄이고 weight를 낮춰라.
ALL CAPS를 쓰기 전에 sentence case로 먼저 시도하라.
