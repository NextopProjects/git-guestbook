# 📓 Git Guestbook

Git & GitHub 실습용 방명록 프로젝트입니다.
`entries/` 폴더에 본인 방명록 파일을 추가하면서 Git 워크플로우를 연습해보세요.

## 🚀 실습 방법

```bash
# 1. 이 레포를 Fork (GitHub 우측 상단 Fork 버튼)

# 2. Fork된 본인 레포를 Clone
git clone https://github.com/<your-id>/git-guestbook.git
cd git-guestbook

# 3. 새 브랜치 생성
git switch -c add-<your-name>

# 4. 스크립트로 방명록 파일 생성 (아래 참고)

# 5. 파일을 열어 한마디 채운 뒤 커밋 & 푸시
git add entries/<your-name>.md
git commit -m "add: <your-name> 방명록 추가"
git push origin add-<your-name>

# 6. GitHub에서 Pull Request 생성!
```

## 📝 방명록 파일 생성

스크립트를 실행하면 **이름과 한마디**를 입력받아서:
1. `entries/<이름>.md` 파일을 생성하고 (작성 시각도 자동 기록)
2. `guestbook.md` 파일 끝에도 한 줄을 자동 추가합니다.

**Windows** — `add.bat` 더블클릭

**Mac / Linux**
```bash
chmod +x add.sh    # 최초 1회만
./add.sh
```

> 📌 스크립트의 안내 메시지(`Enter your name:`, `[OK] Created` 등)는 영문이지만, **입력하는 이름과 한마디는 한글로 자유롭게 작성**할 수 있습니다.

## ⚠️ 주의

스크립트는 두 파일을 동시에 수정하므로, 커밋할 때도 두 파일을 함께 add 해주세요:

```bash
git add entries/<your-name>.md guestbook.md
git commit -m "add: <your-name>"
git push origin <your-branch>
```

## 🎯 추가 실습 아이디어

- 스크립트로 동시에 PR 올리기 → `guestbook.md`에 같은 위치를 수정하므로 **merge conflict** 발생!
- 다른 사람의 PR을 리뷰해보기
- Issue 등록해보기
