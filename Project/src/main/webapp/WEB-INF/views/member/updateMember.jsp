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

	<!-- update form -->
	<div class="container container-fluid p-5">
		<div class="container text-center">
			<h2>회원정보 수정</h2>
		</div>
		<sec:authentication var="principal" property="principal" />
		<div class="container">
		<c:choose>
			<c:when test="${member.userId eq principal}">
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
					
					<div class="container">
					<div class="d-flex justify-content-end">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<input type="hidden" name="userId" value="${member.userId}">
						<input type="submit" value="수정" class="btn btn-outline-secondary m-1"> 
						<input type="reset" value="초기화" class="btn btn-outline-secondary m-1">
						<input type="button" value="취소" class="btn btn-outline-secondary m-1"
							onclick="location.href='/study/member/${member.userId}'">
					</div>
					</div>
				</form:form>
				
			</c:when>

			<c:otherwise>
				<form action="/study/member/updateAccount" method="post"
				class="form-group">
					<table class="table table-striped">
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
							<td>
							<select name="enabled" class="form-control"> 
							<option value='1'>활성화</option>
							<option value='0'>비활성화</option>
							</select>
							</td>
						</tr>

						<tr>
							<th>권한 변경</th>
							<td>
							<select name="authority" class="form-control">
							<option value="ROLE_USER">회원</option>
							<option value="ROLE_ADMIN">관리자</option>
							</select>
						</tr>
					</table>
					
					<div class="container">
					<div class="d-flex justify-content-end">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<input type="hidden" name="userId" value="${member.userId}">
					<input type="submit" value="수정" class="btn btn-outline-secondary m-1"> 
					<input type="button" value="취소" class="btn btn-outline-secondary m-1"
					onclick="location.href='/study/member/${member.userId}'">
					</div>
					</div>
				</form>
			
			</c:otherwise>
		</c:choose>
	</div>
</div>
	<!-- footer -->
	<jsp:include page="/WEB-INF/resources/incl/footer.jsp" />
</body>
</html>