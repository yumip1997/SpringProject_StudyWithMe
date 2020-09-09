<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<jsp:include page="/WEB-INF/resources/incl/staticHeader.jsp" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	
	<!-- Study List -->
	<div class="container py-5">
		<h2>My Study</h2>
		<div class="container py-4">
		<table class="table table-hover" id="list">
			<tr>
				<th>스터디 이름</th>
				<th>스터디 타입</th>
				<th>스터디 창시자</th>
				<th>스터디 생성일</th>
				<th></th>
			</tr>
			<c:forEach var="study" items="${studies}">
				<tr>
					<td>${study.studyTitle}</td>
					<td>${study.studyType}</td>
					<td>${study.creator}</td>
					<td>${study.writedate}</td>
					<td><button id="enter"
							onclick="location.href='/study/studyView/'+${study.boardNum}">스터디
							입장</button></td>
				</tr>
			</c:forEach>
		</table>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/resources/incl/footer.jsp" />
</body>
</html>