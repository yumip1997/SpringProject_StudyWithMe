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
<link rel="stylesheet" href="/study/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/resources/incl/header.jsp" />

<div class="jumbotron jumbotron-fluid">
<div class="container">
<h1>Study With Me</h1>
</div>
</div>

<!-- Login form-->
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<form action="loginCheck" method="post">
					<div class="text-center">로그인</div>
						<div class="form-group">
							<label class="control-label">아이디</label> 
							<input class="form-control" type="text" name="id">
						</div>
						<div class="form-group">
							<label class="control-label">비밀번호</label> 
							<input class="form-control" type="password" name="pw">
						</div>
						<div class="help-block">${message}
							<%
								session.removeAttribute("message");
							%>
						</div>
						<input class="btn btn-secondary" type="submit" value="로그인">
					</form>
				</div>

			</div>
		</div>

</body>
</html>