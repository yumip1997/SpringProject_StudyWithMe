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
				<button class="btn btn-outline-secondary" id="total">전체보기</button>
			</div>
			<div class="col-sm-2">
				<button class="btn btn-outline-secondary" id="language">어학</button>
			</div>
			<div class="col-sm-2">
				<button class="btn btn-outline-secondary" id="gongshi">공무원</button>
			</div>
			<div class="col-sm-2">
				<button class="btn btn-outline-secondary" id="goshi">고시</button>
			</div>
			<div class="col-sm-2">
				<button class="btn btn-outline-secondary" id="job">취업</button>
			</div>
			<div class="col-sm-2">
				<button class="btn btn-outline-secondary" id="etc">기타</button>
			</div>
		</div>
	</div>

	<!-- search section -->
	<div class="container pt-2">
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
					<input type="text" name="keyword" type="search"
						class="form-control">
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
						<th colspan="6">${studyType} Top3스터디(QnA,File업로드수 기준)</th>
					</tr>
					<tr>
						<th>순위</th>
						<th>스터디 이름</th>
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
		<button class="btn btn-default pull-left" id="insert">스터디 생성</button>
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

	<!-- footer -->
	<jsp:include page="/WEB-INF/resources/incl/footer.jsp" />
</body>

<script>
	$("#language").on("click", function() {
		location.href = "/study/board/boardList/어학";
	});

	$("#gongshi").on("click", function() {
		location.href = "/study/board/boardList/공무원";
	});

	$("#goshi").on("click", function() {
		location.href = "/study/board/boardList/고시";
	});

	$("#job").on("click", function() {
		location.href = "/study/board/boardList/취업";
	});

	$("#etc").on("click", function() {
		location.href = "/study/board/boardList/기타";
	});

	$("#total").on("click", function() {
		location.href = "/study/board/boardList";
	});

	$("#insert").on("click", function() {
		location.href = "/study/board/insertBoard";
	});
</script>
</html>