<h1>🌱 Plantopia | 반려식물 커뮤니티 & 스토어 플랫폼</h1>

Plantopia는 반려식물에 관심 있는 사용자들을 위한 웹 기반 통합 플랫폼입니다.
저는 이 프로젝트에서 팀장으로 전체적인 개발 방향을 리드하였고,
Spring 기반 백엔드 아키텍처와 보안 설계, 주요 기능 구현 및 외부 API 연동을 직접 담당했습니다.

<h1>📌 프로젝트 개요</h1>

개발 기간: 2025.04 ~ 2025.05 (5주)

참여 인원: 3명

역할: 팀장 / 백엔드 총괄 / 보안 및 인증 설계 / API 연동 담당

주요 기여

Spring Security 기반 로그인, 회원가입 및 권한 분리 설계

사용자별 권한 제어 및 접근 제한 기능 구현 (ROLE_USER / ROLE_ADMIN)

프로필 페이지 및 관리자 전용 페이지 개발

메인 페이지의 인기글 순위 노출 기능 구현

도로명 주소 API, 실내정원 식물 API, Iamport 결제 API 연동

전체 프로젝트 구조 설계 및 백엔드 기술 스택 총괄

<h1>🧭 프로젝트 목표</h1>

반려식물 커뮤니티의 부재 문제 해결
기존 반려동물 중심 커뮤니티와 달리, 식물 애호가들이 정보 교류하고 제품을 구매할 수 있는 플랫폼이 필요했습니다.

사용자 접근성 + 기능성 동시 확보
커뮤니티, 클리닉 상담, 식물 정보 탐색, 온라인 스토어 기능을 통합 제공

<h1>🛠️ 주요 기능 및 구현</h1>

<h3>기능	설명  및	 기여도</h3>

🔐 로그인 및 회원가입	Spring Security 기반	100% (설계 + 구현)

🔑 사용자 권한 분리	일반 사용자 / 관리자 분리, 접근 URL 제한	100%

🗂️ 게시판 (자랑/클리닉)	CRUD, 댓글 기능, 인기글 노출 로직	80%

📦 스토어 및 장바구니	상품 목록/상세/장바구니 연동	60%

💳 결제 시스템	Iamport API 연동 (프론트+백)	100%

🧭 실내정원용 식물 백과사전	공공 API로 식물 정보 호출	100%

🏪 주소 입력	행정안전부 도로명 주소 API 연동	100%

🧑‍💼 관리자 페이지	회원 및 게시물 관리 기능	80%

🏗️ 프로젝트 구조 설계	DB 모델링 + JSP MVC 흐름 설계	100%

🚀 배포 환경 구성	WAR 추출, Tomcat 배포, 경로 설정	100%

<h1>⚙️ 기술 스택</h1>

Frontend: HTML5, CSS3, JavaScript, JSP, Bootstrap

Backend: Spring Boot, Spring Security, MyBatis

Database: MySQL

Infra: Apache Tomcat 10.1, Git, GitHub

API: 행정안전부 도로명 주소 API, 농사로 식물 정보 API, Iamport 결제 API

<h1>🧩 데이터베이스 설계 (ERD)</h1>
Plantopia는 사용자, 게시판, 스토어, 식물 정보를 효율적으로 연동하기 위해 관계형 데이터베이스 기반의 설계를 적용했습니다.

ERD를 통해 테이블 간 관계와 기능 연결 구조를 명확히 정의하였습니다.



<h1>🖥️ 실행 화면 예시</h1>
<img width="714" alt="화면 캡처 2025-06-08 230150" src="https://github.com/user-attachments/assets/6e3df2c7-db87-4102-9867-17cf091c8721" />
<img width="407" alt="화면 캡처 2025-06-08 230249" src="https://github.com/user-attachments/assets/24a32b9c-445e-4942-b1b4-0b8fd8aa673d" />
<img width="1121" alt="화면 캡처 2025-06-08 233940" src="https://github.com/user-attachments/assets/1f8d61bb-c2af-47cb-9ec9-e2149ba51f2a" />
<img width="1097" alt="화면 캡처 2025-06-08 234206" src="https://github.com/user-attachments/assets/ecb01979-bd2c-473d-9788-ea9693b6c1b2" />
<img width="1100" alt="화면 캡처 2025-06-17 110913" src="https://github.com/user-attachments/assets/0fd7d7f7-3799-46fd-a04c-9539f1962a25" />
<img width="796" alt="화면 캡처 2025-06-17 111714" src="https://github.com/user-attachments/assets/7fc9209e-cf92-4497-b8f4-21152d23427c" />
<img width="982" alt="화면 캡처 2025-06-17 111827" src="https://github.com/user-attachments/assets/e91297c1-0fd9-4d90-8f64-2fad529faf00" />
<img width="905" alt="화면 캡처 2025-06-17 112710" src="https://github.com/user-attachments/assets/c6228aea-b1d4-4219-bd18-3301caf3cbd9" />
<img width="1066" alt="화면 캡처 2025-06-17 112810" src="https://github.com/user-attachments/assets/dc0823a1-db39-42a9-b55d-5be3a39351ad" />


<h1>👨‍👩‍👧 팀 구성 및 역활</h1>

이승민	팀장 / 로그인 및 권한 설계 / 관리자 기능 / 인기글 구현 / 결제 API 구현 / 식물 백과사전 API 구

김나현 팀원 / 스토어 페이지 / 장바구니 / 공지 게시판 / 인기상품 미리보기

최민성 팀원 / 게시판 CRUD / 댓글 계층 구조 / 좋아요 및 별점

<h1>🔗 참고자료</h1>

도로명 주소 API (https://www.juso.go.kr/)

실내정원용 식물 API (https://www.nongsaro.go.kr/)

Iamport 결제 API (https://portone.io/korea/ko)

<h1>💬 회고</h1>

“보안을 직접 구현하며 Spring Security의 설정 방식에 대해 깊이 이해하게 되었고,
공공 API와 상용 API를 함께 다뤄보며 실무에 가까운 설계와 오류 처리 경험을 할 수 있었습니다.”
