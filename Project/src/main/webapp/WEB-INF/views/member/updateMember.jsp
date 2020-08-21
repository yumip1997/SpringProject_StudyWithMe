<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
        <a class="nav-link" href="/study/member/memberList">회원목록 </a>
      </li>
      </sec:authorize>
      <li class="nav-item">
        <a class="nav-link" href="/study/board/boardList">스터디 찾기</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="/study/studyList">스터디 시작</a>
      </li>
       <li class="nav-item">
        <a class="nav-link active" href="/study/member/${principal}">마이페이지</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="/study/logout">로그아웃</a>
      </li>
    </ul>
  </div>
</nav>

<c:choose>
<c:when test="${principal eq member.userId}">
<form:form action="/study/member/updateMember" method="post" modelAttribute="member">
<table class="table table-striped">
<tr>
<th>아이디</th>
<td>${member.userId}</td>
</tr>

<tr>
<th>이름</th>
<td><form:input path="name" value="${member.name}" />
<form:errors path="name" /></td>
</tr>

<tr>
<th>이메일</th>
<td><form:input path="email" value="${member.email}" />
<form:errors path="email" /></td>
</tr>

</table>
<input type="hidden" name="userId" value="${member.userId}">
<input type="submit" value="수정">
<input type="reset" value="초기화">
<input type="button" value="취소" onclick="location.href='<c:url value="../${member.userId}" />'">
</form:form>
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
<td><input type="radio" name="enabled" value='1' checked="checked">활성화
<input type="radio" name="enabled" value='0'>비활성화
</td>
</tr>

<tr>
<th>권한 변경</th>
<td>
<input type="radio" name="authority" value="ROLE_USER" checked="checked">회원
<input type="radio" name="authority" value="ROLE_ADMIN">관리자
</td>
</tr>
</table>
<input type="hidden" name="userId" value="${member.userId}">
<input type="submit" value="수정">
<input type="button" value="취소" onclick="location.href='<c:url value="../${member.userId}" />'">
</form>
</c:otherwise>
</c:choose>

</html>