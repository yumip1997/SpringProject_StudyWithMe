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