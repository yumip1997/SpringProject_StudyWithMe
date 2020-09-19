<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<jsp:include page="/WEB-INF/resources/incl/staticHeader.jsp" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<!-- menu -->
	<jsp:include page="/WEB-INF/resources/incl/header.jsp" />

	<!-- header -->
	<div class="jumbotron bg-secondary">
		<div class="container-fluid p-1 text-center">
			<h1 class="text-white">Study With Me</h1>
		</div>
	</div>


	<div class="container container-fluid mt-5">
		<div class="container">
			<h2>${studyTitle}자료실</h2>
		</div>
		
			<!-- search section -->
		<div class="container">
			<form method="post" action="/study/file/search">
				<div class="form-row">
					<div class="form-group col-md-3">
						<select name="searchOption" class="form-control">
							<option value="all">자료 제목 + 상세내용</option>
							<option value="file_title">자료 제목</option>
							<option value="file_content">상세내용</option>
						</select>
					</div>
					<div class="form-group col-md-8" class="form-control">
						<input type="text" name="keyword" type="search" class="form-control">
					</div>
					<div class="form-group col-md-1">
						<input type="hidden" value="${boardNum}" name="boardNum">
						<input type="submit" value="검색" class="btn btn-secondary">
					</div>
				</div>
			</form>

			<div class="row">
				<c:if test="${not empty count}">
				<div class="col-md-10"><h6>${count}개의 스터디가 존재합니다.</h6></div>
				<div class="col-md-2"><h6><a href="/study/file/fileList/${boardNum}">자료 전체보기</a></h6></div>
			</c:if>
			</div>
		</div>
		<div class="container pt-2">
		<table class="table table-hover">
			<tr>
				<th>자료</th>
				<th>작성자</th>
				<th>파일크기</th>
			</tr>

			<c:forEach var="file" items="${fileList}">
				<tr>
					<td><a href="/study/file/${file.fileNum}">${file.fileTitle}</a></td>
					<td>${file.userId}</td>
					<td><c:choose>
							<c:when test="${file.fileSize ge 1048576}">
								<fmt:formatNumber value="${file.fileSize/1048576}" pattern=".00" />MB
								</c:when>
							<c:otherwise>
								<fmt:formatNumber value="${file.fileSize/1024}" pattern="0.00" />KB
								</c:otherwise>
						</c:choose></td>
				</tr>
			</c:forEach>
		</table>
		</div>
		
		<div class="container">
		<div class="row justify-content-end">
		<button class="btn btn-outline-secondary mx-1" id="insert">파일올리기</button>
		<button class="btn btn-outline-secondary" id="viewList">목록보기</button>
		</div>
		</div>
		
	</div>
	<script>
	   
		$("#insert").on("click", function() {
			var boardNum = ${boardNum};
			location.href = "/study/file/insertFile/" + boardNum;
		});

		$("#viewList").on("click", function() {
			var boardNum = ${boardNum};
			location.href = "/study/studyView/" + ${boardNum};
		})
	</script>
</body>
</html>