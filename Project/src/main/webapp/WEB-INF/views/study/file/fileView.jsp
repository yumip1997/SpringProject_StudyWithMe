<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<jsp:include page="/WEB-INF/resources/incl/staticHeader.jsp" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

	<!-- file detail -->
	<div class="container container-fluid p-5">
		<div class="container text-center pt-2">
			<h2>${file.fileTitle}</h2>
		</div>

		<sec:authentication var="principal" property="principal" />
		<form id="target" method="post" class="p-4">
			<table class="table table-hover">
				<tr>
					<th>자료 제목</th>
					<td>${file.fileTitle}</td>
				</tr>

				<tr>
					<th>자료 설명</th>
					<td>${file.fileContent}</td>
				</tr>

				<tr>
					<th>작성자</th>
					<td>${file.userId}</td>
				</tr>

				<tr>
					<th>자료 다운로드</th>
					<td><a href="/study/file/download/${file.fileNum}">${file.fileTitle}(
							<c:choose>
								<c:when test="${file.fileSize ge 1048576}">
									<fmt:formatNumber value="${file.fileSize/1048576}" pattern=".00" />MB
									</c:when>
								<c:otherwise>
									<fmt:formatNumber value="${file.fileSize/1024}" pattern="0.00" />KB
									</c:otherwise>
							</c:choose>)
					</a></td>
				</tr>

			</table>
			<c:if test="${file.userId eq principal}">
				<input type="hidden" value="${file.fileNum}" name="fileNum">
				<input type="hidden" value="${file.boardNum}" name="boardNum">
				<input type="submit" value="수정하기" class="btn btn-light m-1" id="upadte">
				<input type="submit" value="삭제하기" class="btn btn-light m-1" id="delete">
			</c:if>
		</form>
		<button class="btn btn-outline-secondary pull-right" id="viewList">목록보기</button>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/resources/incl/footer.jsp" />
	<script>
		$("#update").on("click", function() {
			$("#target").attr("action", "updateFilePage");
		});

		$("#delete").on("click", function() {
			if (confirm("정말로 삭제하시겠습니까?") == true) {
				$("#target").attr("action", "deleteFile");
				return true;
			} else {
				return false;
			}
		});
		
		$("#viewList").on("click", function(){
			location.href ="/study/file/fileList/${file.boardNum}";
		});
		
	</script>
</body>
</html>