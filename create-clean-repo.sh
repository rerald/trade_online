#!/bin/bash

# 🚀 암호화폐 AI 분석 시스템 - 클린 리포지토리 생성 스크립트
# GitHub Secret Scanning 문제 완전 해결

echo "🔐 클린 리포지토리 생성 중..."

# 1. 새로운 폴더 생성
mkdir crypto-ai-analysis-clean
cd crypto-ai-analysis-clean

# 2. Git 초기화 (완전히 새로운 히스토리)
git init

# 3. 현재 안전한 파일들만 복사
echo "📁 안전한 파일들 복사 중..."

# index.html 복사 (API 키가 완전히 제거된 버전)
cp ../index.html .

# README.md 복사 (안전한 버전)
cp ../README.md .

# 4. .gitignore 생성 (보안 강화)
cat > .gitignore << EOF
# API 키 및 환경변수
.env
.env.local
.env.production
*.key
*api*key*

# 로그 파일
*.log
logs/

# 운영체제
.DS_Store
Thumbs.db

# IDE
.vscode/
.idea/
*.swp
*.swo

# 임시 파일
*.tmp
*.temp
EOF

# 5. 안전성 체크 (API 키 패턴 검색)
echo "🔍 안전성 검사 중..."

if grep -r "sk-proj" . --exclude-dir=.git; then
    echo "❌ 경고: API 키 패턴 발견!"
    exit 1
fi

if grep -r "sk-[a-zA-Z0-9]" . --exclude-dir=.git; then
    echo "❌ 경고: OpenAI 키 패턴 발견!"
    exit 1
fi

echo "✅ 안전성 검사 통과"

# 6. 첫 커밋 (완전히 클린한 상태)
git add .
git commit -m "Initial commit: 암호화폐 AI 분석 시스템

✨ 주요 기능:
- 실시간 BTC/ETH 가격 분석
- OpenAI GPT 기반 AI 분석
- 13가지 기술적 지표
- 사용자 친화적 UI

🔐 보안:
- API 키 사용자 입력 방식
- 로컬 저장소만 사용
- 완전히 클린한 코드베이스"

# 7. 완료 메시지
echo ""
echo "🎉 클린 리포지토리 생성 완료!"
echo ""
echo "📁 새 폴더: crypto-ai-analysis-clean"
echo "🔐 API 키 히스토리: 완전 제거됨"
echo "✅ GitHub 업로드: 안전함"
echo ""
echo "🚀 다음 단계:"
echo "1. GitHub에서 새 리포지토리 생성"
echo "2. git remote add origin <새-리포지토리-URL>"
echo "3. git push -u origin main"
echo ""
echo "💡 테스트:"
echo "1. index.html 열기"
echo "2. API 키 설정"
echo "3. AI 분석 테스트" 