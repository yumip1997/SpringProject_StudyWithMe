<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<jsp:include page="/WEB-INF/resources/incl/staticHeader.jsp" />
<title>Study With Me</title>
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

	<!-- insert qna -->
	<div class="container container-fluid pt-5">
		<div class="container text-center mb-2">
			<h2>질의응답</h2>
		</div>
		
		<form:form action="/study/qna/insertQnA" method="post" modelAttribute="qna" class="form-group">
			<div class="form-group">
				<label>질문 제목 : </label>
				<form:input path="qnaTitle" class="form-control" />
				<form:errors path="qnaTitle" />
			</div>
			
			<div class="form-group">
				<label>질문 내용 : </label>
				<form:input path="qnaContent" type="textarea" rows="5" class="form-control"/>
				<form:errors path="qnaContent" />
			</div>

			<div class="container">
				<div class="row justify-content-end">
					<input type="hidden" value="${qna.boardNum}" name="boardNum">
					<input type="submit" value="등록하기" class="btn btn-outline-secondary m-1"> 
					<input type="reset" value="초기화하기" class="btn btn-outline-secondary m-1"> 
					<input type="button" value="목록보기" class="btn btn-outline-secondary m-1"
					onclick="location.href='/study/qna/qnaList/'+${qna.boardNum}">
				</div>
			</div>
		</form:form>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/resources/incl/footer.jsp" />
</body>
</html>