# Typography — Editorial Authority

## 핵심 원칙

헤드라인과 본문은 반드시 **긴장감 있는 대비**를 유지한다.
같은 폰트 패밀리를 쓰지 않는다. 이 대비가 Editorial의 생명이다.

## 타입 스케일

황금비(1.618) 기반. 중간값을 임의로 추가하지 않는다.

| 역할 | 크기 | 비고 |
|------|------|------|
| Display | 110px | 섹션 히어로에만 |
| H1 | 68px | 페이지당 1개 원칙 |
| H2 | 42px | |
| H3 | 26px | |
| Body Large | 18px | 리드 문장 |
| Body | 16px | 기본 본문 |
| Caption / Label | 12px | 넓은 자간 필수 |

## 폰트 역할 분배

```
헤드라인 (H1~H3): 세리프 계열
→ Playfair Display / Lora / DM Serif Display 중 택1
→ weight: 400~700
→ 대문자 허용, 단 H1에만

본문 (Body, Caption): 산세리프 계열  
→ Inter / DM Sans / Geist 중 택1
→ weight: 300~500
→ 소문자 기본

코드 블록: 모노스페이스
→ JetBrains Mono / Geist Mono
```

## 자간 (Letter Spacing) 규칙

| 역할 | 자간 |
|------|------|
| 헤드라인 | -0.02em (살짝 좁게) |
| 본문 | 0 (기본값) |
| Label / Caption | +0.08em (넓게 — 이게 Editorial의 특징) |
| ALL CAPS 텍스트 | +0.12em (필수) |

## 행간 (Line Height)

| 역할 | 행간 |
|------|------|
| 헤드라인 | 1.1~1.2 |
| 본문 | 1.7 |
| Caption | 1.4 |

## 금지 조합

- H1과 H2에 같은 폰트 ❌
- 버튼에 세리프 폰트 ❌
- 본문에 italic 남발 (강조 1~2곳만) ❌
- 3가지 이상 폰트 패밀리 ❌
- weight 600 이상을 본문에 ❌

## ALL CAPS 사용 기준

Label, Category tag, Navigation item에만 허용.
본문, 헤드라인에 ALL CAPS 금지.
