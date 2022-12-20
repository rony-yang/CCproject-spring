<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String result = request.getParameter("resultValue");
%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
rel="stylesheet"
integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
crossorigin="anonymous">

<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../menu.jsp"%>


	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><%=result%>
				성공
			</h1>
		</div>
	</div>

	<c:choose>
		<c:when test="${param.result=='login'}">
			<div class="container">
				<h2 class="alert alert-danger">서비스를 이용하실 수 있습니다.</h2>
			</div>
		</c:when>

		<c:when test="${param.result=='register'}">
			<div class="container">
				<h2 class="alert alert-danger">로그인 후 서비스를 이용하실 수 있습니다.</h2>
			</div>
		</c:when>


		<c:when test="${param.result=='delete'}">
			<div class="container">
				--%>
				<h2 class="alert alert-danger">지금까지 이용해주셔서 감사합니다.</h2>
			</div>
		</c:when>
	</c:choose>

	<div class="container">
		<p>
			<a href="/ccProject/userinfo/mainInfo/" class="btn btn-secondary">메인으로 &raquo;</a>
	</div>
</body>
</html>