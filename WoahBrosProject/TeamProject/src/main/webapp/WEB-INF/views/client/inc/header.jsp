<%@page import="com.edu.teamproject.domain.Member"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
	Member member= (Member)session.getAttribute("member");
%>
	<!-- header -->
	<div class="top-header-area" id="sticker">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-sm-12 text-center">
					<div class="main-menu-wrap">
						<!-- logo -->
						<div class="site-logo">
							<a href="/">
								<img src="/resources/client/assets/img/logo.png" alt="">
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
									</ul>
								</li>

								<li><a href="#">자원봉사</a>
									<ul class="sub-menu">
										<li><a href="/service">자원봉사 모집</a></li>
										<li><a href="/loc">보호소 위치</a></li>
									</ul>
								</li>
								<li><a href="#">재단활동</a>
									<ul class="sub-menu">
										<li><a href="/notice">공지사항</a></li>
										<li><a href="/campaign">공모사업</a></li>
									</ul>
								</li>
								<li><a href="javascript:alert('서비스준비중입니다..')">쇼핑몰</a></li>
								<%if(member!=null){ %>
									<li><a href="/logout">Logout</a></li>
								<%}else{ %>
									<li><a href="/login">Login</a></li>
								<%} %>
								<li>
									<div class="header-icons">
										<a class="shopping-cart" href="javascript:alert('서비스준비중입니다..')"><i class="fas fa-shopping-cart"></i></a>
										<a class="mobile-hide search-bar-icon" href="#"><i class="fas fa-search"></i></a>
									</div>
								</li>
							</ul>
						</nav>
						<a class="mobile-show search-bar-icon" href="#"><i class="fas fa-search"></i></a>
						<div class="mobile-menu"></div>
						<!-- menu end -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end header -->
	
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
							<button type="submit">Search <i class="fas fa-search"></i></button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end search arewa -->
	
