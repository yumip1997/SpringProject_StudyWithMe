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
<sec:authentication var="principal" property="principal" />
<form id="target" method="post">
<table class="table table-hover">
<tr>
<th>질문제목</th>
<td>${qna.qnaTitle}</td>
</tr>

<tr>
<th>질문내용</th>
<td>${qna.qnaContent}</td>
</tr>

<tr>
<th>질문자</th>
<td>${qna.userId}</td>
</tr>
<tr>

<th>작성일</th>
<td>${qna.writedate}</td>
</tr>
</table>
<c:if test="${qna.userId eq principal}">
<input type="hidden" value="${qna.qnaNum}" name="qnaNum">
<input type="hidden" value="${qna.boardNum}" name="boardNum">
<input type="submit" value="수정하기" id="update">
<input type="submit" value="삭제하기" id="delete">
</c:if>
</form>
</div>

<script>
$("#update").on("click", function(){
	$("#target").attr("action", "updateQnAPage")
});

$("#delete").on("click", function(){
	if(confirm("정말로 삭제하시겠습니까?") == true){
		$("#target").attr("action", "deleteQnA");
		return true;
	}else{
		return false;
	}
});
</script>
</body>
</html>