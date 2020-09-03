<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<jsp:include page="/WEB-INF/resources/incl/staticHeader.jsp" />
<title>Insert title here</title>
</head>
<body>
<!-- menu -->
<jsp:include page="/WEB-INF/resources/incl/header.jsp" />
<div class="container">
<h2>회원정보입력</h2>
	<form:form action="insertMember" method="post" modelAttribute="member">
		<table class="table table-striped">
			<tr>
				<td>아이디</td>
				<td><form:input path="userId" placeholder="4~20자의 영문대소문자와 숫자"
						onfocus="this.placeholder=''" /> 
						<form:errors path="userId" /></td>
			</tr>

			<tr>
				<td>이름</td>
				<td><form:input path="name" placeholder="한글만 가능"
						onfocus="this.placeholder=''" /> 
						<form:errors path="name" /></td>
			</tr>

			<tr>
				<td>비밀번호</td>
				<td><form:input type="password" path="password"
						placeholder="6~12자의 영문대소문자와 숫자" onfocus="this.placeholder=''" /> 
						<form:errors
						path="password" /></td>
			</tr>

			<tr>
				<td>이메일</td>
				<td><form:input path="email" placeholder="abcd@google.com"
						onfocus="this.placeholder=''" /> 
						<form:errors path="email" /></td>
			</tr>
		</table>
		<input type="submit" value="가입" class="btn">
		<input type="reset" value="초기화">
		<button type="button" onclick="location.href='../index'">가입취소</button>
	</form:form>
</div>
	
</body>
</html>