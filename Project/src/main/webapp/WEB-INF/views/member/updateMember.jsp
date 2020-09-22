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

	<!-- update form -->
	<div class="container container-fluid p-5">
		<div class="container p-3 text-center">
			<h3>회원정보 수정</h3>
		</div>
		
		<div class="container">
		<c:choose>
			<c:when test="${principal eq memeber.userId}">
				<form:form action="updateMember" method="post"
					modelAttribute="member" class="form-group">
					<div class="form-group">
						<label>아이디 : ${member.userId}</label>
					</div>

					<div class="form-group">
						<label>이름 :</label>
						<form:input path="name" value="${member.name}"
							class="form-control" />
						<form:errors path="name" />
					</div>

					<div class="form-group">
						<label>이메일 : </label>
						<form:input path="email" value="${member.email}" 
						class="form-control"/>
						<form:errors path="email" />
					</div>
				</form:form>
				<div class="container">
					<div class="row-justify-content-end">
						<input type="hidden" name="userId" value="${member.userId}">
						<input type="submit" value="수정"
							class="btn btn-outline-secondary m-1"> <input
							type="reset" value="초기화" class="btn btn-outline-secondary m-1">
						<input type="button" value="취소"
							class="btn btn-outline-secondary m-1"
							onclick="location.href='/study/member/'+${member.userId}">
					</div>
				</div>
			</c:when>

			<c:otherwise>
				<form action="/study/member/updateAccount" method="post">
					<table border="1">
						<tr>
							<th>아이디</th>
							<td>${member.userId}</td>
						</tr>

						<tr>
							<th>이름</th>
							<td>${member.name}</td>
						</tr>

						<tr>
							<th>이메일</th>
							<td>${member.email}</td>
						</tr>

						<tr>
							<th>계정상태 변경</th>
							<td><input type="radio" name="enabled" value='1'
								checked="checked">활성화 <input type="radio" name="enabled"
								value='0'>비활성화</td>
						</tr>

						<tr>
							<th>권한 변경</th>
							<td><input type="radio" name="authority" value="ROLE_USER"
								checked="checked">회원 <input type="radio"
								name="authority" value="ROLE_ADMIN">관리자</td>
						</tr>
					</table>
					<input type="hidden" name="userId" value="${member.userId}">
					<input type="submit" value="수정"> <input type="button"
						value="취소"
						onclick="location.href='<c:url value="../${member.userId}" />'">
				</form>
			</c:otherwise>
		</c:choose>
	</div>
		</div>
	</div>
</html>