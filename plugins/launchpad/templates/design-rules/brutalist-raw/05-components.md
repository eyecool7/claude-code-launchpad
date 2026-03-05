# Component Voice — Brutalist Raw

## 원칙

컴포넌트는 거칠게 작동해야 한다.
라이브러리 기본값은 전부 덮어쓴다. 부드러운 것은 없다.

---

## Button

```css
/* Primary */
background: #000000;
color: #FFFFFF;
border: 2px solid #000000;
border-radius: 0;
padding: 12px 24px;
font-weight: 700;
font-size: 14px;
letter-spacing: 0.08em;
text-transform: uppercase;
box-shadow: 4px 4px 0px #000000; /* Hard shadow: 색이 겹치면 offset 색 변경 */
transition: none; /* 애니메이션 없음 */

/* hover: 즉각 반응 */
:hover {
  transform: translate(4px, 4px);
  box-shadow: none; /* 눌린 느낌 */
}

/* 역전 모드 */
background: #FFFFFF;
color: #000000;
border-color: #FFFFFF;
box-shadow: 4px 4px 0px #FFFFFF;
```

Ghost Button:
```css
background: transparent;
border: 2px solid currentColor;
/* hover: 배경과 텍스트 색 즉각 반전 */
```

---

## Card

```css
border: 2px solid #000000;
border-radius: 0;
padding: 24px;
box-shadow: 6px 6px 0px #000000;
background: #FFFFFF;

/* hover */
:hover {
  transform: translate(3px, 3px);
  box-shadow: 3px 3px 0px #000000;
}
```

카드 내 이미지:
- 카드 상단에 배치, 패딩 없이 edge-to-edge
- 이미지 하단 border-bottom: 2px solid #000000
- 이미지 위 텍스트 오버레이 허용 (background overlay 없이, 텍스트 색만으로)

---

## Form / Input

```css
input {
  border: 2px solid #000000;
  border-radius: 0;
  padding: 10px 12px;
  font-size: 16px;
  background: #FFFFFF;
  transition: none;
}

input:focus {
  outline: none;
  border-color: [Accent 또는 #000000];
  box-shadow: 3px 3px 0px #000000; /* Hard shadow 추가 */
}

input.error {
  border-color: #FF0000;
  box-shadow: 3px 3px 0px #FF0000;
}
```

Label:
```css
font-weight: 700;
font-size: 11px;
text-transform: uppercase;
letter-spacing: 0.12em;
margin-bottom: 6px;
```

---

## Badge / Tag

```css
padding: 4px 10px;
border: 2px solid #000000;
border-radius: 0;
font-size: 11px;
font-weight: 700;
text-transform: uppercase;
letter-spacing: 0.1em;
background: transparent; /* 또는 #000000 + white 텍스트 */
```

---

## Navigation

```css
nav {
  border-bottom: 3px solid #000000;
  padding: 0 24px;
  height: 64px;
  background: #FFFFFF;
}

/* 메뉴 항목 */
nav a {
  font-weight: 700;
  font-size: 13px;
  text-transform: uppercase;
  letter-spacing: 0.1em;
  text-decoration: none;
  color: #000000;
}

/* Active */
nav a.active {
  background: #000000;
  color: #FFFFFF;
  padding: 4px 8px;
}

/* Hover: 즉각 반전 */
nav a:hover {
  background: #000000;
  color: #FFFFFF;
  transition: none;
}
```

---

## 상태 표현

```
Success: 굵은 체크 아이콘 + 텍스트 (초록 배경 없음)
Error: 테두리 #FF0000 + 에러 텍스트 (빨간 배경 없음)
Loading: 텍스트 "LOADING..." 깜빡임 (스피너 없음)
Empty state: 큰 타이포로 "NOTHING HERE" 등
```

Brutalist에서 상태는 색으로 숨기지 않는다. 텍스트로 직접 말한다.
