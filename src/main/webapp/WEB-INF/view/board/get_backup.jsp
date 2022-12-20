<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>

<%@include file="../include/header.jsp"%>
<%@include file ="../menu.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
rel="stylesheet"
integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
crossorigin="anonymous">
<!-- 썸머노트-->
 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>

<body>

	<script type="text/javascript">
		$(function() {
			
			const formObj = $("#operForm"); //id라서 #을 붙인다. role이 아님

			$('button').on("click", function(e) {
				e.preventDefault();

				const operation = $(this).data("oper");

				console.log(operation);

				if (operation === 'remove') {
					formObj.attr("action", "/board/remove");
				} else if (operation === 'list') {
					//self.location = "/board/list";
					formObj.find("#bbsID").remove();
					formObj.attr("action","/board/list")
				}
				formObj.submit();
			});
		});
	</script>
	<script type="text/javascript" src="/resources/js/reply.js">
	
	var bbsIDValue = '<c:out value="${board.bbsID}"/>';
	
	replyService.add({
		reply : "js test",
		replyer : "tester",
		bbsID : bbsIDValue
	}, function(result){
		alert("result: " + result);
	});
	 // 게시글을 읽을때 자동으로 댓글 1개 등록.
	
	</script>


<!--  https://po9357.github.io/spring/2019-05-21-Board_Write/  썸머노트 같은 외부 api 사용은 어떨까? -->
	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-5">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">게시물 읽기</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							
							<!-- /.panel-heading -->
							<div class="panel-body">

								<div class="form-group">
									<!-- <label>게시물 번호</label> --> 
									
									<input class="form-control" name='bbsID'
										value='<c:out value="${board.bbsID }"/>' readonly="readonly" />
								</div>

								<div class="form-group">
									<label>제목</label> <input class="form-control" name='bbsTitle'
										value='<c:out value="${board.bbsTitle }"/>' readonly="readonly" />
								</div>

								<div class="form-group">
									<label>내용</label>
									<textarea class="form-control" rows="10" name='bbsContent'
										readonly="readonly">
										<c:out value="${board.bbsContent}" /> 
										<!-- 여기를 수정 하면 HTML로 간단하게 뽑힐것 같다. -->
										<!-- 자바스크립트에서 받아서 변수 넣기 -->
										</textarea>
								</div>

								<div class="form-group">
									<label>아이디</label> <input class="form-control" name='userId'
										value='<c:out value="${board.userid }"/>' readonly="readonly" />
								</div>


								<!-- 	<button data-oper='modify' class="btn btn-default">Modify</button> -->
								<!-- 	<button data-oper='list' class="btn btn-info">List</button>  -->
								<!-- 버튼을 누르고 수정을 완료하는것이 아닌, 수정창을 띄우는 버튼이 되어야한다. -->
								<%-- 	<button data-oper='modify' class="btn btn-default">
								<a href="/board/modify?bbsID=<c:out value="${board.bbsID}"/>">Modify</a>
								</button>
								<!-- 삭제버튼 -->
								<button data-oper='remove' class="btn btn-danger">
									<a href="/board/remove?bbsID=<c:out value="${board.bbsID}"/>">Remove</a>
								</button>
								<!-- 리스트 버튼 -->
								<button data-oper='list' class="btn btn-info">
									<a href="/board/list">List</a>
								</button> --%>

								<!-- submit 버튼으로 대체 -->
								<button type="submit" data-oper="modify" class="btn btn-default">수정하기</button>
								<button type="submit" data-oper="remove" class="btn btn-default">삭제하기</button>
								<button type="submit" data-oper="list" class="btn btn-default">목록으로</button>

								<form id='operForm' action="/board/modify" method="get">
									<!-- get방식, 수정창 띄워야함 -->
									<input type='hidden' id='bbsID' name='bbsID'
										value='<c:out value="${board.bbsID }"/>'>
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