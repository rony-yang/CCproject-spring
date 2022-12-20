<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	String userName = (String) session.getAttribute("userName");
	/* 이 녀석은 컨트롤러에서 던져준 세션 아이디를 확인해봐야할 것.  */
%>
<head>
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<nav class="navbar navbar-expand  navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">과정소개</a>
			<a class="navbar-brand" href="#">공지사항</a>
		</div>
		<div>
			<ul class="navbar-nav mr-auto">
				<c:choose>
					<c:when test="${empty sessionId}">
						<li class="nav-item">
							<a class="nav-link" href="/ccProject/userinfo/login/">로그인</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/ccProject/userinfo/join/">회원 가입</a>
						</li>
					</c:when>
					<c:otherwise>
						<li style ="padding-top :7px;color:white">[<%=userName%>님] 환영합니다.</li>
						<li class="nav-item">
							<a class="nav-link" href="/ccProject/userinfo/updateUser/">내 정보</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/ccProject/userinfo/logout/">로그아웃</a>
						</li>
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
				<div class="navbar-header">
				</div>
				<div>
					<ul class="navbar-nav mr-auto">			
						<li class="nav-item"><a class="nav-link" href="#">출결 현황</a></li>
						<li class="nav-item"><a class="nav-link" href="#">개인 게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="#">반 게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="#">수강 확인</a></li>
						<li class="nav-item"><a class="nav-link" href="#">회원 정보</a></li>
						<li class="nav-item"><a class="nav-link" href="#">관리자 메뉴</a></li>  
					</ul>
				</div>
			</div>
		</nav>
	</c:when>
	<c:when test="${not empty sessionId}"> 
	<!-- 위의 이 부분은 "수강생"인 경우 표시되는 헤더. ***사용 시에는 위의 코드를 수정할 것. -->
		<nav class="navbar navbar-expand navbar-dark bg-dark">
			<div class="container">
				<div class="navbar-header">
				</div>
				<div>
					<ul class="navbar-nav mr-auto">
						<li class="nav-item"><a class="nav-link" href="#">수강중인 과정정보</a></li>			
						<li class="nav-item"><a class="nav-link" href="#">출결 현황</a></li>
						<li class="nav-item"><a class="nav-link" href="#">개인 게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="#">반 게시판</a></li> 
					</ul>
				</div>
			</div>
		</nav>
	</c:when>
</c:choose>