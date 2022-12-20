<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
rel="stylesheet"
integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<form name="newMember" action="/ccProject/userinfo/join/"
			class="form-horizontal" method="post" onsubmit="return checkForm()">

			<!-- <div class="form-group row">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-3">
					<input type="text" name="userId" id="memberId" class="form-control">
				</div>
			</div> -->


			<!-- <div class="form-group row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input type="password" name="userPassword" id="memberPW"
						class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">비밀번호 확인</label>
				<div class="col-sm-3">
					<input type="password" name="userPasswordCheck" id="memberPWC"
						class="form-control">
				</div>
			</div> -->


			<!-- <div class="form-group row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input type="text" name="userName" id="memberName"
						class="form-control">
				</div>
			</div> -->

			<!-- <div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-3">
					<input type="text" name="userAddress" id="memberAddress"
						class="form-control">
				</div>
			</div> -->

			<div class="form-group row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input type="text" name="userPhone" id="memberPhone"
						class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-5 ">
					<input type="submit" class="btn btn-primary" value="등록"> <a
						href="./main.jsp" class="btn btn-secondary">취소</a>
				</div>
			</div>
		</form>
	</div>
	</div>


	<div class="jumbotron">
		<div class="container">
			<h1>로그인</h1>
		</div>
		<hr>
		<div class="container mt-5">
			<form name="loginMember" action="/ccProject/userinfo/login/"
				class="form-horizontal" method="post" onsubmit="return checkForm()">
				<div class="form-group row">
					<label class="col-sm-2">아이디</label>
					<div class="col-sm-3">
						<input type="text" name="userId" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2">비밀번호</label>
					<div class="col-sm-3">
						<input type="password" name="userPassword" class="form-control">
					</div>
				</div>
				<%
				if (request.getParameter("error") != null) {
					out.println("<div class='alert alert-danger'>");
					out.println("아이디 혹은 비밀번호를 확인해 주세요");
					out.println("</div>");
				}
				%>

				<input type="submit" class="btn btn-primary" value="로그인">
			</form>
		</div>
	</div>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상세보기</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="/ccProject/resources/img/${study.studyImage}"
					style="width: 90%;">
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label>과목 명 [과목코드]</label>
					<h3>
						<input class="form-control" name='studyCourse'
							value='<c:out value="${study.studyCourse}" /> [ <c:out value="${study.studyCode}" /> ]'
							readonly="readonly">
					</h3>
				</div>
				<div class="form-group">
					<label>과목 설명</label>
					<textarea class="form-control" rows="8" name='studyContent'
						readonly="readonly"><c:out
							value="${study.studyContent}" /></textarea>
				</div>
				<p>
				<div class="form-group">
					<label>선생님</label> <input class="form-control" name='studyTeacher'
						value='<c:out value="${study.studyTeacher}" />'
						readonly="readonly">
				</div>
				<p>
				<div class="form-group">
					<label>수강 날짜</label> <input class="form-control" name='studyDate'
						value='<c:out value="${study.studyStartDate}" /> ~ <c:out value="${study.studyEndDate}" />'
						readonly="readonly">
				</div>
				<p>
				<div class="form-group">
					<label>강의 시간</label> <input class="form-control" name='studyTime'
						value='<c:out value="${study.studyStarthour}" /> ~ <c:out value="${study.studyEndhour}" />'
						readonly="readonly">
				</div>
				<div class="form-group">
					<label>수강료</label> <input class="form-control" name='studyDate'
						value='<c:out value="${study.studyPricedot}" /> 원'
						readonly="readonly">
				</div>
				<p>
					<button data-oper='list' class="btn btn-info">
						<a href="/ccProject/study/list"
							style="color: white; text-decoration: none">List</a>
					</button>
					<button data-oper='list' class="btn btn-info">
						<a href="/ccProject/study/list"
							style="color: white; text-decoration: none">수강신청</a>
					</button>
			</div>
		</div>
	</div>



















</body>
</html>