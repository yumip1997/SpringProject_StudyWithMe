<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="stylesheet" href="/study/css/bootstrap.min.css">
<title>Spring Board</title>
</head>
<body>
<!-- navigation -->
<sec:authorize access="hasRole('ROLE_USER')">
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
  <a class="navbar-brand" href="/study"><span>Home</span></a>
  <div class="collapse navbar-collapse" id="navbarCollapse">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="/study/board/boardList">스터디 찾기 </a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="/study/studyList">스터디 시작 </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/study/member/${userId}">마이페이지</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="/study/logout">로그아웃</a>
      </li>
    </ul>
  </div>
</nav>
</sec:authorize>
<!-- navigation -->
<sec:authorize access="hasRole('ROLE_ADMIN')">
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
  <a class="navbar-brand" href="/study"><span>Home</span></a>
  <div class="collapse navbar-collapse" id="navbarCollapse">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="/study/member/memberList">회원목록 </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/study/board/boardList">스터디 찾기</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="/study/studyList">스터디 시작 </a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="/study/member/${userId}">마이페이지</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="/study/logout">로그아웃</a>
      </li>
    </ul>
  </div>
</nav>
</sec:authorize>
<!-- navigation -->
<sec:authorize access="isAnonymous()">
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
</sec:authorize>

<div class="jumbotron jumbotron-fluid">
<div class="container">
<h1>Study With Me</h1>
<h1>CRUD+BOARD</h1>
</div>
</div>

</body>
</html>