<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="stylesheet" href="/study/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>

<sec:authentication var="principal" property="principal" />
<nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4">
  <a class="navbar-brand" href="/study"><span>Home</span></a>
  <div class="collapse navbar-collapse" id="navbarCollapse">
    <ul class="navbar-nav mr-auto">
    <sec:authorize access="hasRole('ROLE_ADMIN')">
      <li class="nav-item">
        <a class="nav-link active" href="/study/member/memberList">회원목록 </a>
      </li>
      </sec:authorize>
      <li class="nav-item">
        <a class="nav-link" href="/study/board/boardList">스터디 찾기</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="/study/studyList">스터디 시작</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="/study/member/${principal}">마이페이지</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="/study/logout">로그아웃</a>
      </li>
    </ul>
  </div>
</nav>

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
</body>
</html>