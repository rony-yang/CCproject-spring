<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>

<head>
<%@include file="../include/header.jsp"%>
<%@include file ="../menu.jsp" %>
</head>

<body>

	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-5">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">글 작성하기</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">글 작성하기</div>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<form role="form" action="/board/register" method="post">
									<div class="form-group">
										<label>제목</label> <input class="form-control" name='bbsTitle'>
									</div>

									<div class="form-group">
										<label>본문</label>
										<textarea class="form-control" rows="10" name='bbsContent'></textarea>
									</div>

									<div class="form-group">
										<label>아이디</label> <input class="form-control" name='userId'>
									</div>
									<div class="form-group">
										<label>과목코드</label> <input class="form-control" name='studyCode'>
									</div>
									
									<button type="submit" class="btn btn-default">제출
										</button>
									<button type="reset" class="btn btn-default">초기화
										</button>
								</form>
							</div>
							<!-- end panel-body -->
						</div>
						<!-- end panel-body -->
					</div>
					<!-- end panel-->
				</div>


			</div>
		</div>
	</div>


	<!-- null -->

</body>

</html>