# mood_tracker

서점 리스본의 '글쓰기 노트\_첫문장' 을 참고하여 개발.

GPT가 감정(mood)을 입력받아 그 감정에 적절한 한 문장을 제시.  
첫 문장을 제시해주면, 그 이후에 사용자가 이어 적는 방식.

예시) '휴대폰이 꺼졌다'  
아.. 이전에는 뭐하고 살았더라?
<br/>  
<br/>

## Demo

https://github.com/user-attachments/assets/77b797d5-19d4-409c-9014-f4bfab14139c

<br/>  
<br/>

## Details

### 1. 인증

- Firebase Authentication을 사용한 이메일/비밀번호 로그인
- Validation

### 2. 기록 (게시글)

- 게시글 추가, 삭제 기능
- 게시글 감정(mood) 추가 기능
- 감정에 따른 첫 문장 제시 기능 - GPT
- Firebase를 사용한 실시간 데이터 동기화

### 3. 상태 관리

- Riverpod
- AsyncNotifier, StreamNotifier
- AsyncValue를 통한 로딩/에러 상태 처리

### 4. Routing

- GoRouter를 사용한 네비게이션 구현
- 인증 상태에 따른 Redirection

### 5. Firebase

- Authentication
- Firestore (DB) : user, post 정보 저장

### 6. GPT

- `paintbrush` 버튼을 눌렀을 때 현재 선택된 감정을 GPT에게 넘겨 한 문장을 추천받는 기능 구현
- Open AI 모델 사용 : `gpt-4o-mini`
- 프롬프트 개선 : 예시(Few-shot Learning) 추가
- API Request Customization : 앱의 성격에 맞게 조정

| 레이어                         | 구현                            |
| ------------------------------ | ------------------------------- |
| **Model** (데이터 모델)        | `PostModel`                     |
| **Repository** (데이터 액세스) | `PostRepository`                |
| **ViewModel** (비즈니스 로직)  | `postProvider` (StreamNotifier) |
| **View** (UI 레이어)           | `HomeScreen`, `PostScreen`      |

### 7. 아키텍처

- MVVM (Model-View-ViewModel) 패턴 적용
- Repository 패턴으로 데이터 액세스 계층 분리
- ViewModel을 통한 비즈니스 로직 처리
- Provider를 통한 의존성 주입
