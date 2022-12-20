<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강취소</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
rel="stylesheet"
integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
crossorigin="anonymous">
</head>
<%@include file="../menu.jsp"%>
<body>



<div class="jumbotron">
	<div class="container"><h1>수강취소</h1>
	</div>
	<hr>
	<div class="container mt-5">
		<form name="registration" action="/ccProject/course/delete" class="form-horizontal" method="post" onsubmit="return checkForm()">
			<div class="form-group row">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-3">
					<input type="text" name="userId" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">신청과목</label>
				<div class="col-sm-3">
					<input type="text" name="studyCode" class="form-control">
				</div>
			</div>
			<br>
			<input type="submit" class="btn btn-primary" value="수강취소">
		</form>
	</div>
</div>


</body>
</html>