<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<jsp:include page="/WEB-INF/resources/incl/staticHeader.jsp" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Study With Me</title>
</head>
<body>
	<!-- menu -->
	<jsp:include page="/WEB-INF/resources/incl/header.jsp" />

	<div class="container">
		<sec:authentication var="principal" property="principal" />
		<input type="hidden" value="${principal}" id="principal">
		<input type="hidden" value="${checkLike}" id="checkLike">
		
		<div id="enabled"></div>
		<form id="target" method="post">
			<table class="table table-striped">
				<tr>
					<th>스터디 모집 글 제목</th>
					<td>${board.boardTitle}</td>
				</tr>
				<tr>
					<th>상세내용</th>
					<td>${board.boardContent}</td>
				</tr>
				<tr>
					<th>스터디 이름</th>
					<td>${board.studyTitle}</td>
				</tr>
				<tr>
					<th>스터디 타입</th>
					<td>${board.studyType}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${board.userId}</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${board.writedate}</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${board.views}</td>
				</tr>
				<tr>
					<th>좋아요</th>
					<td id="likeCount">${board.likes}</td>
				</tr>
			</table>
			<input type="hidden" value="${board.userId}" id="userId" name="userId"> 
			<input type="hidden" value="${board.boardNum}" id="boardNum" name="boardNum"> 
			<input type="button" value="가입하기" id="join">
			<c:if test="${board.userId eq principal}">
			<input type="submit" id="update" value="수정하기" 
			onclick="javascript: form.action='updateBoardPage';">
			<button type="button" id="updateStudy"></button>
			</c:if>
		</form>
		
		<button type="button" id="like"></button>
		<button onclick="location.href='/study/board/boardList'">목록보기</button>
		
	</div>
</body>

<script>

window.onload = function(){
	var enabled = ${board.enabled};
	var like = ${checkLike};
	
	if(enabled == '1'){
		$("#updateStudy").text("모집 마감하기");
		$("#enabled").text('모집 중');
	}else{
		$("#updateStudy").text("모집하기");
		$("#enabled").text('모집마감');
	}
	
	if(!like){
		$("#like").text("좋아요");
	}else{
		$("#like").text("좋아요 취소");
	}
	
	$("#join").on("click", function() {
		$.ajax({
			async : 'true',
			url : "/study/idCheck",
			type : 'post',
			data : {
				userId : $("#principal").val(),
				boardNum : $("#boardNum").val(),
				"${_csrf.parameterName}" : "${_csrf.token}"
			},
			dataType : 'json',
			success : function(check) {
				if (check) {
					alert('가입이 완료되었습니다!');
					location.href = "/study/join/${board.boardNum}"
				} else {
					alert('이미 가입한 스터디입니다.');
				}
				return false;
			},
			error : function() {
				alert('다시 시도해주세요.');
				return false;
			}
		})
	});
	
	$("#like").on("click", function() {
		$.ajax({
			async : 'true',
			url : "/study/board/updateLike",
			type : 'post',
			data : {
				boardNum : $("#boardNum").val(),
				userId : $("#principal").val(),
				"${_csrf.parameterName}" : "${_csrf.token}"
			},
			dataType : 'json',
			success : function(result) {
				if (result.checkLike) {
					$("#like").text("좋아요 취소");
					$("#likeCount").text(result.count);
					
				} else {
					$("#like").text("좋아요");
					$("#likeCount").text(result.count);
				}
				return false;
			},
			error : function() {
				alert('다시 시도해주세요.');
				return false;
			}
		})
	});
	
	
	$("#updateStudy").on("click", function(){
		location.href="/study/board/updateStudy?boardNum=${board.boardNum}&&enabled=${board.enabled}";
	});	
	
};

</script>
</html>