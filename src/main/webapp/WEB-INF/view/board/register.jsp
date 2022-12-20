<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<%@include file="../include/header.jsp"%>
<%@include file ="../menu.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
rel="stylesheet"
integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
crossorigin="anonymous">

<!-- include summernote css/js-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>




<script>
	$(document).ready(function() {
		//썸머노트에 값 넣기
		$('#summernote').summernote({
			placeholder : '본문',
			minHeight : 400,
			maxHeight : null,
			focus : true,
			lang : 'ko-KR'
		});
	});

	function goWrite(frm) {
		var title = frm.title.value;
		var writer = frm.writer.value;
		var content = frm.content.value;

		if (title.trim() == '') {
			alert("제목을 입력해주세요");
			return false;
		}
		if (writer.trim() == '') {
			alert("작성자를 입력해주세요");
			return false;
		}
		if (content.trim() == '') {
			alert("내용을 입력해주세요");
			return false;
		}
		frm.submit();
	}
</script>

</head>

<body>
	<c:choose>
		<c:when test="${not empty sessionId}">
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

									<!-- /.panel-heading -->
									<div class="panel-body">
										<form role="form" action="/ccProject/board/register" method="post">
											<div class="form-group">
												<label>제목</label> <input class="form-control"
													name='bbsTitle' placeholder='제목'>
											</div>

											<div class="form-group">
												<label>본문</label>
												<textarea id="summernote" class="form-control" rows="10"
													name='bbsContent'></textarea>
											</div>

											<div class="form-group">
												<input class="form-control" name='userId' value="<%=sessionId%>" 
												type="hidden"/>
											</div>
											<div class="form-group">
												<label>과목코드</label> <input class="form-control"
													name='studyCode' placeholder="과목코드" />
											</div>

											<button type="submit" class="btn btn-info">제출</button>
											<button type="reset" class="btn btn-default">초기화</button>
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
		</c:when>
	</c:choose>

	<!-- null -->

</body>

</html>