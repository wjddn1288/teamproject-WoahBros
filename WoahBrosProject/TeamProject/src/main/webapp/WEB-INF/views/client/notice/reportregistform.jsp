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
	<!-- breadcrumb-section -->
	<div class="breadcrumb-section breadcrumb-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="breadcrumb-text">
						<p>Get 24/7 Support</p>
						<h1>신고 게시판</h1>
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
						<p>
							<select id="category" class="form-control" name="category">
								<option value="">선택▼</option>						
								<option value="type">실종</option>
								<option value="type">학대</option>
								<option value="gender">보호</option>
							</select>
						</p>
						<p>
							<input type="text" name="title" placeholder="제목입력">
						</p>
						<p>
							<textarea id="content" name="content"></textarea>
						</p>
					</form>
						<div style="text-align: center; padding-top: 30px">
							<button type="button" class="btn btn-warning btn-lg" id="bt_regist">등록</button>
							<button type="button" class="btn btn-warning btn-lg" id="bt_back">돌아가기</button>
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

$(function(){
	
	$("#content").summernote({
		height:400
	});
	
	$("#bt_back").click(function(){
		if(confirm("글쓰기를 취소하시겠습니까?")){
			location.href="/report";
		}
	});
	
});

</script>

</html>
