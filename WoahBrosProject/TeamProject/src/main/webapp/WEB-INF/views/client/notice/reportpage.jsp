<%@page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

	<!-- title -->
	<title>AnimalFair</title>

	<!-- header_link -->

	<%@include file="../inc/header_link.jsp" %>

	<%@include file="../inc/header_link.jsp" %>

</head>
<body>
	
	<!-- preloader -->
	<%@include file="../inc/preloader.jsp" %>
	
	<!-- header -->
	<%@include file="../inc/header.jsp" %>
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

<!-- single article section -->
	<div class="mt-150 mb-150">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="single-article-section">
						<div class="single-article-text">
							<div class="single-artcile-bg"></div>
							<h2>학대/보호/실종 등 도움이 필요한 경우에 신고해주세요</h2>
							<p>잃어버린 동물을 찾고 계신다면, 해당 동물의 정보와 함께 게시글을 작성 해주시되, 동물의 종류와 색상등 여러 정보가 포함될 수 있도록 해주세요. 실종된 동물의 최근 사진을 첨부하시면 더욱 좋습니다.</p>
							<p>동물학대를 목격 및 관련 이야기를 들으셨다면 지역 및 동물 종류, 학대내용 등의 정보를 포함하여 글을 작성해 주세요. 가능한 많은 정보를 제공해주시면 보다 신속한 대처에 도움이 됩니다.</p>
							<p>보호조치가 필요한 동물을 알고 계신다면 해당 동물이 있는 지역, 종류, 색상 등과 함께 정보를 포함하여 글을작성해 주세요.</p>
						</div>

						<div class="comment-template" style="padding-top: 40px; text-align: center">
							<h4> Leave a comment</h4>
							<p>If you have a comment dont feel hesitate to send us your opinion.</p>
							<p><input type="submit" value="신고하기" id="bt_report"></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end single article section -->

	<!-- end contact form -->


	<!-- footer -->
	<%@include file="../inc/footer.jsp" %>
	
	<!-- footer_link -->
	<%@include file="../inc/footer_link.jsp" %>
	
</body>

<script type="text/javascript">

	$(function(){
		
		$("#bt_report").click(function(){
			location.href="/report/regist";
		});
		
	});

</script>
   
</html>