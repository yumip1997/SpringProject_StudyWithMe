<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<jsp:include page="/WEB-INF/resources/incl/staticHeader.jsp" />
<title>Insert title here</title>
</head>
<body>
<!-- menu -->
<jsp:include page="/WEB-INF/resources/incl/header.jsp" />

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
	
	
	<input type="button" value="수정하기" onclick="update_button()">
	<input type="button" value="탈퇴하기" onclick="delete_button()">
	
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<input type="button" value="목록보기"
			onclick="location.href='<c:url value="memberList" />'">
	</sec:authorize>
</body>
<script>
	function update_button() {
		location.href = "<c:url value="./updateMember?userId=${member.userId}" />"
	};

	function delete_button() {
		if (confirm("작성한 글이 모두 삭제됩니다. 정말 탈퇴하시겠습니까?") == true) {
			alert("탈퇴되었습니다!")
			location.href = "<c:url value="./deleteMember/${member.userId}" />"
		} else {
			return false;
		}
	};
</script>
</html>