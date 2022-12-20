<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>




	<script type="text/javascript">
		$(function() {
			const formObj = $("form");

			$('button').on("click", 
				function(e) 
				{
				
				e.preventDefault();

				const operation = $(this).data("oper");

				console.log(operation);

				if (operation === 'remove') 
				{
					formObj.attr("action", "/board/remove");
				} else if (operation === 'list') 
				{
					//self.location = "/board/list";
					formObj.attr("action", "/board/list").attr("method", "get");
					formObj.empty();
					//return;
				}
				formObj.submit();
			});
		});
	</script>

<script>
$(document).ready(function() {
	//썸머노트에 값 넣기
	  $('#summernote').summernote({
 	    	placeholder: '본문',
	        minHeight: 400,
	        maxHeight: null,
	        focus: true, 
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
<body>
	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-5">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">게시물 수정</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							
							<!-- /.panel-heading -->
							<div class="panel-body">
								<form role="form" action="/board/modify" method="post">
									<!-- 입력 시작 -->
									<div class="form-group">
									<!-- 숨김처리 할 것 -->
										<!-- <label>게시물번호</label> --> 
										<input class="form-control" name='bbsID'
											value='<c:out value="${board.bbsID }"/>' readonly="readonly" 
											type="hidden"/>
									</div>

									<div class="form-group">
										<label>제목</label> <input class="form-control" name='bbsTitle' 
										value='<c:out value="${board.bbsTitle}"/>'>
									</div>

									<div class="form-group">
										<label>본문</label>
										<textarea id="summernote" class="form-control" rows="10" name='bbsContent'>
										<c:out value="${board.bbsContent}" /></textarea>
									</div>
									
									<!-- 숨김처리 할 것 -->
									<div class="form-group">
										<!-- <label>글쓴이</label> --> 
										<input class="form-control"
											name='userId' value='<c:out value="${board.userId }"/>'
											readonly="readonly" type="hidden" />
									</div>
					
									<div class="form-group">
										<!-- <label>날짜</label> --> 
										<input class="form-control"
											name='bbsDate'
											value='<fmt:formatDate pattern = "yyyy/MM/dd"
										value="${board.bbsDate }"/>'
											readonly="readonly" 
											type="hidden"
											/>
									</div>

									<%-- <div class="form-group">
										<label>Update Date</label> <input class="form-control"
											name='updateDate'
											value='<fmt:formatDate pattern = "yyyy/MM/dd"
										value="${board.updateDate }"/>'
											readonly="readonly" />
									</div> --%>
									<!-- 수정 날짜를 넣는것이 좋을까? 일단 빼자, 최초 업로드일만 남겨놓는다. -->
									
									<button data-oper='submit' data-oper='modify'
										class="btn btn-info">수정하기</button>
									<button data-oper='submit' data-oper='remove'
										class="btn btn-danger">삭제하기</button>
									<button data-oper='submit' data-oper='list'
										class="btn btn-warning">목록으로 돌아가기</button>
								</form>

							</div>
							<!-- panel-body 끝 -->
						</div>
						<!-- end panel-body -->
					</div>
					<!-- end panel-->
				</div>
				<!-- /.row -->


			</div>

		</div>
	</div>


	<!-- null -->

</body>

</html>