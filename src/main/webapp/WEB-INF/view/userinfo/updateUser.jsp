<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file ="../menu.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
rel="stylesheet"
integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
crossorigin="anonymous">
<script type="text/javascript">

// function checkForm(){

// 	if(!document.newMember.memberPW.value){
// 		alert("비밀번호를 입력해주세요.");
// 		return false;
// 	}
// 	if(document.newMember.memberPW.value != document.newMember.memberPWC.value){
// 		alert("비밀번호가 일치하지 않습니다.");
// 		return false;
// 	}
// }

</script> 

			<script type="text/javascript">
			function check (){				
				let deleteCheck = confirm("계정을 삭제하시겠습니까?");			
				if(deleteCheck==true){		
					let realCheck = confirm("정말로 계정을 삭제하시겠습니까? (복구할 수 없습니다.)");
					if(realCheck == true){
						location.href ="/ccProject/userinfo/deleteUser/";
					}
				}
				
// 				forms1.submit(); // 
			}
			</script>




</head>
<body>
<div class="jumbotron">
	<h1 class="display-3" align="center">회원 정보</h1>
</div>
<hr>
<div>	

	<div class="container">
		<form name="newMember" id="newMember" action="/ccProject/userinfo/updateUser/" class="form-horizontal" method="post">
			<div class="form-group row">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-3">
					<input type="text" name="userId" id="memberId" class="form-control" disabled="disabled" value="<c:out value="${userInfo.userId}"/>">
					<input type="text" name="userId" id="memberId" class="form-control" hidden="true" value="<c:out value="${userInfo.userId}"/>">		
				</div>	
			</div>
			
			
			<div class="form-group row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input type="password" name="userPassword" id="memberPW" disabled="disabled"
						class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">비밀번호 확인</label>
				<div class="col-sm-3">
					<input type="password" name="userPasswordCheck" id="memberPWC" disabled="disabled"
						class="form-control">
				</div>
			</div>


			<div class="form-group row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input type="text" name="userName" id="memberName"
						class="form-control" disabled="disabled" value="<c:out value="${userInfo.userName}"/>">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-3">
					<input type="text" name="userAddress" id="memberAddress" class="form-control" value="<c:out value="${userInfo.userAddress}"/>">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input type="text" name="userPhone" id="memberPhone" class="form-control" value="<c:out value="${userInfo.userPhone}"/>">
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-5 ">
					<input type="submit" class="btn btn-primary" value="등록">
					<a href="/ccProject/userinfo/mainInfo/" class="btn btn-secondary">취소</a>
				</div>
			</div>
		</form>
		<hr>	
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-5 ">
						<button type="submit" class="btn btn-danger" onclick="check()">회원 탈퇴</button>
					</div>
				</div>
	</div>
</div>
</body>
</html>