<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<jsp:include page="/WEB-INF/resources/incl/staticHeader.jsp" />
<title>Study With Me</title>
</head>
<body>
	<!-- menu -->
	<jsp:include page="/WEB-INF/resources/incl/header.jsp" />
	<div class="container">
		<h2>질의응답</h2>
		<form:form action="/study/qna/updateQnA" method="post" modelAttribute="qna">
			<table class="table table-striped">
				<tr>
					<th>질문 제목</th>
					<td><form:input path="qnaTitle" />
						<form:errors path="qnaTitle" /></td>
				</tr>
				<tr>
					<th>질문 내용</th>
					<td><form:input path="qnaContent" type="textarea" />
						<form:errors path="qnaContent" /></td>
				</tr>
			</table>
			<input type="hidden" name="boardNum" value="${qna.boardNum}">
			<input type="hidden" name="qnaNum" value="${qna.qnaNum}">
			<input type="submit" value="수정하기">
			</form:form>
			</div>
</body>
</html>