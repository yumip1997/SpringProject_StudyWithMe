<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<jsp:include page="/WEB-INF/resources/incl/staticHeader.jsp" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Study With Me</title>
</head>
<body>
	<!-- menu -->
	<jsp:include page="/WEB-INF/resources/incl/header.jsp" />

	<!-- header -->
	<div class="jumbotron bg-secondary">
		<div class="container-fluid p-3 text-center">
			<h1 class="text-white">Study With Me</h1>
		</div>
	</div>

	<!-- member detail -->
	<div class="container container-fluid p-5">
		<div class="container text-center">
			<h2>회원 상세정보</h2>
		</div>

		<table class="table table-striped">
			<tr>
				<td>아이디</td>
				<td>${member.userId}</td>
			</tr>

			<tr>
				<td>이름</td>
				<td>${member.name}</td>
			</tr>

			<tr>
				<td>이메일</td>
				<td>${member.email}</td>
			</tr>

			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<tr>
					<td>계정상태</td>
					<td>${account}</td>
				</tr>

				<tr>
					<td>권한</td>
					<td>${auth}</td>
				</tr>
			</sec:authorize>
		</table>
	</div>

	<div class="container mt-3">
		<div class="row justify-content-end">
			<button id="updateMember" class="btn btn-outline-secondary m-1">수정하기</button>
			<button id="deleteMember" class="btn btn-outline-secondary m-1">탈퇴하기</button>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<button class="btn btn-outline-secondary m-1"
					onclick="location.href='memberList'">목록보기</button>
			</sec:authorize>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/resources/incl/footer.jsp" />

</body>
<script>
	$("#updateMember").on("click", function() {
		location.href = "/study/member/updateMember?userId=${member.userId}";
	});
	
	$("#deleteMember").on("click", function(){
		if (confirm("작성한 글이 모두 삭제됩니다. 정말 탈퇴하시겠습니까?") == true) {
			alert("탈퇴되었습니다!")
			location.href = "/study/member/deleteMember/"+${member.userId};
		} else {
			return false;
		}
	})
</script>
</html>