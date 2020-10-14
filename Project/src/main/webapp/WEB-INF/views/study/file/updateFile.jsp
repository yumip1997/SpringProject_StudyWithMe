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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<!-- menu -->
	<jsp:include page="/WEB-INF/resources/incl/header.jsp" />
	
	<!-- upload file -->
	<div class="container container-fluid pt-5">
		<div class="container text-center mb-2">
			<h2>파일 수정</h2>
		</div>
		
		<form action="/study/file/updateFile?${_csrf.parameterName}=${_csrf.token}" 
			method="post" enctype="multipart/form-data"
			accept-charset="UTF-8" id="target" class="form-group">

			<div class="form-group">
				<label>자료 제목 : </label>
				<input name="fileTitle" id="fileTitle" value="${file.fileTitle}"class="form-control" />
			</div>

			<div class="form-group">
				<label>자료 설명 : </label>
				<textarea name="fileContent" rows="5" class="form-control">${file.fileContent}</textarea>
			</div>

			<div class="form-group">
				<label>파일 업로드 </label> 
				<input type="file" name="uploadedFile" id="uploadedFile"/>
			</div>

			<div class="container">
				<div class="row justify-content-end">
					<input type="hidden" value="${file.fileNum}" name="fileNum">
					<input type="hidden" value="${file.boardNum}" name="boardNum">
					<input type="button" value="수정하기"  id="update" class="btn btn-outline-secondary m-1">
					<input type="reset" value="초기화하기" class="btn btn-outline-secondary m-1"> 
					<input type="button" value="목록보기" class="btn btn-outline-secondary m-1"
					onclick="location.href='/study/file/'+${boardNum}">
				</div>
			</div>
		</form>
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/resources/incl/footer.jsp" />
	<script>
	$("input[id=uploadedFile]").on("change", function(){
		var maxSize = 15728640;
		var fileSize = this.files[0].size;
		if(maxSize < fileSize){
			alert("업로드 가능한 최대 파일 사이즈는 15MB입니다.");
			$("#uploadedFile").val("");
		}
	});
	
	$("#update").on("click", function() {
		var len = $("#fileTitle").val().length;
		
		if($("#uploadedFile").val() == ""){
			alert('업로드 할 파일이 없습니다. 파일을 첨부해 주세요.');
			return false;
		}
		
		if(len<2 || len>20){
			alert('자료 제목은 2~20자로 입력해주세요.');
			return false;
		}
		
		$("#target").submit();
		
	});
	</script>

</body>
</html>