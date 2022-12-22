# 비대면 출결 및 수업관리 시스템
Spring Framework 팀프로젝트

**1. 메인 사진**
![project2](https://user-images.githubusercontent.com/116271236/209054712-f8e5d84b-deea-4c33-8b64-96a76f905d78.png)

**2. URL 주소** : 추후 예정

**3. 작업기간** : 2022. 10. 26 ~ 11. 11

**4. 작업인원** : 4명

- 나의 역할 : 장바구니 기능을 응용한 수강신청 및 조회/수정/삭제 기능

**5. 개발 목표** : 출결을 체크할 수 있고 수업관리를 할 수 있는 학원 홈페이지 시스템 구축

**6. 사용 기술**

- 언어 : Java, JSP, HTML, CSS, JS, ajax, Spring Framework

- 프로그램 : eclipse, sql developer

- 서버 : Tomcat, Oracle

**7. 주요기능**

- 회원가입 및 로그인 기능

- 수강신청 및 조회/수정/삭제 기능 / 출결 관리

- 개인별/ 반별 게시판 글작성 및 조회/수정/삭제 

**8. Advanced Feature**

- 수강신청 : 처음넣을때는 무조건 보류(2)로 넣고 이후 관리자가 확인하여 거절(0)이나 허가(1)하도록 설정하였습니다.

- 수강신청 목록 : 등록(registration: reg) 테이블 / 수강과목(study: stdy) 테이블 / 허락(allowance: aw) 테이블에서

해당되는 조건값만을 가져와서 출력합니다.

```java
<!-- 수강신청 -->
	<insert id="Course_regist">
	
		insert into registration(userId, studyCode, studyAllow)
		values(#{userId}, 
			   #{studyCode}, 2)



<!-- 수강신청 목록 -->
	<select id="Course_list" resultType="com.example.domain.RegistrationConfirmDTO">
	
		select reg.userId, reg.studyCode, stdy.studyCourse, stdy.studyStartDate, stdy.studyPrice, aw.comments status
		from registration reg inner join allow aw 
        on reg.studyallow=aw.studyallow
        inner join study stdy on reg.studyCode = stdy.studyCode
        where userid = #{userId}
  ```


**9. 개선사항** : 디자인 개선 및 자잘한 예외사항 추가 예정입니다.
