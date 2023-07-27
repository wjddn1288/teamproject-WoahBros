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

<%@include file="./inc/header_link.jsp"%>


<style type="text/css">
.container {
	margin: auto;
}
</style>
</head>
<body>

	<!-- preloader -->
	<%@include file="./inc/preloader.jsp"%>

	<!-- header -->
	<%@include file="./inc/header.jsp"%>

	<!-- contact form -->

	<!-- search area -->
	<div class="search-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<span class="close-btn"><i class="fas fa-window-close"></i></span>
					<div class="search-bar">
						<div class="search-bar-tablecell">
							<h3>Search For:</h3>
							<input type="text" placeholder="Keywords">
							<button type="submit">
								Search <i class="fas fa-search"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end search arewa -->

	<!-- breadcrumb-section -->
	<div class="breadcrumb-section breadcrumb-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="breadcrumb-text">
						<p>Get 24/7 Support</p>
						<h1>Login</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->

	<!-- contact form -->
	<div class="container" align="center" style="padding-top: 30px;">
		<div class="col-lg-4 col-md-6 text-center lemon">
			<div class="single-product-item" align="center">
				<div class="product-image">
					<a href="single-product.html"><img
						src="/resources/client/assets/img/logo.png" alt=""></a>
				</div>
				<h5></h5>
				<div class="row-12" style="padding: 10px">
					<a href="#" class="cart-btn" id="bt_google"></i> 구글ID로 로그인</a>
				</div>
				<div class="row-12" style="padding: 10px">
					<a href="#" class="cart-btn" id="bt_kakao"></i> 카카오ID로 로그인</a>
				</div>
				<div class="row-12" style="padding: 10px">
					<a class="cart-btn" id="bt_naver"></i> 네이버ID로 로그인</a>
				</div>
			</div>
		</div>
	</div>

	<!-- end contact form -->


	<!-- footer -->
	<%@include file="./inc/footer.jsp"%>

	<!-- footer_link -->
	<%@include file="./inc/footer_link.jsp"%>

</body>

<script type="text/javascript">

function gotoAuthForm(sns){
$.ajax({
		url:"/rest/member/authform/"+sns,
	
	
		type:"get",
		success:function(result, status, xhr){
		 	//console.log("인증주소는", result.msg);
		 	location.href=result.msg;
		}
	});
	
	$.ajax({
		url:"/rest/member/authform/"+sns,
		type:"get",
		success:function(result, status, xhr){
		 	//console.log("인증주소는", result.msg);
		 	location.href=result.msg;
		}
	});
}

$(function(){
	$("#bt_google").click(function(){
		gotoAuthForm("google");
	});
})

</script>

</html>