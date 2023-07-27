<%@page import="com.edu.teamproject.domain.Notice"%>
<%@page import="com.edu.teamproject.domain.Service"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>

<!-- beautify ignore:start -->
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default"
	data-assets-path="/resources/admin/ass/assets/"
	data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>Dashboard - Analytics | Sneat - Bootstrap 5 HTML Admin
	Template - Pro</title>

<!-- header_link -->
<%@include file="../inc/header_link.jsp"%>

<%
	Notice notice = (Notice) request.getAttribute("notice");
%>

<style type="text/css">
.box-style {
	width: 150px;
	height: 150px;
	border: 1px solid #ccc;
	display: inline-block;
	margin: 5px;
}

.box-style img {
	width: 150px;
	height: 150px;
}
</style>

</head>

<body>

	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container" id="app1">
			<!-- Menu -->

			<%@include file="../inc/menu.jsp"%>

			<div class="container">
				<div class="row">
					<div class="layout-page" align="center">
						<form id="form1">
							<div class="card mb-4">
								<h5 class="card-header">공지사항 상세보기</h5>
								<div class="card-body">
									<input type="hidden" name="notice_idx"
										value="<%=notice.getNotice_idx()%>" />
									<div class="mb-3 row">
										<label for="html5-text-input" class="col-md-2 col-form-label">제목</label>
										<div class="col-md-10">
											<input class="form-control" type="text" name="title"
												value="<%=notice.getTitle()%>" />
										</div>
									</div>

									<div class="mb-3 row">
										<div class="col-md-12">
											<textarea class="form-control" id="content" name="content"><%=notice.getContent()%></textarea>
										</div>
									</div>

									<div style="margin-top: 20px;">
										<button type="button" class="btn rounded-pill btn-primary"
											id="bt_edit">수정</button>
										<button type="button" class="btn rounded-pill btn-primary"
											id="bt_del">삭제</button>
										<button type="button" class="btn rounded-pill btn-primary"
											id="bt_list">목록</button>
									</div>
								</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	</div>
	<%@include file="../inc/footer_link.jsp"%>
</body>

<
<script type="text/javascript">
	//form 은 Post, Get만 지원... 해결책) json으로 전송...
	function edit() {
		let json = {};

		json['notice_idx'] = $("#form1 input[name='notice_idx']").val();
		json['title'] = $("#form1 input[name='title']").val();
		json['writer'] = $("#form1 input[name='writer']").val();
		json['content'] = $("#form1 textarea[name='content']").val();

		$.ajax({
			url : "/admin/rest/notice",
			type : "put",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(json),
			processData : false, // 쿼리스트링화 여부
			success : function(result, status, xhr) {
				alert(result.msg);
			},
			error : function(xhr, status, err) {

			}
		});
	}

	function del() {
		$("#form1").attr({
			action : "/admin/notice/del",
			method : "post"
		});
		$("#form1").submit();
	}

	$(function() {

		$("#content").summernote({
			height : 400
		});

		//수정버튼 눌렀을때
		$("#bt_edit").click(function() {
			if (confirm("수정하시겠습니까?")) {
				edit();
			}
		})

		//삭제버튼 눌렀을때
		$("#bt_del").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				del();
			}
		});

		//목록 버튼 눌렀을 때
		$("#bt_list").click(function() {
			location.href = "/admin/notice/list";
		})

	});
</script>
</html>

