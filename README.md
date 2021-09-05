# 그룹 스터디 플랫폼

## 🔎 소개


### 프로젝트 개요

- 카테고리 별 스터디 검색, 생성, 가입
- 스터디 회원 간 질의응답 & 자료 업로드, 다운로드

### 기술 스택

- 언어 : Java, JSP, HTML, CSS, JavaScript
- 프레임워크 : Spring Framework
- 데이터베이스 : MySQL
- 서버 : Apache Tomcat
- 오픈소스 라이브러리 : jQuery, Bootstrap

## ⚙️ 주요 기능

- 회원
  ![회원](https://user-images.githubusercontent.com/52367155/132000372-23cc0347-f873-4cae-a33e-7f7842b5a2d7.png)

- 관리자
  ![관리자](https://user-images.githubusercontent.com/52367155/132000510-e27d12f5-abd3-4a4b-9763-45209099dfe4.png)

## 💻 기능 설명

- 메인페이지 : 서비스 설명, 네비게이션(시작하기, 가입하기)
  ![메인페이지](https://user-images.githubusercontent.com/52367155/132000797-b7af0ba4-0bdc-454c-bdd6-c0f77c3112c9.png)

- 로그인
  - Spring Security를 활용하여 인증정차 구현
    - 아이디 또는 비밀번호가 다를 경우 예외처리
    - 정지 당한 계정일 경우 예외 처리
      ![로그인](https://user-images.githubusercontent.com/52367155/132000857-f0f22762-c740-4278-9e08-39a8aff7eb3d.png)

- 회원가입
  - Validator를 활용하여 회원가입 form 유효성 검증
  - 유효성 검사 실패 시, 다국어 메세지 처리
    ![회원가입](https://user-images.githubusercontent.com/52367155/132000923-aaa50c96-68e8-4dd0-8383-000c5659c4b6.png)


- 스터디 찾기
  - 카테고리 별 스터디 목록 보기
  - 카테고리 별 스터디 검색
  - QnA, File 업로드 수가 높은 스터디 3개 목록
  - 스터디 생성 버튼
  - 최신순, 좋아요 순으로 정렬
  - 페이징 처리
    ![스터디 찾기](https://user-images.githubusercontent.com/52367155/132001582-7bcec9bc-d9ec-43ea-bd2d-6dc4f6472cf6.png)

- 스터디 상세 조회
  - 스터디 정보
  - 본인 글일 경우 수정
  - 모집 중, 좋아요, 가입하기 (AJAX 이용)
  - 댓글, 답글 (AJAX 이용) 
    ![스터디 상세조회](https://user-images.githubusercontent.com/52367155/132001658-d8d6ce4d-6709-452e-90ab-3ef81cb81d47.png)

- 스터디 시작
  - 가입한 스터디 목록 
    ![가입한 스터디 목록](https://user-images.githubusercontent.com/52367155/132001725-873932f0-5edd-405c-b3a6-f59ae586448a.png)


  - 질의응답 : 본인 글일 경우 수정, 삭제 가능, 댓글, 답글 기능
    ![질의응답](https://user-images.githubusercontent.com/52367155/132001782-7ef262ad-0820-4a9f-8b3b-2e99f1fdd582.png)

  - 자료 업로드, 다운로드 : 본인 글일 경우 수정, 삭제 가능, 댓글, 답글 기능 
    ![자료 업로드, 다운로드](https://user-images.githubusercontent.com/52367155/132001850-bc9483f7-3d5f-435c-bc47-ef1010caa3d1.png)


- 관리자 기능
- 전체 스터디 목록 : 스터디 입장, 강제 삭제
  ![전체 목록](https://user-images.githubusercontent.com/52367155/132001943-6f1346d5-b65f-4368-8894-f5e8fe28b8db.png)

- 전체 회원 목록
  ![회원 목록](https://user-images.githubusercontent.com/52367155/132002313-4caebb28-7bc9-4b10-97d6-a8dd0a24da96.png)

- 회원 정보 상세 보기 : 수정, 강제 탈퇴
  ![회원 상세정보](https://user-images.githubusercontent.com/52367155/132003256-e3ea0e7d-3f6d-42a3-9485-6d1d6aa3247f.png)

- 회원 정보 수정 : 계정상태, 권한 변경 가능 
  ![회원수정](https://user-images.githubusercontent.com/52367155/132003324-b4c43543-748c-47a6-9c95-bdfbb3bbd475.png)
