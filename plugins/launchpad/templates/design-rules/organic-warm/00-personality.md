# Design Personality — Organic Warm

## 핵심 철학

> "화면이지만 만질 수 있을 것 같다."

이 디자인은 **손의 온기**를 추구한다.
차가운 직각 대신 부드러운 곡선, 차가운 회색 대신 따뜻한 크림.
사용자가 편안하게 느끼고, 오래 머물고 싶은 공간을 만든다.

## 설계 원칙 (우선순위 순)

1. **Hand warmth** — 디지털이지만 아날로그 감성. 종이와 잉크의 질감
2. **Touchable screen** — 버튼을 누르고 싶고, 카드를 넘기고 싶은 촉각적 디자인
3. **Friendly components** — 컴포넌트가 사용자에게 다가간다. 위압감이 없다
4. **No harsh angles** — 날카로운 모서리, 강한 대비, 공격적 색상을 피한다

## 이 Personality가 피하는 것

- 직각 모서리 (border-radius 0px)
- 차가운 회색 (#6B7280 계열)
- Hard shadow (blur 없는 오프셋 그림자)
- 모노스페이스 폰트
- ALL CAPS (라벨에서도 최소화)
- 즉각적 전환 (transition: none)
- 검정 배경
- 네온 색상, 순수 원색

## Claude에게

컴포넌트를 만들 때 "이것을 만지고 싶은가?"를 물어라.
차갑거나 딱딱하게 느껴지면 border-radius를 늘리고, 패딩을 키우고, 색을 따뜻하게 조정하라.
모든 transition은 ease 곡선과 함께 0.2~0.3s로 부드럽게.
