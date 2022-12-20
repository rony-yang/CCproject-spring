<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#uploadBtn").on("click", function(e) {
				var formData = new FormData();
				var inputFile = $("input[name='uploadFile']");
				var files = inputFile[0].files;
				console.log(files);
				
				for(var i=0;i<files.length;i++){
					formData.append("uploadFile", files[i]);
				} 
				
				$.ajax({
						url :'/ccProject/admin/uploadAjaxAction', 
						processData : false,
						contentType : false,
						data : formData, //formData라는 객체에 담겨서 컨트롤러로 향함.
// 						dataType : 'json', // 날아온 데이터를 받는 방식. 설정하지 않으면 
						type: 'POST',
						success:function(result){						
							alert("수강 등록 완료");
						},
						error:function(error){
							alert("다시 시도해주세요.");
						}
				}); //$.ajax
						
				
				
			});
		});
	</script>

	<form method="post"
		enctype="multipart/form-data">

		<input type='file' name='uploadFile' multiple>
		<button id="uploadBtn">submit</button>
	</form>

</body>
</html>