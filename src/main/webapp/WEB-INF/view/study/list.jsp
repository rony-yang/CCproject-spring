<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- <%@ include file="header.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과정소개</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
rel="stylesheet"
integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
crossorigin="anonymous">


<style>
body {
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top, from(#BDBDBD),
		to(#E1E1E1));
	background: -webkit-linear-gradient(bottom left, #BDBDBD 0%, #E1E1E1 100%);
	background: -moz-linear-gradient(bottom left, #BDBDBD 0%, #E1E1E1 100%);
	background: -o-linear-gradient(bottom left, #BDBDBD 0%, #E1E1E1 100%);
	background: linear-gradient(to top right, #BDBDBD 0%, #E1E1E1 100%);
}

.in-form {
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
</style>

</head>
<body>
	<%@include file="../menu.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	<div class="container">
		<div class="in-form-background row pb-4 pt-4">
			<div class="in-form col-md-12 mx-auto">
				<h1 class="display-3 p-4 fw-bold">과정 소개</h1>
				<hr class="border border-white border-2 opacity-100">
				<div>
					<div class="container">
						<div class="row" align="center">
							<c:forEach items="${list}" var="study">
								<div class="col-md-4 pb-3 pt-3">
									<div class="card h-100" style="width: 18rem;">
										<img src="/ccProject/resources/img/${study.studyImage}"
											class="card-img-top" alt="">
										<div class="card-body">
											<h5 class="card-title">
												[
												<c:out value="${study.studyCode}" />
												]
											</h5>
											<p class="card-text">
												<c:out value="${study.studyCourse}" />
											</p>
											<a
												href='/ccProject/study/get?studyCode=<c:out value="${study.studyCode}" />'
												class="btn btn-secondary">상세 정보</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	<%@include file="../footer.jsp"%>
</body>
</html>