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



<style type="text/css">
.box-style {
	width: 90px;
	height: 95px;
	border: 1px solid #ccc;
	display: inline-block;
	margin: 5px;
}

.box-style img {
	width: 90px;
	height: 90px;
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
								<h5 class="card-header">공지사항 등록</h5>
								<div class="card-body">
									<div class="mb-3 row">
										<label for="html5-text-input" class="col-md-2 col-form-label">제목</label>
										<div class="col-md-10">
											<input class="form-control" type="text" placeholder="제목입력 입력.." name="title">
										</div>
									</div>
									
									<div class="mb-3 row">
										<label for="html5-text-input" class="col-md-2 col-form-label">작성자</label>
										<div class="col-md-10">
											<input class="form-control" type="text" value="관리자" name="writer">
										</div>
									</div>

									<div class="mb-3 row">
										<div class="col-md-12">
											<textarea class="form-control" id="content" name="content"></textarea>
										</div>
									</div>

									<div>
										<button type="button" class="btn rounded-pill btn-primary"
											id="bt_regist">등록</button>
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

function regist(){
	
	let formData = new FormData();
	
	formData.append("title",$("input[name='title']").val());
	formData.append("writer",$("input[name='writer']").val());
	formData.append("content",$("textarea[name='content']").val());
	
	$.ajax({
		url:"/admin/rest/notice",
		type:"post",
		data:formData,
		processData:false,   // 쿼리스트링 사용여부
		contentType:false, 
		success:function(result, status, xhr){
			alert(result.msg);
			location.href="/admin/notice/list";
		},
		error:function(xhr, status, result){
			
		}
	});
	
}

$(function(){
	
	$("#content").summernote({
		height:400
	});
	
	//등록 버튼 눌렀을 때
	$("#bt_regist").click(function(){
		regist();
	});
	
	//목록 버튼 눌렀을 때
	$("#bt_list").click(function(){
		location.href="/admin/notice/list";
	})
	
});
</script>
</html>