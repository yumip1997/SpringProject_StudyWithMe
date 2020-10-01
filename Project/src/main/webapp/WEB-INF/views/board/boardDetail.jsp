<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<jsp:include page="/WEB-INF/resources/incl/staticHeader.jsp" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

	<!-- study board detail -->
	<div class="container container-fluid pt-5">
		<div class="container text-center mb-2">
			<h2>${board.studyTitle} 스터디</h2>
		</div>

		<div class="container mb-2">
			<button class="btn btn-info" id="checkEnabled" disabled></button>
		</div>

		<div class="container">
			<sec:authentication var="principal" property="principal" />
			<input type="hidden" value="${principal}" id="principal"> 
			<input type="hidden" value="${checkLike}" id="checkLike">
			<form method="post">
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
				<input type="button" value="가입하기" class="btn btn-light m-1" id="join">
				<c:if test="${board.userId eq principal}">
					<button type="button" class="btn btn-light m-1" id="updateEnabled"></button>
					<input type="submit" class="btn btn-light m-1" id="update"
					value="수정하기" onclick="javascript: form.action='updateBoardPage';">
				</c:if>
			</form>
		</div>

		<div class="container">
			<div class="row justify-content-end">
				<button class="btn btn-outline-secondary mx-1" id="like"></button>
				<button class="btn btn-outline-secondary" id="viewList">목록보기</button>
			</div>
		</div>
	</div>

	<!-- comment -->
	<div class="container">
		<div class="form-group">
			<h5>Comment (<span id="commentCount"></span>) : </h5>
			<form action="insertComment" method="post" id="commentForm">
				<textarea class="form-control" rows="2" name="commentContent" id="commentContent"></textarea>
				<input type="hidden" value="${principal}" name="userId">
				<input type="hidden" value="${board.boardNum}" name="boardNum">
				<input type="hidden" value="${board.boardNum}" name="postNum"> 
				<input type="hidden" value="board" name="postType"> 
				<input type="button" value="등록하기" class="btn btn-light pull-right m-1" id="commentBtn">
			</form>
		</div>

		<div class="container">
			<table id="commentBox" class="table table-borderless">
			<tbody></tbody>
			</table>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/resources/incl/footer.jsp" />
</body>

<script>
	window.onload = function() {
		
		var enabled = ${board.enabled};
		var checkLike = ${checkLike};
		if (enabled == '1') {
			$("#join").show();
			$("#updateEnabled").text("모집 마감하기");
			$("#checkEnabled").text('모집 중');
		} else {
			$("#join").hide();
			$("#updateEnabled").text("모집하기");
			$("#checkEnabled").text('모집마감');
		}
		if (!checkLike) {
			$("#like").text("좋아요");
		} else {
			$("#like").text("좋아요 취소");
		}
		
		commentList();
		
		$("#join").on("click", function() {
			$.ajax({
				async : 'true',
				url : "/study/join",
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
		$("#updateEnabled").on("click", function() {
			$.ajax({
				async : 'true',
				url : "/study/board/updateStudy",
				type : 'post',
				data : {
					boardNum : $("#boardNum").val(),
					enabled : enabled,
					"${_csrf.parameterName}" : "${_csrf.token}"
				},
				dataType : 'json',
				success : function(result) {
					if (result) {
						$("#join").show();
						$("#checkEnabled").text('모집중');
						$("#updateEnabled").text("모집 마감하기");
						enabled = 1;
					} else {
						$("#join").hide();
						$("#checkEnabled").text('모집마감');
						$("#updateEnabled").text("모집 하기");
						enabled = 0;
					}
					return false;
				},
				error : function() {
					alert('다시 시도해주세요.');
					return false;
				}
			});
		});
		
		$("#viewList").on("click", function() {
			location.href = "/study/board/boardList/all";
		});
		
		function commentList() {
			$.ajax({
				async: 'true',
				url: "/study/comment/commentList",
				type: 'post',
				data: {
					'postNum': $("#boardNum").val(),
					'postType': 'board',
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
			str += '<input type="hidden" value="${board.boardNum}" name="boardNum">';
			str += '<input type="hidden" value="${board.boardNum}" name="postNum">';
			str += '<input type="hidden" value="board" name="postType">';
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
			if (confirm("정말 삭제하시겠습니까?") == true) {
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
			if (confirm("정말 삭제하시겠습니까?") == true) {
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
		

};
</script>
</html>