<%@page import="com.edu.teamproject.domain.Adopt"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
	Adopt adopt = (Adopt) request.getAttribute("adopt");
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
<title>Single News</title>

<!-- header_link -->
<%@include file="../inc/header_link.jsp"%>

</head>
<body>


	<!-- preloader -->
	<%@include file="../inc/preloader.jsp"%>

	<!-- header -->
	<%@include file="../inc/header.jsp"%>

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
						<p>Read the Details</p>
						<h1>Single Article</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->

	<!-- single article section -->
	<div class="mt-150 mb-150">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="single-article-section">
						<div class="single-article-text">
							<img src="/resources/data/<%=adopt.getAdoptImgList().get(0).getFilename()%>" style="width: 730px; height: 450px">
							<p class="blog-meta">
								<span class="author"><i class="fas fa-user"></i> Admin</span> <span
									class="date"><i class="fas fa-calendar"></i> <%=adopt.getRegdate().substring(0,10) %></span>
							</p>
							<h2>상세 내용</h2>
							<%=adopt.getContent() %>
						</div>

					</div>
				</div>
				<div class="col-lg-4">
					<div class="sidebar-section">
						<div class="recent-posts">
							<h4>정보</h4>
							<ul>
								<li>이름 : <%=adopt.getName() %></li>
								<li>종류 : <%=adopt.getType() %></li>
								<li>성별 : <%=adopt.getGender() %></li>
								<li>나이 : <%=adopt.getAge() %></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end single article section -->



	<!-- footer -->
	<%@include file="../inc/footer.jsp"%>


	<!-- footer_link -->
	<%@include file="../inc/footer_link.jsp"%>


</body>
</html>