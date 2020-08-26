<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<jsp:include page="/WEB-INF/resources/incl/staticHeader.jsp" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<!-- menu -->
	<jsp:include page="/WEB-INF/resources/incl/header.jsp" />
	<div class="container">
	<sec:authentication var="principal" property="principal" />
	<form id="target" method="post">
	<table class="table table-hover">
	<tr>
	<th>자료 제목</th>
	<td>${file.fileTitle}</td>
	</tr>
	
	<tr>
	<th>자료 설명</th>
	<td>${file.fileContent}</td>
	</tr>
	
	<tr>
	<th>작성자</th>
	<td>${file.userId}</td>
	</tr>
	
	<tr>
	<th>자료 다운로드</th>
	<td>${file.fileData} (${file.fileSize})</td>
	</tr>
	
	</table>
	<c:if test="${file.userId eq principal}">
	<input type="hidden" value="${file.fileNum}" name="fileNum">
	<input type="hidden" value="${file.boardNum}" name="boardNum">
	<input type="submit" value="수정하기" id="upadte">
	<input type="submit" value="삭제하기" id="delete">
	</c:if>
	</form>
	</div>
	
	<script>
	
	</script>
</body>
</html>