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
<!-- navigation -->
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
<div class="container">
 <a class="navbar-brand" href="/study">Home</a>
<div class="collapse navbar-collapse" id="navbarCollapse">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link py-3 px-0 px-lg-3" href="/study/login">시작하기</a>
      </li>
      <li class="nav-item">
        <a class="nav-link py-3 px-0 px-lg-3" href="/study/member/insertMember">가입하기</a>
      </li>
    </ul>
  </div>
</div>
</nav>

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