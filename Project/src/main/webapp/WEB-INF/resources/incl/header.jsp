<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sec:authentication var="principal" property="principal" />

<!-- navigation -->
<sec:authorize access="hasRole('ROLE_USER')">
	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<a class="navbar-brand" href="/study">
			<img src="<c:url value='/image/logo.png' />" />
		</a>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<a class="nav-link" href="/study/board/boardList">스터디 찾기 </a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/study/studyList">스터디 시작 </a>
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
</sec:authorize>

<!-- navigation -->
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<a class="navbar-brand" href="/study">
		<img src='<c:url value='/image/logo.png' />' />
		</a>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<a class="nav-link" href="/study/member/memberList">회원목록 </a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/study/studyList_Admin">스터디 목록</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/study/board/boardList">스터디 찾기</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/study/studyList">스터디 시작 </a>
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
</sec:authorize>

<!-- navigation -->
<sec:authorize access="isAnonymous()">
	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<div class="container">
			<a class="navbar-brand" href="/study">
			<img src='<c:url value='/image/logo.png' />' />
			</a>
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

<!-- header -->
<div class="jumbotron bg-secondary">
	<div class="container-fluid p-5 text-center">
		<h1 class="text-white">Study With Me</h1>
	</div>
</div>

