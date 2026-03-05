# Space & Rhythm — Brutalist Raw

## 핵심 원칙

그리드는 존재하지만 깨질 수 있다.
의도적인 오정렬, 의도적인 넘침이 Brutalist의 리듬이다.
"정돈된 느낌"은 이 Personality의 적이다.

## Base Unit

**8px** 기준. 단, 규칙적으로 쓸 의무는 없다.

```
8px   — 최소 간격
16px  — 기본 내부 패딩
24px  — 카드 패딩
32px  — 컴포넌트 간격
48px  — 섹션 내 블록 간격
64px  — 섹션 간 간격
```

## 밀도 설정: Variable

Brutalist는 밀도가 일정하지 않다.

- 어떤 섹션은 빽빽하게, 어떤 섹션은 텅 비게
- 균일한 패딩은 지루함이다
- 텍스트가 화면 가장자리에 붙어도 된다 (패딩 0 허용)
- 요소가 컨테이너 밖으로 나가도 된다 (overflow: visible)

## 그리드

```css
/* 기본 — 있지만 깨질 수 있다 */
display: grid;
grid-template-columns: repeat(12, 1fr);
gap: 16px;
max-width: 1200px;

/* 의도적 탈출 */
.breakout {
  margin-left: -10vw;
  margin-right: -10vw;
  width: calc(100% + 20vw);
}
```

## 최대 너비

```
전체 레이아웃: max-width 1200px (권장, 필수 아님)
본문 텍스트: 제한 없음
Display 타이포: 제한 없음 (뷰포트 전체 가능)
```

## 정렬 원칙

- **왼쪽 정렬 기본** — 중앙 정렬 금지
- 의도적 비대칭 허용: 요소를 오른쪽 30% 지점에 배치하는 등
- 텍스트가 이미지 위에 겹쳐도 된다
- 수직 정렬이 안 맞아도 된다 (의도적이라면)
- `transform: rotate(-2deg ~ 3deg)` 미세한 기울임 허용

## 수직 리듬

```
H1 위: 64px
H2 위: 48px
본문 단락 간: 16px

단, 섹션 전환 시 비대칭 여백 허용:
섹션 A 끝: padding-bottom 24px
섹션 B 시작: padding-top 80px
→ 의도적 불균형
```

## Claude에게

"정렬이 안 맞는데?" 라는 생각이 들면 그것이 의도인지 먼저 확인하라.
Brutalist에서 완벽한 정렬은 오히려 잘못된 것이다.
overflow: hidden을 기본으로 쓰지 마라. 넘치게 두어라.
