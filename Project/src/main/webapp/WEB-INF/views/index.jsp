<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<jsp:include page="/WEB-INF/resources/incl/staticHeader.jsp" />
<title>Study With Me</title>
</head>
<body>
<jsp:include page="/WEB-INF/resources/incl/header.jsp" />

<!-- header -->
<div class="jumbotron bg-secondary">
<div class="container-fluid p-5 text-center">
<h1 class="text-white">Study With Me</h1>
</div>
</div>

<!-- About us -->
<div class="container-fluid p-5 text-center">
<h2>About us</h2>
<P>웹 상에서 스터디에 참여하고, <br>직접 만들어 보세요!</P>
</div>

<!-- Category -->
<div class="container-fluid p-5 bg-light text-center">
<h2>Categories</h2>
<div class="row">
<div class="col-md-12">
<ul class="list-inline m-4">
<li class="list-inline-item p-3"><i class="fa fa-star-o fa-2x"></i><h5>어학</h5></li>
<li class="list-inline-item p-3"><i class="fa fa-star-o fa-2x"></i><h5>공무원</h5></li>
<li class="list-inline-item p-3"><i class="fa fa-star-o fa-2x"></i><h5>고시</h5></li>
<li class="list-inline-item p-3"><i class="fa fa-star-o fa-2x"></i><h5>취업</h5></li>
<li class="list-inline-item p-3"><i class="fa fa-star-o fa-2x"></i><h5>기타</h5></li>
</ul>
</div>
</div>
</div>

<!-- Introduction -->
<div class="container text-center">
<div class="container-fluid p-5">
<div class="row align-items-center">
<div class="col-md-6"><p>원하는 스터디를 <br>직접 만들어 보세요!</p></div>
<div class="col-md-6"><img src="image/make.png"></div>
</div>

<div class="row align-items-center">
<div class="col-md-6"><img src="image/search.png"></div>
<div class="col-md-6"><p>목적에 맞는 스터디를 <br>카페고리 별로 찾아보세요!</p></div>
</div>

<div class="row align-items-center">
<div class="col-md-6"><p>질의응답, 자료실 서비스를 <br>이용하세요!</p></div>
<div class="col-md-6"><img src="image/study.png"></div>
</div>
</div>
</div>

<jsp:include page="/WEB-INF/resources/incl/footer.jsp" />
</body>
</html>