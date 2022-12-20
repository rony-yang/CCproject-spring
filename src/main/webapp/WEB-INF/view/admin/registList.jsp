<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
rel="stylesheet"
integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
crossorigin="anonymous">

<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js" -->
<!-- integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" -->
<!-- crossorigin="anonymous"></script> -->

<%@include file="../menu.jsp"%>

<script type="text/javascript">
	/* 삭제 버튼 클릭 메서드 */
	$(function() {
		$("button").on("click", function(e) {
			let index = this.id;
			let type = this.innerText;
			let url = "/ccProject/admin/update";
			
			let userIdtd = document.getElementById("userId_"+index).innerText;
			let studyCodetd = document.getElementById("studyCode_"+index).innerText;

// 			let userIdValue = userIdtd.innerText;
// 			let studyCodeValue = studyCodetd.innerText;
			
			var form = document.createElement("form");
		    form.setAttribute("method", "POST");
		    form.setAttribute("action", url);
		    
	        var userId = document.createElement("input");
		        userId.setAttribute("type", "hidden");
		        userId.setAttribute("name", "userId");
		        userId.setAttribute("value", userIdtd);
	        form.appendChild(userId);
	        var studyCode = document.createElement("input");
	        	studyCode.setAttribute("type", "hidden");
	        	studyCode.setAttribute("name", "studyCode");
	        	studyCode.setAttribute("value", studyCodetd);
	        form.appendChild(studyCode);
	        var status = document.createElement("input");
		        status.setAttribute("type", "hidden");
		        status.setAttribute("name", "status");
		        status.setAttribute("value", type);
	        form.appendChild(status);
	        
		    document.body.appendChild(form);
		    form.submit();
		    
		    
					alert(type+" 성공");

				});
	});
</script>




<title>수강신청 목록</title>
</head>

<body>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">수강 신청 현황</h1>
		</div>
	</div>



	<div class="container">
		<div class="w-100 content-center">

			<table class="table table-default table-striped table-hover">
				<thead>
					<tr>
						<th>아이디</th>
						<th>코스명</th>
						<th>코드</th>
						<th>시작일</th>
						<th>가격</th>
						<th>상태</th>
						<th style="text-align:center">처리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="registration" varStatus="index">
						<tr id="tr_${index.index}">
							<td id="userId_${index.index}"><c:out value="${registration.userId}" /></td>
							<td><c:out value="${registration.studyCourse}" /></td>
							<td id="studyCode_${index.index}"><c:out value="${registration.studyCode}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd "
									value="${registration.studyStartDate}" /></td>
							<%-- 							<td><c:out value="${registration.studyStartDate}" /></td> --%>
							<td><c:out value="${registration.studyPrice}" /></td>
							<td><c:out value="${registration.status}" /></td>
							<td><button type="submit" class="btn btn-primary" id="${index.index}">승인</button> <button type="submit" class="btn btn-danger" id="${index.index}">거절</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>