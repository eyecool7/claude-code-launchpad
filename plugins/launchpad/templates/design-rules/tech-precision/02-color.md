# Color — Tech Precision
# [오버라이드 적용: Dark 모드 + Terminal Green]

## 핵심 원칙

색은 데이터다. 색이 쓰인 곳은 정보가 있다.
장식을 위한 색은 없다. Accent는 행동 유도 또는 상태 표시 전용이다.

## 팔레트 구조

```
Background  → 가장 어두운 레이어
Surface     → 카드, 패널
Surface+    → 호버, 활성 상태
Border      → 그리드선, 구분선
Text        → 읽기 위한 것
Accent      → 행동, 상태, 포인트
```

## 활성 팔레트: Dark 모드

| 역할 | 값 |
|------|-----|
| Background | #0A0E17 |
| Surface | #111827 |
| Surface+ (hover) | #1F2937 |
| Border | #1F2937 / #374151 |
| Text Primary | #F9FAFB |
| Text Secondary | #9CA3AF |
| Text Disabled | #4B5563 |

## 활성 Accent: Terminal Green

```css
--accent: #00FF41;
--accent-dim: #00CC33;
--accent-glow: 0 0 12px rgba(0, 255, 65, 0.4);
--accent-rgb: 0, 255, 65;
```

## Accent 사용 규칙

```
쓸 수 있는 곳:
- Primary CTA 버튼
- Active / 선택된 상태 표시
- 터미널 커서
- 데이터 차트 포인트
- 코드 블록 왼쪽 border
- 진행률 표시바

쓰면 안 되는 곳:
- 일반 텍스트 색
- 배경 전체
- 장식용 아이콘
- hover 외 링크 색
```

## 상태 색 (시스템 전용)

```css
--success: #10B981;
--warning: #F59E0B;
--error:   #EF4444;
--info:    #00FF41; /* Accent와 동일 */
```

상태 색은 상태 표시에만. 일반 UI에 사용 금지.
