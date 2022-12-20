<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file ="menu.jsp" %>
<script type="text/javascript">

function checkForm(){

	
	if(!document.newMember.memberId.value){
		alert("아이디를 입력해주세요.");
		return false;
	}
	if(!document.newMember.memberPW.value){
		alert("비밀번호를 입력해주세요.");
		return false;
	}
	if(document.newMember.memberPW.value != document.newMember.memberPWC.value){
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
	if(!document.newMember.memberName.value){
		alert("성명은 필수입니다.");
		return false;
	}
}

</script> 

</head>
<body>
<div class="jumbotron">
	<h1 class="display-3" align="center">회원 가입</h1>
</div>
<hr>
<div>	

	<div class="container">
		<form name="newMember" action="/ccProject/userinfo/join/" class="form-horizontal" method="post" onsubmit="return checkForm()">
			<div class="form-group row">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-3">
					<input type="text" name="userId" id="memberId" class="form-control">
				</div>	
			</div>
			
			
			<div class="form-group row">
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
			</div>


			<div class="form-group row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input type="text" name="userName" id="memberName"
						class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-3">
					<input type="text" name="userAddress" id="memberAddress"
						class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input type="text" name="userPhone" id="memberPhone"
						class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-5 ">
					<input type="submit" class="btn btn-primary" value="등록">
					<a href="./main.jsp" class="btn btn-secondary">취소</a>
				</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>