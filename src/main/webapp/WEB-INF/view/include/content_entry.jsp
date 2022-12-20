<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 메인 컨텐츠 -->

<div id="content">
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">수강과정 게시판</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>수강과정</th>
							</tr>
						</thead>

						<c:forEach items="${list}" var="Bbs">
							<tr>
								<td><a href="/ccProject/board/list/${Bbs.studyCode}"><c:out value="${Bbs.courseName}" /></a></td>
							</tr>
						</c:forEach>
					</table>

					<!-- 글쓰기 버튼 넣기 끝 -->
				</div>
			</div>
		</div>

	</div>
	<!-- /.container-fluid -->

</div>
<!-- 컨텐츠 끝 -->
