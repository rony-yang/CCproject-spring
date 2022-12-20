<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
rel="stylesheet"
integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
crossorigin="anonymous">
<%@include file="../menu.jsp"%>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">출석현황</h1>
		</div>
	</div>
	<div class="container">
		<div class="w-100 content-center">

			<c:if test="${not empty list}">
				<c:forEach items="${list}" var="board" varStatus="boardIndex">
					<table id="table_<c:out value="${board.studyCode}"/>" class="table table-striped table-hover">
						<thead>
							<tr>
								<th colspan="4">과정명 : <c:out value="${board.studyCode}" />
									<button
									 id="${board.studyCode}"
										class="courseName btn btn-primary" style="float: right" >내역 보기/닫기</button>
									<button class="btn btn-primary"
										onclick="join('${board.studyCode}')">입실</button>

									<button class=" btn btn-danger"
										onclick="exit('${board.studyCode}')">퇴실</button>
								</th>
							</tr>
							<tr>
								<th style="text-align: center">출석일자</th>
								<th>입실시간</th>
								<th>퇴실시간</th>
								<th>출석여부</th>
							</tr>
						</thead>
												<thead>
							<tr>
								<th scope="col">총훈련일수</th>
								<th scope="col">실시일수</th>
								<th scope="col">과정진행율</th>
								<th scope="col">총출석일수(출석율)</th>

							</tr>
						</thead>
						<tbody>
							<tr>
								<td><c:out value="${board.totalDate}" /></td>
								<td><c:out value="${board.currentDate}" /></td>
								<td><fmt:formatNumber
										value="${board.currentDate/board.totalDate*100}" pattern="0.#" />%</td>
								<td><c:out value="${board.checkDate}" />(<fmt:formatNumber
										value="${board.checkDate/board.currentDate*100}" pattern="0.#" />%)</td>
							</tr>
						</tbody>
					</table>
					<hr>
					<div>
					<nav aria-label="Page navigation example ">
						<ul class="pagination pagination-sm float-right">
<!-- 							<li class="page-item"><a class="page-link" href="#">Previous</a></li> -->
							<c:forEach var="index" begin="1" end="${board.totalPage}" step="1">
							
														
								<li class="page-item">
									<a class="page-link" id="${board.studyCode}_${index}_${boardIndex.index}" onclick="pagination(id)">
										<c:out value="${index}"/>
									</a>
								</li>
								
								
							</c:forEach>
						</ul>
					</nav>
					</div>

				</c:forEach>
			</c:if>
			<c:if test="${empty list}">
				<div class="jumbotron">
					<div class="container">
						<h1 class="display-3">수강한 과정이 없습니다.</h1>
					</div>
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>