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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<!-- menu -->
	<jsp:include page="/WEB-INF/resources/incl/header.jsp" />

	<!-- header -->
	<div class="jumbotron bg-secondary">
		<div class="container-fluid p-1 text-center">
			<h1 class="text-white">Study With Me</h1>
		</div>
	</div>

	<!-- upload file -->
	<div class="container container-fluid pt-5">
		<div class="container text-center mb-2">
			<h2>파일 업로드</h2>
		</div>

		<form:form action="/study/file/insertFile" method="post"
			modelAttribute="file" enctype="multipart/form-data"
			accept-charset="UTF-8" class="form-group">

			<div class="form-group">
				<label>자료 제목 : </label>
				<form:input path="fileTitle" class="form-control" />
				<form:errors path="fileTitle" />
			</div>

			<div class="form-group">
				<label>자료 설명 : </label>
				<form:input path="fileContent" type="textarea" area="5" class="form-control" />
				<form:errors path="fileContent" />
			</div>

			<div class="form-group">
				<label>파일 업로드 </label> 
				<input name="uploadfile" type="file" id="uploadfile" data-icon-name="fa fa-upload"/>
			</div>

			<div class="container">
				<div class="row justify-content-end">
					<input type="hidden" value="${boardNum}" name="boardNum"> 
					<input type="submit" value="등록하기" class="btn btn-outline-secondary m-1">
					<input type="reset" value="초기화하기" class="btn btn-outline-secondary m-1"> 
					<input type="button" value="목록보기" class="btn btn-outline-secondary m-1"
					onclick="location.href='/study/file/fileList/'+${boardNum}">
				</div>
			</div>
		</form:form>
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/resources/incl/footer.jsp" />

	<script>
		$("#submit").on("click", function() {
			if ($("#uploadfile").val() == "") {
				alert('파일을 첨부하세요');
			}
		});
	</script>
</body>
</html>