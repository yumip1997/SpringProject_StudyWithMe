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
<div class="jumbotron text-center jumbotron-fluid">
<h1>Study With Me</h1>
</div>

<!-- About us -->
<div class="container text-center">
<p class="h3">ABOUT US</p>
<P>웹 상에서 스터디에 참여하고, <br>직접 만들어 보세요!</P>
</div>

<!-- Category -->
<div class="container text-center">
<p class="h3">Categories</p>
<div class="row">
<div class="col-md-12">
<ul class="list-inline">
<li class="list-inline-item"><i class="fa fa-star-o fa-2x"></i><h5>어학</h5></li>
<li class="list-inline-item"><i class="fa fa-star-o fa-2x"></i><h5>공무원</h5></li>
<li class="list-inline-item"><i class="fa fa-star-o fa-2x"></i><h5>고시</h5></li>
<li class="list-inline-item"><i class="fa fa-star-o fa-2x"></i><h5>취업</h5></li>
<li class="list-inline-item"><i class="fa fa-star-o fa-2x"></i><h5>기타</h5></li>
</ul>
</div>
</div>
</div>

<!-- Introduction -->
<div class="container text-center">

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


<!-- footer -->
<div class="jumbotron text-center mt-5 mb-0">
<h3 class="text-secondary">Study With Me</h3>
</div>



</body>
</html>