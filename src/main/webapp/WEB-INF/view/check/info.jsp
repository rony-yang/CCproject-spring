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
	<%@include file="modal.jsp"%>

	<script type="text/javascript">
		
		// 이 녀석은 코스명 토글 스크립트.
		$(function() {
			//여기 이 버튼 이벤트가 버튼이기만 하면 분별없이 작동 함. 이후에 id값이나 class값을 떼와서 토글 버튼일 경우에만 작동하게끔 만들면 괜찮을 것.
			$("button").on("click", function() { // 여기 이벤트는 문서로딩될 때가 아니라 이벤트 처리 함수로 만들 것.(버튼 클릭했을 시의 이벤트 처리 함수.)		

				let studyCode = this.id;
				let tbody = document.getElementById("courseCheck_"+studyCode); //tbody 객체의 여부를 따져서 토글을 활성화할지 말지를 결정할 것.
				
				if(!tbody){
					let page = studyCode+"_"+"1";
					pagination(page);
				}else{
					let bname = this.id; //
					let check = $("#courseCheck_" + bname);
					check.toggle();
				}
					

			});
		});
	</script>

	<script type="text/javascript">
		// 입실, 퇴실 스크립트.
		function join(code) {
			let joinCheck = confirm("입실 하시겠습니까?");
			if (joinCheck == true) {
				let realCheck = confirm("정말로 입실하시겠습니까? \n ***(입실 시간이 수정됩니다.)***");
				if (realCheck == true) {
					location.href = "/ccProject/check/join/" + code;
				}
			}
		};

		function exit(code) {
			let joinCheck = confirm("퇴실하시겠습니까?");
			if (joinCheck == true) {
				let realCheck = confirm("정말로 퇴실 하시겠습니까? \n***(이후 수정할 수 없습니다.)***");
				if (realCheck == true) {
					location.href = "/ccProject/check/exit/" + code;
				}
			}
		};
	</script>

	<script type="text/javascript">
		// 로그인
		$(function() {
			const result = '<c:out value="${result}"/>';

			if (result == 'failed') {
				checkModal(result);
			}

			function checkModal(result) {
				alert("이미 퇴실했습니다.");
			}

		});
	</script>

	<script type="text/javascript">
		function pagination(page){
			let arr = page.split("_");
			const studyCode = arr[0];
			const pageNum = arr[1];
							
			const a = page;
			
			let list = Array.from('${list}');
			
			let listValue = list[0].studyCode;
			
			let tbody = $("#courseCheck_"+studyCode);
			tbody.empty(); //삭제 후 ajax로 붙여넣기 해줄 것임.			
			
			//여기서 추가할 tbody를 대충 정의해줌. 
			let newTbody = document.createElement('tbody');
			newTbody.setAttribute('id', "courseCheck_"+studyCode);
			newTbody.classList.add("courseCheck");
			
			$.ajax
			({
				url: '/ccProject/check/info/'+studyCode+'/'+pageNum,
				method: 'GET',   
			    dataType: 'json'
			})			
			.done(function(json) {
				let size = json.length;
				
				for(let i =0;i<size;i++){
					//tr객체를 생성 후 속성 설정.
					var tr = document.createElement('tr');
					tr.setAttribute("id", studyCode+"_"+i);
					
					//json객체에서 속성 값 획득				
					var studyCode = json[i].studyCode;
					var attendanceDate = json[i].attendanceDate;
					var attendanceJoin = json[i].attendanceJoin;
					var attendanceExit = json[i].attendanceExit;
					
					
					//속성 값을 넣어주기 위한 td객체 생성.	
					var attDate = document.createElement('td');
					var attJoin = document.createElement('td');
					var attExit = document.createElement('td');
					var attResult = document.createElement('td');
					
					attDate.innerHTML = attendanceDate;
					attDate.setAttribute("style", "text-align: center");
					attJoin.innerHTML = attendanceJoin;
					attExit.innerHTML = attendanceExit;					
					attResult.innerHTML = json[i].attendanceResult;

					if(json[i].attendanceResult){
						attResult.setAttribute("bgcolor", "red");
					}
	
					
					//tr객체에 td객체를 넣어줌.
					tr.appendChild(attDate);
					tr.appendChild(attJoin);
					tr.appendChild(attExit);
					tr.appendChild(attResult);
					
					//tbody객체에 tr객체를 넣어 줌.
					newTbody.appendChild(tr);
					
				}
				
				let table = document.getElementById("table_"+studyCode);
				table.prepend(newTbody);
// 			   alert(json); // 테스트용 코드.
			})
			.fail(function(xhr, status, errorThrown) {
			   alert("실패");
			});
		}
	</script>



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
<%-- 									 href="ccProject/check/info/${board.studyCode}/${index}" --%>
										<c:out value="${index}"/>
									</a>
								</li>
								
								
							</c:forEach>
<!-- 							<li class="page-item"><a class="page-link" href="#">Next</a></li> -->
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