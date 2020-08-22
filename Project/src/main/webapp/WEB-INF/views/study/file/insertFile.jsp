<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="stylesheet" href="/study/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
	<!-- menu -->
	<jsp:include page="/WEB-INF/resources/incl/header.jsp" />
	<div class="container">
		<h2>파일 업로드</h2>
		<form:form action="/study/file/insertFile" method="post"
			modelAttribute="file" enctype="multipart/form-data">
			<input type="hidden" value="${boardNum}" name="boardNum">
			<table class="table table-striped">
				<tr>
					<th>파일 제목</th>
					<td><form:input path="fileTitle" />
						<form:errors path="fileTitle" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><form:input path="fileContent" type="textarea" />
						<form:errors path="fileContent" /></td>
				</tr>
			</table>
			<input type="file" name="file">
			<input type="submit" value="등록하기" class="btn">
			<input type="reset" value="초기화하기">
			<input type="button" value="목록보기"
				onclick="location.href='/study/file/fileList/'+${boardNum}">
		</form:form>
	</div>
</body>
</html>