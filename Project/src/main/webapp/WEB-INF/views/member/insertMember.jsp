<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<jsp:include page="/WEB-INF/resources/incl/staticHeader.jsp" />
<title>Insert title here</title>
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
	
	<!-- singup form -->
	<div class="container container-fluid p-5">
		<div class="container p-3 text-center">
		<h3>회원정보입력</h3>
		</div>
		<div class="row justify-content-center">
			<div class="col-md-8 align-self-center">
				<form:form action="insertMember" method="post"
					modelAttribute="member" class="pb-4">
					<table class="table table-striped">
						<tr>
							<td>아이디</td>
							<td><form:input path="userId"
									placeholder="4~20자의 영문대소문자와 숫자" onfocus="this.placeholder=''"
									class="form-control" /> <form:errors path="userId" /></td>
						</tr>

						<tr>
							<td>이름</td>
							<td><form:input path="name" placeholder="한글만 가능"
									onfocus="this.placeholder=''" class="form-control" /> <form:errors
									path="name" /></td>
						</tr>

						<tr>
							<td>비밀번호</td>
							<td><form:input type="password" path="password"
									placeholder="6~12자의 영문대소문자와 숫자" onfocus="this.placeholder=''"
									class="form-control" /> <form:errors path="password" /></td>
						</tr>

						<tr>
							<td>이메일</td>
							<td><form:input path="email" placeholder="abcd@google.com"
									onfocus="this.placeholder=''" class="form-control" /> <form:errors
									path="email" /></td>
						</tr>
					</table>
					<input type="submit" value="가입">
					<input type="reset" value="초기화">
					<button type="button" onclick="location.href='../index'">가입취소</button>
				</form:form>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/resources/incl/footer.jsp" />
</body>
</html>