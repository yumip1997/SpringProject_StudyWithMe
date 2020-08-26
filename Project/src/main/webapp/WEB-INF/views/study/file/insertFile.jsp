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
<jsp:include page="/WEB-INF/resources/incl/staticHeader.jsp" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<!-- menu -->
	<jsp:include page="/WEB-INF/resources/incl/header.jsp" />
	<div class="container">
		<h2>파일 업로드</h2>
		<form:form action="/study/file/insertFile" method="post"
			modelAttribute="file" enctype="multipart/form-data"
			accept-charset="UTF-8">
			<input type="hidden" value="${boardNum}" name="boardNum">
			<table class="table table-striped">
				<tr>
					<th>파일 제목</th>
					<td><form:input path="fileTitle" /> <form:errors
							path="fileTitle" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><form:input path="fileContent" type="textarea" /> <form:errors
							path="fileContent" /></td>
				</tr>
				<tr>
				<td><input type="file" name="uploadfile" id="uploadfile">
				</td>
				</tr>
			</table>
			
			<input type="submit" value="등록하기" class="btn" id="submit">
			<input type="reset" value="초기화하기">
			<input type="button" value="목록보기"
				onclick="location.href='/study/file/fileList/'+${boardNum}">
		</form:form>
	</div>
	
	<script>
	$("#submit").on("click", function(){
		if($("#uploadfile").val() == ""){
			alert('파일을 첨부하세요');
		}
	});
	</script>
</body>
</html>