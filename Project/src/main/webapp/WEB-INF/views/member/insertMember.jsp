<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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

	<!-- singup form -->
	<div class="container container-fluid p-5">
		<div class="container p-3 text-center">
			<h3>회원정보입력</h3>
		</div>
		<div class="row justify-content-center">
			<div class="col-md-8 align-self-center">
				<form:form action="insertMember" method="post"
					modelAttribute="member" class="pb-4">
					<table class="table table-striped">
						<tr>
							<td>아이디</td>
							<td><form:input path="userId" placeholder="4~20자의 영문대소문자와 숫자" 
							onfocus="this.placeholder=''" class="form-control" id="inputId" /> 
							<form:errors path="userId" />
							<button type="button" id="checkId" class="btn btn-secondary pull-right m-1">중복확인</button>
							</td>
						</tr>

						<tr>
							<td>이름</td>
							<td><form:input path="name" placeholder="한글만 가능" 
							onfocus="this.placeholder=''" class="form-control" /> 
							<form:errors path="name" /></td>
						</tr>

						<tr>
							<td>비밀번호</td>
							<td><form:input type="password" path="password"
								placeholder="6~12자의 영문대소문자와 숫자" onfocus="this.placeholder=''" class="form-control" /> 
								<form:errors path="password" /></td>
						</tr>

						<tr>
							<td>이메일</td>
							<td><form:input path="email" placeholder="abcd@google.com"
							onfocus="this.placeholder=''" class="form-control" /> 
							<form:errors path="email" /></td>
						</tr>
					</table>
					
					<div class="container">
						<div class="row-justify-content-end">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<input type="button" id="submitBtn" value="가입" class="btn btn-outline-secondary m-1"> 
							<input type="reset" value="초기화" class="btn btn-outline-secondary m-1">
							<button type="button" class="btn btn-outline-secondary m-1"
							onclick="location.href='/stduy/index'">가입취소</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/resources/incl/footer.jsp" />
</body>
<script>
	window.onload = function(){
		var flag = false;
		
		$("#checkId").on("click", function(){
			if(!$("#inputId").val()){
				alert('아이디를 입력해주세요.');
				return false;
			}else{
				$.ajax({
					async : 'true',
					url : '/study/member/checkId',
					type : 'post',
					data : {
						userId : $("#inputId").val(),
						"${_csrf.parameterName}" : "${_csrf.token}"
					},
					dataType : 'json',
					success : function(check){
						if(check){
							flag = true;
							alert('사용가능한 아이디입니다.');
							$("#checkId").text("중복확인완료");
							$("#checkId").attr("disabled", true)
						}else{
							alert('이미 존재하는 아이디입니다!');
						}
						return false;
					},
					error : function(){
						alert('다시 시도해주세요.');
						return false;
					}
				})
			}
		});
		
		$("#submitBtn").on("click", function(){
			if(!flag){
				alert('중복검사를 해주세요.');
			}else{
				$("form").submit();
			}
		})
	}
</script>
</html>