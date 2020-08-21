<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<h2>스터디 생성</h2>
		<form:form action="insertBoard" method="post" modelAttribute="board">
			<table class="table table-striped">
				<tr>
					<th>제목</th>
					<td><form:input path="boardTitle" /> 
					<form:errors path="boardTitle" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><form:input path="boardContent" type="textarea" rows="10" cols="20" /> 
					<form:errors path="boardContent" /></td>
				</tr>
				<tr>
					<th>스터디 이름</th>
					<td><form:input path="studyTitle" /> 
					<form:errors path="studyTitle" /></td>
				</tr>
				<tr>
					<th>스터디 타입</th>
					<td><form:select path="studyType">
							<form:option value="어학">어학</form:option>
							<form:option value="공무원">공무원</form:option>
							<form:option value="고시">고시</form:option>
							<form:option value="취업">취업</form:option>
							<form:option value="기타">기타</form:option>
						</form:select> <form:errors path="studyType" /></td>
				</tr>
			</table>
			<input type="submit" value="등록하기" class="btn">
			<input type="reset" value="초기화하기">
			<input type="button" value="목록보기"
				onclick="location.href='/study/board/boardList'">
		</form:form>
	</div>
</body>
</html>