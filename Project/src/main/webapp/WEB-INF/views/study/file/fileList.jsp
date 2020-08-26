<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="stylesheet" href="/study/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<!-- menu -->
<jsp:include page="/WEB-INF/resources/incl/header.jsp" />
<div class="container">
<h2>${studyTitle} 자료실</h2>
<table class="table table-hover">
<tr>
<th>자료</th>
<th>작성자</th>
<th>파일크기</th>
</tr>

<c:forEach var="file" items="${filelist}">
<tr>
<td><a href="/study/file/${file.fileNum}">${file.fileTitle}</a></td>
<td>${file.userId}</td>
<td>
<c:choose>
<c:when test="${file.fileSize ge 1048576}">
<fmt:formatNumber value="${file.fileSize/1048576}" pattern =".00"/>MB
</c:when>
<c:otherwise>
<fmt:formatNumber value="${file.fileSize/1024}" pattern ="0.00"/>KB
</c:otherwise>
</c:choose>
</td>
</tr>
</c:forEach>
</table>
<button class="btn btn-default pull-right" id="insert">파일올리기</button>
<button class="btn btn-default pull-right" id="study">스터디 목록</button>
</div>
<script>
$("#insert").on("click", function(){
	var boardNum = ${boardNum}
	location.href = "/study/file/insertFile/" + boardNum;
});

$("#study").on("click", function(){
	location.href = "/study/studyView/"+${boardNum};
})
</script>
</body>
</html>