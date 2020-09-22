<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<jsp:include page="/WEB-INF/resources/incl/staticHeader.jsp" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Study With Me</title>
</head>
<body>
	<!-- menu -->
	<jsp:include page="/WEB-INF/resources/incl/header.jsp" />

	<!-- header -->
	<div class="jumbotron bg-secondary">
		<div class="container-fluid p-1 text-center">
			<h1 class="text-white">Study With Me</h1>
		</div>
	</div>

	<!-- study type -->
	<div class="container container-fluid pt-2">
		<div class="container p-3">
			<h2>스터디 목록</h2>
		</div>

		<div class="row text-center">
			<div class="col-sm-2">
				<label class="btn btn-outline-secondary"> 
				<input type="radio" name="studyType" value="all">전체보기
				</label>
			</div>
			<div class="col-sm-2">
				<label class="btn btn-outline-secondary"> <input
					type="radio" name="studyType" value="어학">어학
				</label>
			</div>
			<div class="col-sm-2">
				<label class="btn btn-outline-secondary"> 
				<input type="radio" name="studyType" value="공무원">공무원
				</label>
			</div>
			<div class="col-sm-2">
				<label class="btn btn-outline-secondary"> 
				<input type="radio" name="studyType" value="고시">고시
				</label>
			</div>
			<div class="col-sm-2">
				<label class="btn btn-outline-secondary"> 
				<input type="radio" name="studyType" value="취업">취업
				</label>
			</div>
			<div class="col-sm-2">
				<label class="btn btn-outline-secondary"> 
				<input type="radio" name="studyType" value="기타">기타
				</label>
			</div>
		</div>
	</div>

	<!-- search section -->
	<div class="container">
		<form method="post" action="/study/board/search">
			<div class="form-row">
				<div class="form-group col-md-3">
					<select name="searchOption" class="form-control">
						<option value="all">글 제목 + 상세내용</option>
						<option value="board_title">글 제목</option>
						<option value="board_content">상세내용</option>
					</select>
				</div>
				<div class="form-group col-md-8" class="form-control">
					<input type="text" name="keyword" type="search" class="form-control">
				</div>
				<div class="form-group col-md-1">
					<input type="hidden" name="studyType" value="${studyType}">
					<input type="submit" value="검색" class="btn btn-secondary">
				</div>
			</div>
		</form>

		<div class="row">
			<c:if test="${not empty count}">
			${count}개의 스터디가 존재합니다.
			</c:if>
		</div>
	</div>

	<!-- top3 study section -->
	<!-- 검색시에는 출력되지 않음 -->
	<c:if test="${empty count}">
		<div class="container pt-2">
			<table class="table table-hover text-center">
				<thead>
					<tr>
						<th colspan="6">${studyType}Top3스터디(QnA,File업로드수기준)</th>
					</tr>
					<tr>
						<th>순위</th>
						<th>스터디 이름</th>
						<th>스터디타입</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>질의응답 수</th>
						<th>자료 수</th>
					</tr>
				</thead>
				<c:forEach var="top3" varStatus="status" items="${Top3List}">
					<tr>
						<td>${status.count}</td>
						<td><a href="/study/board/${top3.boardNum}">${top3.studyTitle}</a></td>
						<td>${top3.studyType}</td>
						<td>${top3.userId}</td>
						<td>${top3.writedate}</td>
						<td>${top3.qnaTotal}</td>
						<td>${top3.fileTotal}</td>
					<tr>
				</c:forEach>

			</table>
		</div>
	</c:if>

	<!-- study list section -->
	<div class="container pt-2">
		<div class="row justify-content-start by-1">
			<button class="btn btn-outline-secondary mb-3" id="insert">스터디
				생성</button>
		</div>
		<div class="row">
			<table class="table table-hover" id="list">
				<thead>
					<tr>
						<th></th>
						<th>스터디 모집 글 제목</th>
						<th>스터디 타입</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>좋아요</th>
					</tr>
				</thead>
				<c:forEach var="board" items="${boardList}">
					<tr>
						<td>${board.enabled == '1'.charAt(0) ? '모집 중' : '모집 마감'}</td>
						<td><a href="/study/board/${board.boardNum}">${board.boardTitle}</a></td>
						<td>${board.studyType}</td>
						<td>${board.userId}</td>
						<td>${board.writedate}</td>
						<td>${board.views}</td>
						<td>${board.likes}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>

	<!-- pagination -->
	<div class="container mt-3">
		<div class="row">
				<ul class="pagination">
					<li class="page-item">
					<a class="page-link" href="/study/board/boardList/${studyType}?page=1">처음</a></li>
					<c:if test="${pageMaker.nowBlock gt 1}">
						<li class="page-item">
						<a class="page-link" href="/study/board/boardList/${studyType}?page=${pageMaker.startPage-1}">이전</a>
					</c:if>
					<c:forEach var="i" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="page-item">
						<a class="page-link" href="/study/board/boardList/${studyType}?page=${i}">${i}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.nowBlock < pageMaker.totalBlock}">
						<li class="page-item">
						<a class="page-link" href="/study/board/boardList/${studyType}?page=${pageMaker.endPage+1}">다음</a></li>
					</c:if>
				</ul>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/resources/incl/footer.jsp" />
</body>

<script>
	$("input:radio[name='studyType']").on("click", function() {
		var studyType = $(":radio[name='studyType']:checked").val();
		location.href = "/study/board/boardList/" + studyType;
	});

	$("#insert").on("click", function() {
		location.href = "/study/board/insertBoard";
	});
</script>
</html>