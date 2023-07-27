
<%@page import="com.edu.teamproject.domain.Member"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
	Member member=(Member)session.getAttribute("member");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

<!-- title -->
<title>Fruitkha - Slider Version</title>

<%@include file="./inc/header_link.jsp"%>

</head>
<body>

	<!-- preloader -->
	<%@include file="./inc/preloader.jsp"%>

	<!-- header -->
	<div class="top-header-area" id="sticker">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-sm-12 text-center">
					<div class="main-menu-wrap">
						<!-- logo -->
						<div class="site-logo">
							<a href="/"> <img src="/resources/client/assets/img/logo.png"
								alt="">
							</a>
						</div>
						<!-- logo -->

						<!-- menu start -->
						<nav class="main-menu">
							<ul>
								<li class="current-list-item"><a href="/">Home</a></li>

								<li><a href="/adopt">입양</a></li>
								<li><a href="/donate">후원</a></li>

								<li><a href="#">정보소식</a>
									<ul class="sub-menu">
										<li><a href="/best">명예의 전당</a></li>
										<li><a href="/report">실종 / 학대 / 보호 신고</a></li>
									</ul></li>

								<li><a href="#">자원봉사</a>
									<ul class="sub-menu">
										<li><a href="/service">자원봉사 모집</a></li>
										<li><a href="/loc">보호소 위치</a></li>
									</ul></li>
								<li><a href=#>재단활동</a>
									<ul class="sub-menu">
										<li><a href="/notice">공지사항</a></li>
										<li><a href="/campaign">공모사업</a></li>
									</ul></li>
								<li><a href="javascript:alert('서비스준비중입니다..')">쇼핑몰</a></li>
								
								<%if(member!=null){ %>
									<li><a href="/logout">Logout</a></li>
								<%}else{ %>
									<li><a href="/login">Login</a></li>
								<%} %>
								<li>
									<div class="header-icons">
										<a class="shopping-cart" href="javascript:alert('서비스준비중입니다..')"><i
											class="fas fa-shopping-cart"></i></a> <a
											class="mobile-hide search-bar-icon" href="#"><i
											class="fas fa-search"></i></a>
									</div>
								</li>
							</ul>
						</nav>
						<a class="mobile-show search-bar-icon" href="#"> <i
							class="fas fa-search"></i>
						</a>
						<div class="mobile-menu"></div>
						<!-- menu end -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end header -->

	<!-- search area -->
	<div class="search-area ">
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
	<!-- end search area -->

	<!-- home page slider -->
	<div class="homepage-slider">
		<!-- single home slider -->
		<div class="single-homepage-slider homepage-bg-1">
			<div class="container">
				<div class="row">
					<div class="col-md-12 col-lg-7 offset-lg-1 offset-xl-0">
						<div class="hero-text">
							<div class="hero-text-tablecell">
								<p class="subtitle">Donate to us</p>
								<h1>작은 희망이 <br>되어주세요</h1>
								<div class="hero-btns">
									<a href="/donate" class="boxed-btn">후원하러 가기</a> <a
										href="/contact" class="bordered-btn">Contact Us</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- single home slider -->
		<div class="single-homepage-slider homepage-bg-2">
			<div class="container">
				<div class="row">
					<div class="col-lg-10 offset-lg-1 text-center">
						<div class="hero-text">
							<div class="hero-text-tablecell">
								<p class="subtitle">waiting to family..</p>
								<h1>외로운 친구의 <br> 가족이 되어주세요</h1>
								<div class="hero-btns">
									<a href="/adopt" class="boxed-btn">입양하러 가기</a> <a
										href="/contact" class="bordered-btn">Contact Us</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- single home slider -->
		<div class="single-homepage-slider homepage-bg-3">
			<div class="container">
				<div class="row">
					<div class="col-lg-10 offset-lg-1 text-right">
						<div class="hero-text">
							<div class="hero-text-tablecell">
								<p class="subtitle">100% environmentally friendly product!</p>
								<h1>유기견 후원하고 <br>좋은 제품 쇼핑하세요!</h1>
								<div class="hero-btns">
									<a href="/shop" class="boxed-btn">후원몰 가기</a> <a href="/contact"
										class="bordered-btn">Contact Us</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end home page slider -->

	<!-- features list section -->
	<div class="list-section pt-80 pb-80">
		<div class="container">

			<div class="row">
				<div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
					<div class="list-box d-flex align-items-center">
						<div class="list-icon">
							<i class="fas fa-shipping-fast"></i>
						</div>
						<div class="content">
							<h3>Free Shipping</h3>
							<p>When order over $75</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
					<div class="list-box d-flex align-items-center">
						<div class="list-icon">
							<i class="fas fa-phone-volume"></i>
						</div>
						<div class="content">
							<h3>24/7 Support</h3>
							<p>Get support all day</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div
						class="list-box d-flex justify-content-start align-items-center">
						<div class="list-icon">
							<i class="fas fa-sync"></i>
						</div>
						<div class="content">
							<h3>Refund</h3>
							<p>Get refund within 3 days!</p>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- end features list section -->

	<!-- testimonail-section -->
	<div class="testimonail-section mt-150 mb-150">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 offset-lg-1 text-center">
					<div class="testimonial-sliders">
						<div class="single-testimonial-slider">
							<div class="client-avater">
								<img src="/resources/client/assets/img/avaters/avatar1.png"
									alt="">
							</div>
							<div class="client-meta">
								<h3>
									박 규남 <span>Local shop owner</span>
								</h3>
								<p class="testimonial-body">" 저희 언더독이 외로운 아이들에게
									가족의 따뜻함을 느끼는 기회가 되길 바랍니다. "</p>
								<div class="last-icon">
									<i class="fas fa-quote-right"></i>
								</div>
							</div>
						</div>
						<div class="single-testimonial-slider">
							<div class="client-avater">
								<img src="/resources/client/assets/img/avaters/avatar2.png"
									alt="">
							</div>
							<div class="client-meta">
								<h3>
									최 정우 <span>Local shop owner</span>
								</h3>
								<p class="testimonial-body">" 부상으로 인한 휴식중.. 쾌유를 빕니다.완치후 돌아왔습니다 열심히 마무리하겠습니다!"</p>
								<div class="last-icon">
									<i class="fas fa-quote-right"></i>
								</div>
							</div>
						</div>
						<div class="single-testimonial-slider">
							<div class="client-avater">
								<img src="/resources/client/assets/img/avaters/avatar3.png"
									alt="">
							</div>
							<div class="client-meta">
								<h3>
									정 수권 <span>Runner</span>
								</h3>
								<p class="testimonial-body">" -탈주- "</p>
								<div class="last-icon">
									<i class="fas fa-quote-right"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end testimonail-section -->

	<!-- advertisement section -->
	<div class="abt-section mb-150">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-12">
					<div class="abt-bg">
						<a href="https://www.youtube.com/watch?v=YVMCByJ29OQ"
							class="video-play-btn popup-youtube"><i class="fas fa-play"></i></a>
					</div>
				</div>
				<div class="col-lg-6 col-md-12">
					<div class="abt-text">
						<p class="top-sub">Since Year 2023</p>
						<h2>
							We are <span class="orange-text">UnderDog</span>
						</h2>
						<p>유기견 후원 단체는 유기견들을 구조하고, 새로운 가정을 찾아주는데 주력하며, 무료로 입양을 돕는 등 유기견의 생명과 안녕을 위해 노력합니다. 이들 단체는 기부금, 자원봉사, 입양 등 다양한 방법을 통해 유기견들을 지원합니다.</p>
						<p>따라서 유기견 후원 단체를 통해 유기견들에게 새로운 삶의 기회를 제공하고 보호하는 데에 도움을 줄 수 있습니다. 이들 단체는 전 세계적으로 다양하게 존재하며, 많은 사람들이 후원을 통해 유기견들을 지원하고 있습니다.</p>
						
							<a id="bt_regist" class="boxed-btn mt-4">자원봉사 신청하기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end advertisement section -->


	<!-- latest news -->
	<!-- 
	<div class="latest-news pt-150 pb-150">
		<div class="container">

			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="section-title">
						<h3>
							<span class="orange-text">가족을 기다리는</span> 아이들
						</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Aliquid, fuga quas itaque eveniet beatae optio.</p>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-4 col-md-6">
					<div class="single-latest-news">
						<a href="single-news.html"><div
								class="latest-news-bg news-bg-1"></div></a>
						<div class="news-text-box">
							<h3>
								<a href="single-news.html">You will vainly look for fruit on
									it in autumn.</a>
							</h3>
							<p class="blog-meta">
								<span class="author"><i class="fas fa-user"></i> Admin</span> <span
									class="date"><i class="fas fa-calendar"></i> 27
									December, 2019</span>
							</p>
							<p class="excerpt">Vivamus lacus enim, pulvinar vel nulla
								sed, scelerisque rhoncus nisi. Praesent vitae mattis nunc,
								egestas viverra eros.</p>
							<a href="single-news.html" class="read-more-btn">read more <i
								class="fas fa-angle-right"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single-latest-news">
						<a href="single-news.html"><div
								class="latest-news-bg news-bg-2"></div></a>
						<div class="news-text-box">
							<h3>
								<a href="single-news.html">A man's worth has its season,
									like tomato.</a>
							</h3>
							<p class="blog-meta">
								<span class="author"><i class="fas fa-user"></i> Admin</span> <span
									class="date"><i class="fas fa-calendar"></i> 27
									December, 2019</span>
							</p>
							<p class="excerpt">Vivamus lacus enim, pulvinar vel nulla
								sed, scelerisque rhoncus nisi. Praesent vitae mattis nunc,
								egestas viverra eros.</p>
							<a href="single-news.html" class="read-more-btn">read more <i
								class="fas fa-angle-right"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 offset-md-3 offset-lg-0">
					<div class="single-latest-news">
						<a href="single-news.html"><div
								class="latest-news-bg news-bg-3"></div></a>
						<div class="news-text-box">
							<h3>
								<a href="single-news.html">Good thoughts bear good fresh
									juicy fruit.</a>
							</h3>
							<p class="blog-meta">
								<span class="author"><i class="fas fa-user"></i> Admin</span> <span
									class="date"><i class="fas fa-calendar"></i> 27
									December, 2019</span>
							</p>
							<p class="excerpt">Vivamus lacus enim, pulvinar vel nulla
								sed, scelerisque rhoncus nisi. Praesent vitae mattis nunc,
								egestas viverra eros.</p>
							<a href="single-news.html" class="read-more-btn">read more <i
								class="fas fa-angle-right"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 text-center">
					<a href="/adopt" class="boxed-btn">More</a>
				</div>
			</div>
		</div>
	</div>
	
	 -->
	<!-- end latest news -->

	<!-- product section -->
	<!-- 
	<div class="product-section mt-150 mb-150">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="section-title">
						<h3>
							<span class="orange-text">후원몰</span> 상품
						</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Aliquid, fuga quas itaque eveniet beatae optio.</p>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-4 col-md-6 text-center">
					<div class="single-product-item">
						<div class="product-image">
							<a href="single-product.html"><img
								src="/resources/client/assets/img/products/product-img-1.jpg"
								alt=""></a>
						</div>
						<h3>Strawberry</h3>
						<p class="product-price">
							<span>Per Kg</span> 85$
						</p>
						<a href="cart.html" class="cart-btn"><i
							class="fas fa-shopping-cart"></i> Add to Cart</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 text-center">
					<div class="single-product-item">
						<div class="product-image">
							<a href="single-product.html"><img
								src="/resources/client/assets/img/products/product-img-2.jpg"
								alt=""></a>
						</div>
						<h3>Berry</h3>
						<p class="product-price">
							<span>Per Kg</span> 70$
						</p>
						<a href="cart.html" class="cart-btn"><i
							class="fas fa-shopping-cart"></i> Add to Cart</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 offset-md-3 offset-lg-0 text-center">
					<div class="single-product-item">
						<div class="product-image">
							<a href="single-product.html"><img
								src="/resources/client/assets/img/products/product-img-3.jpg"
								alt=""></a>
						</div>
						<h3>Lemon</h3>
						<p class="product-price">
							<span>Per Kg</span> 35$
						</p>
						<a href="cart.html" class="cart-btn"><i
							class="fas fa-shopping-cart"></i> Add to Cart</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	 -->
	<!-- end product section -->

	<!-- footer -->
	<%@include file="./inc/footer.jsp"%>

	<!-- footer_link -->
	<%@include file="./inc/footer_link.jsp"%>

</body>
<script type="text/javascript">

function regist(){
	
	$.ajax({
		url:"/rest/member/volunteer",
		type:"post",
		success:function(result, status, xhr){
			alert(result.msg);

		},
		error:function(xhr, status, err){
			location.href="/loginrequest"
		}
	});
}

$(function(){
	$("#bt_regist").click(function(){
		if(confirm("자원봉사신청을 하시겠습니까??")){
			regist();
		}
	});
});


</script>
</html>