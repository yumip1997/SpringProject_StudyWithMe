<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/WEB-INF/resources/incl/staticHeader.jsp" />
<title>Study With Me</title>
</head>
<body>
	<!-- menu -->
	<jsp:include page="/WEB-INF/resources/incl/header.jsp" />

	<!-- signin form-->
	<div class="container container-fluid pt-5">
		<div class="container text-center">
			<h2>로그인</h2>
		</div>
		<div class="row justify-content-center">
		<div class="col-md-5">
				<form action="loginCheck" method="post">
					<div class="form-group">
						<label class="control-label">아이디</label> 
						<input class="form-control" type="text" name="id">
					</div>
					<div class="form-group">
						<label class="control-label">비밀번호</label> 
						<input class="form-control" type="password" name="pw">
					</div>
					<div class="form-group">${message}
						<%session.removeAttribute("message");%>
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<input class="btn btn-secondary" type="submit" value="로그인">
				</form>
		</div>
		</div>
	</div>


	<!-- footer -->
	<jsp:include page="/WEB-INF/resources/incl/footer.jsp" />
</body>
</html>