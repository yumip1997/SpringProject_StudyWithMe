<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<jsp:include page="/WEB-INF/resources/incl/staticHeader.jsp" />
<title>Study With Me</title>
</head>
<body>

	<!-- menu -->
	<jsp:include page="/WEB-INF/resources/incl/header.jsp" />

	<div class="container container-fluid pt-2">
		<div class="container p-3">
			<h2>회원 목록</h2>
		</div>
		<table class="table table-hover">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
			</tr>

			<c:forEach var="member" items="${memberList}">
				<tr>
					<td><a href="<c:url value="${member.userId}" />">${member.userId}</a></td>
					<td>${member.name}</td>
					<td>${member.email}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/resources/incl/footer.jsp" />
</body>
</html>