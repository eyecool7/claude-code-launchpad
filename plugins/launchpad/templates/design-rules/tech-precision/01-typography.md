# Typography — Tech Precision

## 핵심 원칙

모노스페이스가 이 디자인의 서명이다.
헤드라인은 코드처럼 보여야 하고, 숫자는 정렬되어야 한다.

## 타입 스케일

정수 비율 기반. 깔끔한 숫자만.

| 역할 | 크기 | 비고 |
|------|------|------|
| Display | 56px | 대시보드 메인 수치 |
| H1 | 40px | |
| H2 | 28px | |
| H3 | 20px | |
| Body | 14px | |
| Body Small | 13px | 보조 텍스트 |
| Caption / Label | 11px | 대문자 + 넓은 자간 |
| Code | 14px | 인라인 코드 |

## 폰트 역할 분배

```
헤드라인 (Display~H2): 모노스페이스
→ JetBrains Mono / Fira Code / IBM Plex Mono 중 택1
→ weight: 500~600

본문 (Body, Caption): 산세리프
→ Inter / DM Sans / IBM Plex Sans 중 택1
→ weight: 400~500

코드 블록 / 인풋: 모노스페이스 (헤드라인과 동일)
→ weight: 400

숫자: font-variant-numeric: tabular-nums 필수
```

## 자간 (Letter Spacing) 규칙

| 역할 | 자간 |
|------|------|
| 모노스페이스 헤드라인 | -0.02em (살짝 좁게) |
| 산세리프 본문 | 0 |
| Label / Caption | +0.08em (대문자와 함께) |
| 인라인 코드 | 0 |

## 행간 (Line Height)

| 역할 | 행간 |
|------|------|
| 헤드라인 | 1.2 |
| 본문 | 1.6 |
| 코드 블록 | 1.5 |
| Caption | 1.3 |

## 금지 조합

- 세리프 폰트 전면 금지
- 헤드라인에 산세리프 사용 금지 (모노스페이스만)
- italic 금지 (코드 주석 제외)
- weight 300 이하 금지
- 필기체, 장식 폰트 금지
- 숫자에 proportional-nums 사용 금지

## 특수 타이포 요소

```css
/* 터미널 프롬프트 스타일 */
.prompt::before {
  content: "> ";
  color: var(--accent);
}

/* 코드 블록 라인 넘버 */
.line-number {
  color: var(--text-disabled);
  user-select: none;
  margin-right: 16px;
}
```

## Claude에게

숫자가 표에 있으면 반드시 `tabular-nums`와 오른쪽 정렬을 적용하라.
헤드라인에 산세리프를 쓰려는 순간 모노스페이스로 바꿔라.
