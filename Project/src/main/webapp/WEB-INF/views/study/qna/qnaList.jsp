<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<jsp:include page="/WEB-INF/resources/incl/staticHeader.jsp" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Study With Me</title>
</head>
<body>
	<!-- menu -->
	<jsp:include page="/WEB-INF/resources/incl/header.jsp" />

	<!-- qna list -->
	<div class="container container-fluid mt-5">
		<div class="container text-center">
			<h2>${studyTitle} 스터디 질의응답 게시판</h2>
		</div>

		<!-- search section -->
		<div class="container">
			<form method="post" action="/study/qna/search">
				<div class="form-row">
					<div class="form-group col-md-3">
						<select name="searchOption" class="form-control">
							<option value="all">질문 제목 + 상세내용</option>
							<option value="qna_title">질문 제목</option>
							<option value="qna_content">상세내용</option>
						</select>
					</div>
					<div class="form-group col-md-8" class="form-control">
						<input type="text" name="keyword" type="search" class="form-control">
					</div>
					<div class="form-group col-md-1">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<input type="hidden" value="${boardNum}" name="boardNum">
						<input type="submit" value="검색" class="btn btn-secondary">
					</div>
				</div>
			</form>

			<div class="row">
				<c:if test="${not empty count}">
				<div class="col-md-10"><h6>${count}개의 질의응답이 존재합니다.</h6></div>
				<div class="col-md-2"><h6><a href="/study/qna/qnaList/${boardNum}">질문 전체보기</a></h6></div>
			</c:if>
			</div>
		</div>

		<div class="container pt-2">
			<table class="table table-hover">
				<tr>
					<th>질문 제목</th>
					<th>질문자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>

				<c:forEach var="qna" items="${qnaList}">
					<tr>
						<td><a href="/study/qna/${qna.qnaNum}">${qna.qnaTitle}</a></td>
						<td>${qna.userId}</td>
						<td>${qna.writedate}</td>
						<td>${qna.views}</td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<div class="container">
			<div class="row justify-content-end">
				<button class="btn btn-outline-secondary mx-1" id="insert">질문올리기</button>
				<button class="btn btn-outline-secondary" id="viewList">목록보기</button>
			</div>
		</div>
	</div>
	
	<!-- pagination -->
	<c:if test="${empty count}">
	<div class="container mt-3">
		<div class="row">
				<ul class="pagination">
					<li class="page-item">
					<a class="page-link" href="/study/qna/qnaList/${boardNum}?page=1">처음</a></li>
					<c:if test="${pageMaker.nowBlock gt 1}">
						<li class="page-item">
						<a class="page-link" href="/study/qna/qnaList/${boardNum}?page=${pageMaker.startPage-1}">이전</a>
					</c:if>
					<c:forEach var="i" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="page-item">
						<a class="page-link" href="/study/qna/qnaList/${boardNum}?page=${i}">${i}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.nowBlock < pageMaker.totalBlock}">
						<li class="page-item">
						<a class="page-link" href="/study/qna/qnaList/${boardNum}?page=${pageMaker.endPage+1}">다음</a></li>
					</c:if>
				</ul>
		</div>
	</div>
	</c:if>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/resources/incl/footer.jsp" />

</body>
	<script>
		$("#insert").on("click", function() {
			location.href = "/study/qna/insertQnA/" + ${boardNum};
		})

		$("#viewList").on("click", function() {
			location.href = "/study/studyView/" + ${boardNum};
		})
	</script>

</html>