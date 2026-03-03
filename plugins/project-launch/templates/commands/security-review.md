---
description: 보안 점검. CWE Top 25 기반 코드 스캔 + 의존성 취약점 확인. 보안, security, scan, 취약점, vulnerability 시 사용.
---

# 보안 리뷰

CWE Top 25 기반으로 프로젝트의 보안 취약점을 점검한다.

## Step 1: 코드 스캔

프로젝트 소스 코드에서 다음 패턴을 검색한다:

| # | CWE | 취약점 | 검색 패턴 |
|---|-----|--------|-----------|
| 1 | CWE-79 | XSS | `dangerouslySetInnerHTML`, `innerHTML`, `document.write`, `eval(` |
| 2 | CWE-89 | SQL Injection | 문자열 보간이 포함된 SQL 쿼리 (`${}`, `+` 연결) |
| 3 | CWE-78 | OS Command Injection | `exec(`, `execSync(`, `spawn(` + 사용자 입력 연결 |
| 4 | CWE-22 | Path Traversal | `../`, 사용자 입력이 포함된 파일 경로 |
| 5 | CWE-798 | 하드코딩 시크릿 | `password =`, `secret =`, `api_key =`, `token =` + 리터럴 문자열 |
| 6 | CWE-862 | 인가 누락 | 인증 없는 API 엔드포인트 (미들웨어 체크 누락) |
| 7 | CWE-20 | 입력 검증 부재 | 외부 입력을 검증 없이 사용하는 핸들러 |
| 8 | CWE-200 | 정보 노출 | 에러 스택 트레이스 클라이언트 반환, 상세 에러 메시지 |
| 9 | CWE-352 | CSRF | POST/PUT/DELETE 엔드포인트에 CSRF 토큰 없음 |
| 10 | CWE-502 | 역직렬화 | `JSON.parse(` + 외부 입력, `eval(`, `Function(` |

## Step 2: 의존성 취약점 확인

```bash
# npm/pnpm audit
{{PKG_MANAGER}} audit 2>/dev/null || echo "audit 미지원"

# 오래된 패키지 확인
{{PKG_MANAGER}} outdated 2>/dev/null | head -20
```

## Step 3: 환경 설정 점검

다음을 확인한다:
- `.env` 파일이 `.gitignore`에 포함되어 있는가
- `NEXT_PUBLIC_` 접두사에 시크릿이 등록되어 있지 않은가
- API 키가 서버사이드에서만 사용되는가 (클라이언트 번들에 포함되지 않는가)

## Step 4: 결과 출력

사용자에게 다음 형식으로 전달한다:

---

## 보안 점검 결과

| 심각도 | CWE | 위치 | 설명 | 권장 조치 |
|:------:|-----|------|------|-----------|
| 🔴 | CWE-xxx | {파일:라인} | {발견 내용} | {수정 방법} |
| 🟡 | ... | ... | ... | ... |
| 🟢 | — | — | 취약점 미발견 | — |

**의존성:** {audit 결과 요약}
**환경 설정:** {점검 결과 요약}

---

**심각도 기준:**
- 🔴 즉시 수정: 실제 공격 가능한 취약점
- 🟡 권장 수정: 잠재적 위험 또는 모범 사례 미준수
- 🟢 통과: 해당 카테고리 취약점 없음
