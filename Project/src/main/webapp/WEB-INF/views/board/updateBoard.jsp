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

	<!-- create Study -->
	<div class="container container-fluid pt-5">
		<div class="container text-center mb-2">
			<h2>스터디 생성</h2>
		</div>
		<form:form action="updateBoard" method="post" modelAttribute="board"
			class="form-gruop">
			<div class="form-group">
				<label>제목 : </label>
				<form:input path="boardTitle" class="form-control" />
				<form:errors path="boardTitle" />
			</div>

			<div class="form-group">
				<label>스터디 상세 설명 : </label>
				<form:textarea path="boardContent" type="textarea" rows="5"
					class="form-control" />
				<form:errors path="boardContent" />
			</div>

			<div class="form-group">
				<label>스터디 이름 : </label>
				<form:input path="studyTitle" class="form-control" />
				<form:errors path="studyTitle" />
			</div>

			<div class="form-group">
				<label>스터디 타입 : </label>
				<form:select path="studyType" class="form-control">
					<form:option value="어학">어학</form:option>
					<form:option value="공무원">공무원</form:option>
					<form:option value="고시">고시</form:option>
					<form:option value="취업">취업</form:option>
					<form:option value="기타">기타</form:option>
				</form:select>
				<form:errors path="studyType" />
			</div>

			<div class="container">
				<div class="row justify-content-end">
					<input type="hidden" name="userId" value="${board.userId}">
					<input type="hidden" name="boardNum" value="${board.boardNum}">
					<input type="submit" value="수정하기" class="btn btn-outline-secondary m-1"> 
					<input type="reset" value="초기화하기" class="btn btn-outline-secondary m-1"> 
					<input type="button" value="취소하기" class="btn btn-outline-secondary m-1"
						onclick="location.href='/study/board/boardList/all'">
				</div>
			</div>
		</form:form>
		</div>
		
		<!-- footer -->
		<jsp:include page="/WEB-INF/resources/incl/footer.jsp" />
</body>
</html>