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
<title>Insert title here</title>
</head>
<body>
	<!-- menu -->
	<jsp:include page="/WEB-INF/resources/incl/header.jsp" />
	<form:form action="/study/board/updateBoard" method="post"
		modelAttribute="board">
		<table border="1">
			<tr>
				<th>제목</th>
				<td><form:input path="boardTitle" value="${board.boardTitle}" />
					<form:errors path="boardTitle" /></td>
			</tr>

			<tr>
				<th>내용</th>
				<td><form:input path="boardContent" type="textarea" rows="10"
						cols="20" value="${board.boardContent}" /> <form:errors
						path="boardContent" /></td>
			</tr>
			<tr>
				<th>스터디 이름</th>
				<td><form:input path="studyTitle" value="${board.studyTitle}" />
					<form:errors path="studyTitle" /></td>
			</tr>
			<tr>
				<th>스터디 타입</th>
				<td><form:select path="studyType" value="${board.studyType}">
						<form:option value="어학" />
						<form:option value="공무원/고시" />
						<form:option value="취업" />
						<form:option value="기타" />
					</form:select> <form:errors path="studyType" /></td>
			</tr>
		</table>

		<input type="hidden"  name="userId" value="${board.userId}">
		<input type="hidden" name="boardNum" value="${board.boardNum}">

		<input type="submit" value="수정하기">
		<input type="reset" value="초기화하기">
		<input type="button" value="취소하기"
			onclick="location.href='/study/board/${board.boardNum}'">
	</form:form>
</body>
</html>