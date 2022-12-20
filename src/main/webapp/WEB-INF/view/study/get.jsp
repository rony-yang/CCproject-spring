<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<%-- <%@ include file="header.jsp"%> --%>
<head>
<title>${study.studyCode}</title>
<%@include file="../menu.jsp"%>
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
	<div class="container">
		<div class="in-form-background row pb-4 pt-4">
			<div class="in-form col-md-12 mx-auto">
				<h4 class="mb-3 fw-bold">상세보기</h4>

				<div class="form-horizontal row">
					<div class="col-md-5">
						<img src="/ccProject/resources/img/${study.studyImage}"
							style="width: 90%;">
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label>과목 명 [과목코드]</label>
							<h3>
								<input class="form-control" name='studyCourse'
									value='<c:out value="${study.studyCourse}" /> [ <c:out value="${study.studyCode}" /> ]'
									readonly="readonly">
							</h3>
						</div>
						<div class="form-group">
							<label>과목 설명</label>
							<textarea class="form-control" rows="8" name='studyContent'
								readonly="readonly"><c:out
									value="${study.studyContent}" /></textarea>
						</div>
						<p>
						<div class="form-group">
							<label>선생님</label> <input class="form-control"
								name='studyTeacher'
								value='<c:out value="${study.studyTeacher}" />'
								readonly="readonly">
						</div>
						<p>
						<div class="form-group">
							<label>수강 날짜</label> <input class="form-control" name='studyDate'
								value='<c:out value="${study.studyStartDate}" /> ~ <c:out value="${study.studyEndDate}" />'
								readonly="readonly">
						</div>
						<p>
						<div class="form-group">
							<label>강의 시간</label> <input class="form-control" name='studyTime'
								value='<c:out value="${study.studyStarthour}" /> ~ <c:out value="${study.studyEndhour}" />'
								readonly="readonly">
						</div>
						<div class="form-group">
							<label>수강료</label> <input class="form-control" name='studyDate'
								value='<c:out value="${study.studyPricedot}" /> 원'
								readonly="readonly">
						</div>
						<p>
							<button data-oper='list' class="btn btn-secondary m-3">
								<a href="/ccProject/study/list"
									style="color: white; text-decoration: none">List</a>
							</button>
							<button data-oper='list' class="btn btn-secondary">
								<a href="/ccProject/course/regist/<c:out value="${study.studyCode}" />"
									style="color: white; text-decoration: none">수강신청</a>
							</button>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@include file="../footer.jsp"%>
</body>

</html>