# Component Voice — Tech Precision

## 원칙

모든 컴포넌트는 **기능이 형태를 결정**한다는 원칙을 따른다.
불필요한 장식은 삭제. 상태 변화는 명확하게. 피드백은 즉각적으로.

---

## Button

```css
/* Primary */
background: var(--accent);
color: #000000; /* 대비를 위해 (Accent가 밝은 경우) */
border: 1px solid var(--accent);
border-radius: 4px;
padding: 8px 20px;
font-family: [모노스페이스];
font-size: 13px;
font-weight: 500;
letter-spacing: 0.04em;
box-shadow: 0 0 12px rgba([Accent RGB], 0.25);
transition: all 0.15s;

:hover {
  box-shadow: 0 0 20px rgba([Accent RGB], 0.5);
  filter: brightness(1.1);
}

:active {
  transform: scale(0.98);
  box-shadow: 0 0 6px rgba([Accent RGB], 0.3);
}
```

Ghost Button:
```css
background: transparent;
border: 1px solid var(--border);
color: var(--text-primary);

:hover {
  border-color: var(--accent);
  color: var(--accent);
  box-shadow: 0 0 8px rgba([Accent RGB], 0.2);
}
```

---

## Card / Panel

```css
background: var(--surface);
border: 1px solid var(--border);
border-radius: 4px;
padding: 20px;
transition: border-color 0.15s;

:hover {
  border-color: var(--accent);
}
```

데이터 카드 (숫자 중심):
```css
/* 상단: 레이블 */
.card-label {
  font-family: [모노스페이스];
  font-size: 11px;
  color: var(--text-secondary);
  text-transform: uppercase;
  letter-spacing: 0.08em;
  margin-bottom: 8px;
}

/* 중간: 큰 숫자 */
.card-value {
  font-family: [모노스페이스];
  font-size: 40px;
  font-weight: 600;
  color: var(--text-primary);
  font-variant-numeric: tabular-nums;
}

/* 하단: 변화율 */
.card-delta {
  font-size: 12px;
  color: var(--success) 또는 var(--error);
}
```

---

## Form / Input

```css
input {
  background: var(--background);
  border: 1px solid var(--border);
  border-radius: 4px;
  padding: 8px 12px;
  font-family: [모노스페이스]; /* 인풋도 모노 */
  font-size: 14px;
  color: var(--text-primary);
  transition: border-color 0.15s, box-shadow 0.15s;
}

input:focus {
  outline: none;
  border-color: var(--accent);
  box-shadow: 0 0 0 3px rgba([Accent RGB], 0.15);
}

input.error {
  border-color: var(--error);
  box-shadow: 0 0 0 3px rgba(239, 68, 68, 0.15);
}
```

Label:
```css
font-family: [모노스페이스];
font-size: 11px;
font-weight: 600;
text-transform: uppercase;
letter-spacing: 0.08em;
color: var(--text-secondary);
```

---

## Badge / Tag / Chip

```css
padding: 3px 8px;
border-radius: 3px;
font-family: [모노스페이스];
font-size: 11px;
font-weight: 500;

/* 기본 */
background: var(--surface-plus);
color: var(--text-secondary);
border: 1px solid var(--border);

/* Accent */
background: rgba([Accent RGB], 0.15);
color: var(--accent);
border: 1px solid rgba([Accent RGB], 0.3);
```

---

## Navigation

```css
nav {
  background: var(--background);
  border-bottom: 1px solid var(--border);
  height: 52px;
  padding: 0 24px;
  display: flex;
  align-items: center;
}

/* 로고 — 모노스페이스 */
.logo {
  font-family: [모노스페이스];
  font-weight: 600;
  font-size: 15px;
}
.logo::before { content: "> "; color: var(--accent); }

/* 메뉴 */
nav a {
  font-size: 13px;
  color: var(--text-secondary);
  text-decoration: none;
  padding: 4px 8px;
  border-radius: 4px;
  transition: all 0.15s;
}

nav a:hover {
  color: var(--text-primary);
  background: var(--surface-plus);
}

nav a.active {
  color: var(--accent);
  background: rgba([Accent RGB], 0.1);
}
```

---

## 상태 / 피드백

```
Loading:
- 텍스트 커서 blink (타이핑 중인 것처럼)
- 또는 도트 3개 순서대로 켜지는 애니메이션
- 스피너 없음

Progress Bar:
background: var(--surface-plus);
height: 3px;
border-radius: 0;
fill: var(--accent);
box-shadow: 0 0 6px rgba([Accent RGB], 0.5);

Toast / Alert:
border-left: 3px solid [상태색];
background: var(--surface);
border-radius: 0 4px 4px 0;
font-family: [모노스페이스];
font-size: 13px;
```
