<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<jsp:include page="/WEB-INF/resources/incl/staticHeader.jsp" />
<title>Study With Me</title>
</head>
<body>
	<!-- menu -->
	<jsp:include page="/WEB-INF/resources/incl/header.jsp" />

	<!-- update qna -->
	<div class="container container-fluid pt-5">
		<div class="container text-center mb-2">
			<h2>질의응답</h2>
		</div>

		<form:form action="updateQnA" method="post" modelAttribute="qna"
			class="form-gruop">
			<div class="form-group">
				<label>질문 제목 : </label>
				<form:input path="qnaTitle" class="form-control" />
				<form:errors path="qnaTitle" />
			</div>

			<div class="form-group">
				<label>질문 내용 : </label>
				<form:textarea path="qnaContent" type="textarea" rows="5" class="form-control"></form:textarea>
				<form:errors path="qnaContent" />
			</div>

			<div class="container">
				<div class="row justify-content-end">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<input type="hidden" name="boardNum" value="${qna.boardNum}">
					<input type="hidden" name="qnaNum" value="${qna.qnaNum}"> <input
						type="submit" value="수정하기" class="btn btn-outline-secondary m-1">
				</div>
			</div>
		</form:form>
	</div>
	
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/resources/incl/footer.jsp" />
	
</body>
</html>