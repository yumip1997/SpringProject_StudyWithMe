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
	<jsp:include page="/WEB-INF/resources/incl/header.jsp" />
	<!-- header -->
	<div class="jumbotron bg-secondary">
		<div class="container-fluid p-3 text-center">
			<h1 class="text-white">Study With Me</h1>
		</div>
	</div>
	
	<!-- signin form-->
	<div class="form-signin">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<form action="loginCheck" method="post">
						<h3>로그인</h3>
						<div class="form-group">
							<label class="control-label">아이디</label> 
							<input class="form-control" type="text" name="id">
						</div>
						<div class="form-group">
							<label class="control-label">비밀번호</label> 
							<input class="form-control" type="password" name="pw">
						</div>
						<div class="help-block">${message}
							<%session.removeAttribute("message");%>
						</div>
						<input class="btn btn-secondary" type="submit" value="로그인">
					</form>
				</div>

			</div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/resources/incl/footer.jsp" />
</body>
</html>