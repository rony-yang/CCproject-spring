<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String sessionId = (String) session.getAttribute("sessionId");
String userName = (String) session.getAttribute("userName");
/* 이 녀석은 컨트롤러에서 던져준 세션 아이디를 확인해봐야할 것.  */
%>
<head>

<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="/resources/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

<!-- Bootstrap core JavaScript-->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="/resources/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="/resources/js/demo/datatables-demo.js"></script>
</head>
<nav class="navbar navbar-expand  navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
		<a class="navbar-brand" href="/ccProject/study/welcome/"><img src="/ccProject/resources/img/logo.png" style="width: 50px"></a>
	    <a class="navbar-brand" href="/ccProject/study/list/">과정소개</a> 
	    <a class="navbar-brand" href="/ccProject/board/list/">공지사항</a>
		</div>
		<div>
			<ul class="navbar-nav mr-auto">
				<c:choose>
					<c:when test="${empty sessionId}">
						<li class="nav-item"><a class="nav-link"
							href="/ccProject/fc/userinfo/login/">로그인</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/ccProject/fc/userinfo/join/">회원 가입</a></li>
					</c:when>
					<c:otherwise>
						<li style="padding-top: 7px; color: white">[<%=userName%>님]
							환영합니다.
						</li>
						<li class="nav-item"><a class="nav-link"
							href="/ccProject/fc/userinfo/updateUser/">내 정보</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/ccProject/userinfo/logout/">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>

<!--아래 jstl부분은 실제 사용 시에는 주석을 해제할 것.  -->
<c:choose>
	<c:when test="${sessionId=='admin'}">
		<!-- 위의 이 부분은 "관리자"인 경우 표시되는 헤더" ***사용 시에는 위의 코드를 수정할 것.  -->
		<nav class="navbar navbar-expand navbar-dark bg-dark">
			<div class="container">
				<div class="navbar-header"></div>
				<div>
					<ul class="navbar-nav mr-auto">
						<li class="nav-item"><a class="nav-link"
							href="/ccProject/fc/check/info/">출결 현황</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/ccProject/board/list_persnal/">개인 게시판</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/ccProject/board/list_entry/">반 게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="/ccProject/admin/registList/">수강 확인</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/ccProject/admin/addStudy/">수강 추가</a></li> <!-- 수강 추가로 변경. -->
					</ul>
				</div>
			</div>
		</nav>
	</c:when>
	<c:when test="${not empty sessionId}">
		<!-- 위의 이 부분은 "수강생"인 경우 표시되는 헤더. ***사용 시에는 위의 코드를 수정할 것. -->
		<nav class="navbar navbar-expand navbar-dark bg-dark">
			<div class="container">
				<div class="navbar-header"></div>
				<div>
					<ul class="navbar-nav mr-auto">
						<li class="nav-item"><a class="nav-link"
							href="/ccProject/fc/course/list/">과정정보</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/ccProject/fc/check/info/">출결 현황</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/ccProject/board/list_persnal/">개인 게시판</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/ccProject/board/list_entry/">반 게시판</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</c:when>
</c:choose>