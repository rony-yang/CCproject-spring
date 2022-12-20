<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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

.input-form {
	max-width: 680px;
	margin-top: 0px;
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
<%@include file="../menu.jsp"%>
<!-- <script type="text/javascript">
	function checkForm() {

		if (!document.newMember.memberId.value) {
			alert("아이디를 입력해주세요.");
			return false;
		}
		if (!document.newMember.memberPW.value) {
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		if (document.newMember.memberPW.value != document.newMember.memberPWC.value) {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		if (!document.newMember.memberName.value) {
			alert("성명은 필수입니다.");
			return false;
		}
	}
</script> -->

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#uploadBtn").on("click", function(e) {
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			console.log(files);

			for (var i = 0; i < files.length; i++) {
				formData.append("uploadFile", files[i]);
			}

			$.ajax({
				url : '/ccProject/admin/uploadAjaxAction',
				processData : false,
				contentType : false,
				data : formData, //formData라는 객체에 담겨서 컨트롤러로 향함.
				// 						dataType : 'json', // 날아온 데이터를 받는 방식. 설정하지 않으면 
				type : 'POST',
				success : function(result) {
					alert("수강 등록 완료");
				},
				error : function(error) {
					alert("다시 시도해주세요.");
				}
			}); //$.ajax

		});
	});
</script>


</head>
<body>
	<div class="container">
		<div class="input-form-background row p-5">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">강의 추가</h4>
				<form class="newMember" action="/ccProject/admin/addStudy/" class="form-horizontal" method="post" enctype="multipart/form-data" onsubmit="return checkForm()">

					<div class="mb-3">
						<label>강의명</label> <input type="text" class="form-control"
							name="studyCourse">
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label>강의 코드</label> <input type="text" class="form-control"
								name="studyCode">
						</div>

						<div class="col-md-6 mb-3">
							<label>담당 강사</label> <input type="text" class="form-control"
								name="studyTeacher">
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label>시작 날짜</label> <input type="date" class="form-control"
								name="studyStartDate">
						</div>

						<div class="col-md-6 mb-3">
							<label>종료 날짜</label> <input type="date" class="form-control"
								name="studyEndDate">
						</div>
					</div>

					<div class="mb-3">
						<label>강의 내용</label>
						<textarea cols="50" rows="10" class="form-control"
							name="studyContent"></textarea>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label>시작 시간</label> <input type="time" class="form-control"
								name="studyStartTime">
						</div>

						<div class="col-md-6 mb-3">
							<label>종료 시간</label> <input type="time" class="form-control"
								name="studyEndTime">
						</div>
					</div>

					<div class="mb-3">
						<label>수강료</label> <input type="number" class="form-control"
							step="1000" name="studyPrice">
					</div>
					
					<div class="mb-3">
						<input type='file' name='uploadFile' value="강의 이미지 첨부">				
					</div>
						
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-5 ">
							<input type="submit" class="btn btn-secondary" value="등록">
							<a href="/ccProject/study/welcome/" class="btn btn-danger">취소</a>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
</body>
</html>