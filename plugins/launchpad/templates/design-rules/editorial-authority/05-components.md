# Component Voice — Editorial Authority

## 원칙

모든 컴포넌트는 Personality에 복종한다.
컴포넌트 라이브러리의 기본 스타일을 그대로 쓰지 않는다.
shadcn, MUI, Ant Design의 기본값은 이 규칙으로 반드시 재정의한다.

---

## Button

```
Primary CTA
- 배경: Accent 색
- 텍스트: White, 산세리프, weight 500
- 모서리: 2px
- 패딩: 12px 24px
- 그림자: 없음 (Flat) 또는 Hard shadow (3px 3px 0px #0F1117)
- hover: 배경 10% 어둡게 + Hard shadow 제거 (눌린 느낌)

Secondary
- 배경: 없음 (transparent)
- 테두리: 1.5px solid [Text Primary]
- 텍스트: [Text Primary]
- hover: 배경 [Text Primary], 텍스트 White

금지: 그림자 blur 있는 버튼, 그라디언트 버튼, 둥근 버튼(pill)
```

## Card

```
구조
- 배경: Surface (#F0F2F5) 또는 White + border
- 모서리: 2px
- 패딩: 32px
- 그림자: Hard shadow 또는 border만 (Soft shadow 금지)

이미지가 있는 카드
- 이미지는 카드 상단 100% 너비로 (패딩 없이 edge-to-edge)
- 이미지는 반드시 모노크롬 + 하프톤 처리
- 이미지 비율: 4:3 또는 3:2 고정 (자동 크롭)

텍스트 계층
- 카테고리 라벨: 산세리프, ALL CAPS, 12px, 자간 +0.12em
- 제목: 세리프, 22~26px
- 본문: 산세리프, 15~16px, Text Secondary
```

## Form / Input

```
Input
- 배경: White
- 테두리: 1px solid #E2E5EA
- 모서리: 2px
- 패딩: 10px 14px
- focus: 테두리 1.5px Accent (box-shadow glow 없음)
- error: 테두리 red, 하단 에러 텍스트 (12px, red)

Label
- 산세리프, 12px, weight 500
- ALL CAPS, 자간 +0.08em
- 인풋 위에 위치 (placeholder 대신 label 필수)

금지: placeholder만 있는 인풋 (접근성), 인풋에 blur shadow
```

## Badge / Tag

```
- 패딩: 3px 8px
- 모서리: 2px
- 폰트: 산세리프, 11px, weight 600, ALL CAPS
- 자간: +0.08em
- 배경: Base 계열 (Accent는 1개까지만)
```

## Navigation

```
상단 Nav
- 배경: White 또는 투명 (backdrop-blur 없음 — 이건 Glassmorphism)
- 높이: 56px
- 로고: 세리프 또는 워드마크
- 메뉴 항목: 산세리프, 13px, weight 500, 자간 +0.04em
- active: Accent 색 underline (2px solid)
- hover: opacity 0.6 (색 변화 없이 투명도로만)

구분선: border-bottom 1px solid #E2E5EA (그림자 없음)
```

## Divider / 구분선

```
기본: <hr> 1px solid #E2E5EA
강조 구분: border-top 2px solid [Text Primary] (섹션 시작점에)
장식용 구분 사용 금지 (점선 패턴, 웨이브 등)
```

## 인용문 블록

```
- 왼쪽 보더: 3px solid Accent
- 패딩 왼쪽: 24px
- 폰트: 세리프 italic, 20px
- 출처: 산세리프, 12px, ALL CAPS, Text Secondary
```

## 상태 표현 (Success / Error / Warning / Info)

```
색 추가 없이 표현 원칙:
- Success: Text Primary + 체크 아이콘
- Error: 테두리 red + 에러 텍스트 (red는 상태 표현 전용으로만)
- Warning: 아이콘 + 텍스트 (노란 배경 금지)
- Info: Accent 색 왼쪽 보더 (인용문 스타일)

팝업 토스트 금지 — 인라인 피드백 원칙
```
