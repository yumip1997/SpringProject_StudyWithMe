<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<jsp:include page="/WEB-INF/resources/incl/staticHeader.jsp" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
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

	<!-- qna Detail -->
	<div class="container container-fluid pt-5">
		<div class="container text-center mb-2">
			<h2>${qna.qnaTitle}</h2>
		</div>

		<sec:authentication var="principal" property="principal" />
		<form id="target" method="post">
			<table class="table">
				<tr>
					<th>질문제목</th>
					<td>${qna.qnaTitle}</td>
				</tr>

				<tr>
					<th>질문내용</th>
					<td>${qna.qnaContent}</td>
				</tr>

				<tr>
					<th>질문자</th>
					<td>${qna.userId}</td>
				</tr>
				<tr>

					<th>작성일</th>
					<td>${qna.writedate}</td>
				</tr>
			</table>
			<c:if test="${qna.userId eq principal}">
				<input type="hidden" value="${qna.qnaNum}" name="qnaNum">
				<input type="hidden" value="${qna.boardNum}" name="boardNum">
				<input type="submit" value="수정하기" class="btn btn-light m-1" id="update">
				<input type="submit" value="삭제하기" class="btn btn-light m-1" id="delete">
			</c:if>
		</form>
		<button class="btn btn-outline-secondary pull-right" id="viewList">목록보기</button>
	</div>

	<!-- comment -->
	<div class="container">
		<div class="form-group">
			<h5>Comment (<span id="totalComment">${commentCount}</span>) :</h5>
			<form action="insertComment" method="post" id="commentForm">
				<textarea class="form-control" rows="2" name="commentContent" id="commentContent"></textarea>
				<input type="hidden" value="${principal}" name="userId"> 
				<input type="hidden" value="${qna.qnaNum}" name="postNum"> 
				<input type="hidden" value="qna" name="postType"> 
				<input type="button" value="등록하기" class="btn btn-light pull-right m-1" id="commentBtn">
			</form>
		</div>

		<div class="container">
			<table id="commentBox" class="table table-borderless">
				<tbody>
					<c:forEach var="comment" items="${commentList}">
						<c:choose>
							<c:when test="${comment.groupOrder eq 0}">
								<tr>
									<td><hr>${comment.userId}( ${comment.writedate} )</td>
								</tr>
								<tr id="${comment.commentNum}">
									<td>${comment.commentContent}
									<label class="btn btn-light pull-right"> 
									<input type="radio" name="commentNum" value="${comment.commentNum}">답글
									</label> 
									<c:if test="${comment.userId eq principal}">
									<label class="btn btn-light pull-right"> 
									<input type="radio" name="deleteComment" value="${comment.commentNum}">삭제
									</label>
									</c:if>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td class="pl-5"><i class="fa fa-chevron-right"></i>
										${comment.userId} (${comment.writedate} )</td>
								</tr>
								<tr id="${comment.commentNum}">
									<td class="pl-5">${comment.commentContent}
									<c:if test="${comment.userId eq principal}">
									<label class="btn btn-light pull-right"> 
									<input type="radio" name="deleteReply" value="${comment.commentNum}">삭제
									</label>
									</c:if>
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/resources/incl/footer.jsp" />
	<script>
		$("#update").on("click", function() {
			$("#target").attr("action", "updateQnAPage")
		});

		$("#delete").on("click", function() {
			if (confirm("정말로 삭제하시겠습니까?") == true) {
				$("#target").attr("action", "deleteQnA");
				return true;
			} else {
				return false;
			}
		});
		
		$("#viewList").on("click", function(){
			location.href ="/study/qna/qnaList/${qna.boardNum}";
		});
		
		$("#commentBtn").on("click", function() {
			if (!($("#commentContent").val())) {
				alert("댓글을 입력해주세요.");
				return false;
			}else{
				$.ajax({
					async : 'true',
					url : "/study/board/insertComment",
					type : 'post',
					data : $("#commentForm").serialize(),
					dataType : 'json',
					success : function(result) {
						var date = moment(result.writedate).format('YYYY-MM-DD');
						var str ="<tr><td><hr>"+result.userId+" ("+date+")"+"</td></tr>";
						str += "<tr id='result.commentNum'><td>";
						str += result.commentContent;
						str += '</td></tr>';
						
						$("#commentBox > tbody:last").append(str);
						return false;
					},
					error : function() {
						alert('다시 시도해주세요.');
						return false;
					}
				});
				$('#commentContent').val('');
			}
		});
		
		$("input:radio[name='commentNum']").one("click", function(){
			var num = $(":radio[name='commentNum']:checked").val();
			var str = '<tr><td>';
			str += '<form action="insertReply" method="post" id="replyForm">';
			str += '<textarea class="form-control" rows="2" name="commentContent" id="replyContent"></textarea>';
			str += '<input type="hidden" id="parentNum" name="parentNum">';
			str += '<input type="hidden" value="${principal}" name="userId">';
			str += '<input type="hidden" value="${qna.qnaNum}" name="postNum">';
			str += '<input type="hidden" value="qna" name="postType">';
			str += '<input type="button" value="답글달기" class="btn btn-light pull-right m-1" id="replyBtn">';
			str += '</form>';
			str += '</td></tr>';
			$('tr#'+num).after(str);
			
			$("#replyBtn").on("click", function(){
				if(!($("#replyContent").val())){
					alert("답글을 입력해주세요.");
					return false;
				}else{
					$("#parentNum").val(num);
					$.ajax({
						async : 'true',
						url : "/study/board/insertReply",
						type : 'post',
						data : $("#replyForm").serialize(),
						dataType : 'json',
						success : function(result) {
							var date = moment(result.writedate).format('YYYY-MM-DD');
							var str = '<tr><td class="pl-5"><i class="fa fa-chevron-right"></i>';
							str += result.userId + '(' + date +')</td></tr>';
							str += '<tr><td class="pl-5">' + result.commentContent;
							str += '</tr></td>';
							$('tr#'+result.parentNum).after(str);
							return false;
						},
						error : function() {
							alert('다시 시도해주세요.');
							return false;
						}
					});
					$('#replyContent').val('');
				}
			})
		});
		
		$("input:radio[name='deleteComment']").on("click", function(){
			var num = $(":radio[name='deleteComment']:checked").val();
			if (confirm("정말 삭제하시겠습니까??") == true){
				$.ajax({
					async : 'true',
					url : "/study/board/deleteComment",
					type : 'post',
					data : {commentNum : num},
					success : function() {
						alert('삭제되었습니다.');
						$('tr#'+num).prev().remove();
						$('tr#'+num).remove();
						return false;
					},
					error : function() {
						alert('다시 시도해주세요.');
						return false;
					}
				});
			}else{
				return;
			}
		});
		
		$("input:radio[name='deleteReply']").on("click", function(){
			var num = $(":radio[name='deleteReply']:checked").val();
			if (confirm("정말 삭제하시겠습니까??") == true){
				$.ajax({
					async : 'true',
					url : "/study/board/deleteReply",
					type : 'post',
					data : {commentNum : num},
					success : function() {
						alert('삭제되었습니다.');
						$('tr#'+num).prev().remove();
						$('tr#'+num).remove();
						return false;
					},
					error : function() {
						alert('다시 시도해주세요.');
						return false;
					}
				});
			}else{
				return;
			}
		});
	</script>
</body>
</html>