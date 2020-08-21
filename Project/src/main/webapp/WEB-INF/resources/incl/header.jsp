<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

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
        <a class="nav-link" href="/study/member/${principal}">마이페이지</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="/study/logout">로그아웃</a>
      </li>
    </ul>
  </div>
</nav>