<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

<div class="container">
<h2>스터디 목록</h2>
<div class="row text-center">
<div class="col-sm-2"><button class="btn btn-outline-secondary" id="total">전체보기</button></div>
<div class="col-sm-2"><button class="btn btn-outline-secondary" id="language">어학</button></div>
<div class="col-sm-2"><button class="btn btn-outline-secondary" id="gongshi">공무원</button></div>
<div class="col-sm-2"><button class="btn btn-outline-secondary" id="goshi">고시</button></div>
<div class="col-sm-2"><button class="btn btn-outline-secondary" id="job">취업</button></div>
<div class="col-sm-2"><button class="btn btn-outline-secondary" id="etc">기타</button></div>
</div>
</div>

<div class="container">
<form method="post" action="/study/board/search">
<select name="searchOption">
<option value="all">글 제목 + 상세내용</option>
<option value="board_title">글 제목</option>
<option value="board_content">상세내용</option>
</select>
<input type="text" name="keyword">
<input type="hidden" name="studyType" value="${studyType}">
<input type="submit" value="검색">
</form>
<div class="row">
<c:if test="${not empty count}">
${count}개의 스터디가 존재합니다.
</c:if>
</div>
<table class="table table-hover" id="list">
<tr>
<th></th>
<th>스터디 모집 글 제목</th>
<th>스터디 타입</th>
<th>작성자</th>
<th>작성일</th>
<th>조회수</th>
<th>좋아요</th>
</tr>

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
<button class="btn btn-default pull-right" id="insert">스터디 생성</button>
</div>
</body>

<script>
$("#language").on("click", function(){
	location.href = "/study/board/boardList/어학";
});

$("#gongshi").on("click", function(){
	location.href = "/study/board/boardList/공무원";
});

$("#goshi").on("click", function(){
	location.href = "/study/board/boardList/고시";
});

$("#job").on("click", function(){
	location.href = "/study/board/boardList/취업";
});

$("#etc").on("click", function(){
	location.href = "/study/board/boardList/기타";
});

$("#total").on("click", function(){
	location.href = "/study/board/boardList";
});

$("#insert").on("click", function(){
	location.href="/study/board/insertBoard";
});


</script>
</html>