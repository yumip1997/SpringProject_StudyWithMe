<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<jsp:include page="/WEB-INF/resources/incl/staticHeader.jsp" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Study With Me</title>
</head>
<body>
	<!-- menu -->
	<jsp:include page="/WEB-INF/resources/incl/header.jsp" />
	
	<!-- Study List -->
	<div class="container py-5">
		<h2>전체 스터디 목록</h2>
		<div class="container py-4">
		<table class="table table-hover" id="list">
			<tr>
				<th>스터디 이름</th>
				<th>스터디 타입</th>
				<th>스터디 창시자</th>
				<th>스터디 생성일</th>
				<th>스터디 모집글 제목</th>
				<th></th>
				<th></th>
			</tr>

			<c:forEach var="board" items="${studies}">
				<tr>
					<td>${board.studyTitle}</td>
					<td>${board.studyType}</td>
					<td>${board.userId}</td>
					<td>${board.writedate}</td>
					<td><a href="/study/board/${board.boardNum}">${board.boardTitle}</a></td>
					<td><button class="btn btn-light"
					onclick="location.href='/study/studyView/'+${board.boardNum}"> 스터디 입장</button>
					</td>
					<td><button class="btn btn-light"
					onclick="location.href='/study/deleteStudy?boardNum=${board.boardNum}'">강제 삭제</button>
					</td>
				</tr>
			</c:forEach>
		</table>
		</div>
	</div>
	
	<!-- pagination -->
	<!-- 검색 시에는 출력되지 않음 -->
	<div class="container mt-3">
		<div class="row">
				<ul class="pagination">
					<li class="page-item">
					<a class="page-link" href="/study/studyList_Admin?page=1">처음</a></li>
					<c:if test="${pageMaker.nowBlock gt 1}">
						<li class="page-item">
						<a class="page-link" href="/study/studyList_Admin?page=${pageMaker.startPage-1}">이전</a>
					</c:if>
					<c:forEach var="i" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="page-item">
						<a class="page-link" href="/study/studyList_Admin?page=${i}">${i}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.nowBlock < pageMaker.totalBlock}">
						<li class="page-item">
						<a class="page-link" href="/study/studyList_Admin?page=${pageMaker.endPage+1}">다음</a></li>
					</c:if>
				</ul>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/resources/incl/footer.jsp" />
</body>
</html>