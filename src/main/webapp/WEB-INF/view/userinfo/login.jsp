<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
rel="stylesheet"
integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
crossorigin="anonymous">
<script type="text/javascript">

function checkForm(){

	
	if(!document.loginMember.memberId.value){
		alert("아이디를 입력해주세요.");
		return false;
	}
	if(!document.loginMember.memberPW.value){
		alert("비밀번호를 입력해주세요.");
		return false;
	}
}

function()


</script>



<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file ="../menu.jsp" %>
</head>
<body>
<div class="jumbotron">
	<div class="container"><h1>로그인</h1>
	</div>
	<hr>
	<div class="container mt-5">
		<form name="loginMember" action="/ccProject/userinfo/login/" class="form-horizontal" method="post" onsubmit="return checkForm()">
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
			<%if(request.getParameter("error")!=null) {
				out.println("<div class='alert alert-danger'>");
				out.println("아이디 혹은 비밀번호를 확인해 주세요");
				out.println("</div>");
			}
			%>
			
			<input type="submit" class="btn btn-primary" value="로그인">
		</form>
	</div>
</div>

</body>
</html>