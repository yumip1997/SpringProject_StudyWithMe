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
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
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

	<!-- file detail -->
	<div class="container container-fluid p-5">
		<div class="container text-center pt-2">
			<h2>${file.fileTitle}</h2>
		</div>

		<sec:authentication var="principal" property="principal" />
		<input type="hidden" value="${principal}" id="principal"> 
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
	
	<!-- comment -->
	<div class="container">
		<div class="form-group">
		<h5>Comment (<span id="commentCount"></span>) : </h5>
			<form action="insertComment" method="post" id="commentForm">
				<textarea class="form-control" rows="2" name="commentContent" id="commentContent"></textarea>
				<input type="hidden" value="${principal}" name="userId"> 
				<input type="hidden" value="${file.boardNum}" name="boardNum"> 
				<input type="hidden" value="${file.fileNum}" name="postNum" id="postNum"> 
				<input type="hidden" value="file" name="postType"> 
				<input type="button" value="등록하기" class="btn btn-light pull-right m-1" id="commentBtn">
			</form>
		</div>

		<div class="container">
			<table id="commentBox" class="table table-borderless">
				<tbody>
				</tbody>
			</table>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/resources/incl/footer.jsp" />
	<script>
	window.onload = function(){
		function commentList() {
			$.ajax({
				async: 'true',
				url: "/study/comment/commentList",
				type: 'post',
				data: {
					'postNum': $("#postNum").val(),
					'postType': 'file',
					"${_csrf.parameterName}": "${_csrf.token}"
				},
				dataType: 'json',
				success: function (result) {
					var str = '';
					$.each(result, function (key, value) {
						if (value.groupOrder == 0) {
							str += '<tr><td><hr>' + value.userId + ' (' + moment(value.writedate).format('YYYY-MM-DD') + ')' + '</td></tr>';
							str += '<tr id="' + value.commentNum + '"><td>' + value.commentContent + '<label class="btn btn-light pull-right">';
							str += '<input type="radio" name="commentNum" value="' + value.commentNum + '">답글</label>';
							if (value.userId == $("#principal").val()) {
								str += '<label class="btn btn-light pull-right">';
								str += '<input type="radio" name="deleteComment" value="' + value.commentNum + '">삭제';
							}
							str += '</td></tr>'
						} else {
							str += '<tr><td class="pl-5"><i class="fa fa-chevron-right pr-2"></i>';
							str += value.userId + ' (' + moment(value.writedate).format('YYYY-MM-DD') + ')' + '</td></tr>';
							str += '<tr id="' + value.commentNum + '"><td class="pl-5">' + value.commentContent;
							if (value.userId == $("#principal").val()) {
								str += '<label class="btn btn-light pull-right">';
								str += '<input type="radio" name="deleteReply" value="' + value.commentNum + '">삭제';
							}
							str += '</td></tr>'
						}
					});
					$("#commentBox").html(str);
					$("#commentCount").html(result.length);
					return false;
				},
				error: function () {
					alert('다시 시도해주세요.');
					return false;
				}
			});
		}
		
		commentList();
		
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
		
		$("#commentBtn").on("click", function () {
			if (!($("#commentContent").val())) {
				alert("댓글을 입력해주세요.");
				return false;
			} else {
				$.ajax({
					async: 'true',
					url: "/study/comment/insertComment",
					type: 'post',
					data: $("#commentForm").serialize(),
					dataType: 'json',
					success: function (result) {
						commentList();
						return false;
					},
					error: function () {
						alert('다시 시도해주세요.');
						return false;
					}
				});
				$('#commentContent').val('');
			}
		});

		$('body').on('click', 'input:radio[name="commentNum"]', function () {
			$(this).attr('disabled', true);
			var num = $(":radio[name='commentNum']:checked").val();
			var str = '<tr><td>';
			str += '<form action="insertReply" method="post" id="replyForm">';
			str += '<textarea class="form-control" rows="2" name="commentContent" id="replyContent"></textarea>';
			str += '<input type="hidden" id="parentNum" name="parentNum">';
			str += '<input type="hidden" value="${principal}" name="userId">';
			str += '<input type="hidden" value="${file.boardNum}" name="boardNum">';
			str += '<input type="hidden" value="${file.fileNum}" name="postNum">';
			str += '<input type="hidden" value="file" name="postType">';
			str += '<input type="button" value="답글달기" class="btn btn-light pull-right m-1" id="replyBtn">';
			str += '</form>';
			str += '</td></tr>';
			$('tr#' + num).after(str);
		});

		$('body').on('click', '#replyBtn', function () {
			var num = $(":radio[name='commentNum']:checked").val();
			if (!($("#replyContent").val())) {
				alert("답글을 입력해주세요.");
				return false;
			} else {
				$("#parentNum").val(num);
				$.ajax({
					async: 'true',
					url: "/study/comment/insertReply",
					type: 'post',
					data: $("#replyForm").serialize(),
					dataType: 'json',
					success: function (result) {
						commentList();
						$('input:radio[name="commentNum"]').attr('disabled', false);
						return false;
					},
					error: function () {
						alert('다시 시도해주세요.');
						return false;
					}
				});
				$('#replyContent').val('');
			}
		});

		$('body').on('click', 'input:radio[name="deleteComment"]', function () {
			var num = $(":radio[name='deleteComment']:checked").val();
			if (confirm("정말 삭제하시겠습니까??") == true) {
				$.ajax({
					async: 'true',
					url: "/study/comment/deleteComment",
					type: 'post',
					data: {
						commentNum: num,
						"${_csrf.parameterName}": "${_csrf.token}"
					},
					success: function () {
						alert('삭제되었습니다.');
						commentList();
						return false;
					},
					error: function () {
						alert('다시 시도해주세요.');
						return false;
					}
				});
			} else {
				return false;
			}
		});

		$('body').on('click', 'input:radio[name="deleteReply"]', function () {
			var num = $(":radio[name='deleteReply']:checked").val();
			if (confirm("정말 삭제하시겠습니까??") == true) {
				$.ajax({
					async: 'true',
					url: "/study/comment/deleteReply",
					type: 'post',
					data: {
						commentNum: num,
						"${_csrf.parameterName}": "${_csrf.token}"
					},
					success: function () {
						alert('삭제되었습니다.');
						commentList();
						return false;
					},
					error: function () {
						alert('다시 시도해주세요.');
						return false;
					}
				});
			} else {
				return false;
			}
		});
	}
		
		
	</script>
</body>
</html>