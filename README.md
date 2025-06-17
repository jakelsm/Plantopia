🌱 Plantopia | 반려식물 커뮤니티 & 스토어 플랫폼

Plantopia는 반려식물에 관심 있는 사용자들을 위한 웹 기반 통합 플랫폼입니다.
저는 이 프로젝트에서 팀장으로 전체적인 개발 방향을 리드하였고,
Spring 기반 백엔드 아키텍처와 보안 설계, 주요 기능 구현 및 외부 API 연동을 직접 담당했습니다.

📌 프로젝트 개요

개발 기간: 2025.04 ~ 2025.05 (5주)

참여 인원: 3명

역할: 팀장 / 백엔드 총괄 / 보안 및 인증 설계 / API 연동 담당

주요 기여

Spring Security 기반 로그인/회원가입 및 권한 분리 설계

MyBatis를 활용한 DB 연동 및 CRUD 처리

도로명 주소 API, 실내정원 식물 API, Iamport 결제 API 연동

전체 웹 시스템 구조 설계 및 배포 환경 세팅(Tomcat, WAR 추출)

🧭 프로젝트 목표

반려식물 커뮤니티의 부재 문제 해결
기존 반려동물 중심 커뮤니티와 달리, 식물 애호가들이 정보 교류하고 제품을 구매할 수 있는 플랫폼이 필요했습니다.

사용자 접근성 + 기능성 동시 확보
커뮤니티, 클리닉 상담, 식물 정보 탐색, 온라인 스토어 기능을 통합 제공

🛠️ 주요 기능 및 구현

기능	설명	기여도

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

⚙️ 기술 스택

Frontend: HTML5, CSS3, JavaScript, JSP, Bootstrap

Backend: Spring Boot, Spring Security, MyBatis

Database: MySQL

Infra: Apache Tomcat 10.1, Git, GitHub

API:

행정안전부 도로명 주소 API

농사로 식물 정보 API

Iamport 결제 API

🖥️ 실행 화면 예시

<./images/main_page.png>
<./images/login.png>
<./images/plant_detail.png>
<./images/payment.png>

(이미지는 나중에 삽입하시면 됩니다)

👨‍👩‍👧 팀 구성

이름	역할	GitHub

이승민	팀장 / 백엔드 / 보안 / API	github.com/yourusername

김OO	프론트엔드 / UI 디자인

박OO	DB 설계 / 클리닉 기능 구현

🔗 참고자료

도로명 주소 API

실내정원용 식물 API

Iamport 결제 API

💬 회고

“보안을 직접 구현하며 Spring Security의 설정 방식에 대해 깊이 이해하게 되었고,
공공 API와 상용 API를 함께 다뤄보며 실무에 가까운 설계와 오류 처리 경험을 할 수 있었습니다.”
