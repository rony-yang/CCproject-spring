<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 메인 컨텐츠 -->

<div id="content">
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<!-- <h1 class="h3 mb-2 text-gray-800">게시판</h1>
		<p class="mb-4">
			
			
			<a target="_blank" href="/board/list">공지사항 게시판으로 가기</a>. 
			</br> 
			<a target="_blank" href="/board/list_study">수강과정 게시판으로 가기</a>.
		</p> -->

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">개인 게시판</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>

						<c:forEach items="${list}" var="Bbs">
							<tr>
								<td>
									<a href='/ccProject/board/get?bbsID=<c:out value="${Bbs.bbsID}"/>'> 
										<c:out value="${Bbs.bbsTitle }" />
									</a>
								</td>

								<td><c:out value="${Bbs.userId}" /></td>

								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${Bbs.bbsDate}" /></td>


							</tr>
						</c:forEach>
					</table>

					<!-- 글쓰기 버튼 넣기 -->
					<div class="modal-footer">
						<button type="button" onclick="location.href='/ccProject/board/register'"
							class="btn btn-info">글쓰기</button>
					</div>
					<!-- 글쓰기 버튼 넣기 끝 -->
				</div>
			</div>
		</div>

	</div>
	<!-- /.container-fluid -->

</div>
<!-- 컨텐츠 끝 -->
