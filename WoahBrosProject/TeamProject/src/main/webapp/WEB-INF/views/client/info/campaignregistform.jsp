<%@page import="com.edu.teamproject.domain.Member"%>
<%@page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

<!-- title -->
<title>AnimalFair</title>

<!-- header_link -->

<%@include file="../inc/header_link.jsp"%>


</head>
<body>

	<!-- preloader -->
	<%@include file="../inc/preloader.jsp"%>

	<!-- header -->
	<%@include file="../inc/header.jsp"%>
	<%	
		String name = member.getName();
		int member_idx = member.getMember_idx();
	%>
	<!-- breadcrumb-section -->
	<div class="breadcrumb-section breadcrumb-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="breadcrumb-text">
						<p>Get 24/7 Support</p>
						<h1>공모사업 게시판</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->
	<!-- contact form -->

	<div class="container">

		<div id="collapseOne" class="collapse show"
			aria-labelledby="headingOne" data-parent="#accordionExample" style="">
			<div class="card-body">
				<div class="billing-address-form">
					<form id="form1">
							<input type="hidden" name="user_idx" value="<%=member_idx%>">
						<p>
							<input type="text" name="title" placeholder="제목입력">
						</p>
						<p>
							<input type="text" name="writer" value="<%=name %>" readonly="readonly">
						</p>
						<p>
							<textarea id="content" name="content"></textarea>
						</p>
					</form>
					<div style="text-align: center; padding-top: 30px">
						<button type="button" class="btn btn-warning btn-lg" id="bt_regist">등록</button>
						<button type="button" class="btn btn-warning btn-lg" id="bt_list">목록</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- end contact form -->


	<!-- footer -->
	<%@include file="../inc/footer.jsp"%>

	<!-- footer_link -->
	<%@include file="../inc/footer_link.jsp"%>

</body>

<script type="text/javascript">
function regist(){
	let formData = new FormData();
	
	formData.append("user_idx",$("input[name='user_idx']").val());
	formData.append("title",$("input[name='title']").val());
	formData.append("writer",$("input[name='writer']").val());
	formData.append("content",$("textarea[name='content']").val());
	
	$.ajax({
		url:"/rest/campaign/regist",
		type:"post",
		data:formData,
		processData:false,   // 쿼리스트링 사용여부
		contentType:false, 
		success:function(result, status, xhr){
			alert(result.msg);
			location.href="/campaign";
		}
	});
}

$(function() {

	$("#content").summernote({
		height : 400
	});
	
	$("#bt_regist").click(function(){
		regist();
	});
	
	$("#bt_list").click(function() {
		location.href = "/campaign";
	});

});
</script>

</html>
