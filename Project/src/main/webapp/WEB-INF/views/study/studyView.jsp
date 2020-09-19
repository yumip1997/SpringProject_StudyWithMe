<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<jsp:include page="/WEB-INF/resources/incl/staticHeader.jsp" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Study With Me</title>
</head>
<body>
	<!-- menu -->
	<jsp:include page="/WEB-INF/resources/incl/header.jsp" />

	<!-- header -->
	<div class="jumbotron bg-secondary">
		<div class="container-fluid p-3 text-center">
			<h1 class="text-white">Study With Me</h1>
		</div>
	</div>

	<!-- QnA & File  -->
	<div class="container container-fluid mt-5">
		<div class="row text-center p-4">
			<div class="col-md-6">
			<h3 class="pb-3">질의응답</h3>
			<a href="/study/qna/qnaList/${study.boardNum}"><img src="/study/image/qna.png"></a>
			</div>
			<div class="col-md-6">
			<h3 class="pb-3">자료실</h3>	
			<a href="/study/file/fileList/${study.boardNum}"><img src="/study/image/download.png"></a>
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/resources/incl/footer.jsp" />
</body>
</html>