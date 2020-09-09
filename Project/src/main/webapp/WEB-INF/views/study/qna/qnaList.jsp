<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
<h2>${studyTitle} 질의응답 게시판</h2>
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
<button class="btn btn-default pull-right" id="insert">질문 올리기</button>
</div>

<script>
$("#insert").on("click", function(){
	var boardNum = ${boardNum};
	location.href="/study/qna/insertQnA/"+boardNum;
})
</script>
</body>
</html>