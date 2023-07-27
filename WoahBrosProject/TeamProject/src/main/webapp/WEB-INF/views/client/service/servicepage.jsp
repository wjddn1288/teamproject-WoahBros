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
						<h1>자원봉사 페이지</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->
	<!-- contact form -->

	<!-- 그래프 들어갈 곳-->
	<div class="container" style="padding-top: 20px">
		<form>
			<div class="row-md-12">
				<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
					<form class="form-inline" action="/action_page.php">
						<div class="col-2">
							<select id="category" class="form-control" name="category">
								<option value="">선택▼</option>						
								<option value="type">종류</option>
								<option value="gender">제목</option>					
								<option value="name">작성자</option>
								<option value="regdate">작성일</option>
							</select>
						</div>
						<div class="col-9">
							<input class="form-control mr-sm-2" type="text" placeholder="Search..">
						</div>
						<div class="col-1">
							<button class="btn btn-warning" type="button">Search</button>
						</div>
					</form>
				</nav>
			</div>

			<div class="row-md-12">
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th>No</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>3</td>
							<td>서울 보호소 자원봉사 모집</td>
							<td>관리자</td>
							<td>23-03-16</td>
							<td>0</td>
						</tr>
						<tr>
							<td>2</td>
							<td>인천 보호소 자원봉사 모집</td>
							<td>관리자</td>
							<td>23-03-16</td>
							<td>23</td>
						</tr>
						<tr>
							<td>1</td>
							<td>제주 보호소 자원봉사 모집</td>
							<td>관리자</td>
							<td>23-03-16</td>
							<td>16</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="pagination-wrap"
				style="text-align: center; padding-bottom: 20px">
				<ul>
					<li><a href="#">Prev</a></li>
					<li><a href="#">1</a></li>
					<li><a class="active" href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">Next</a></li>
				</ul>
			</div>

		</form>
	</div>
	<!-- 그래프 끝나는 곳 -->

	<!-- end contact form -->


	<!-- footer -->
	<%@include file="../inc/footer.jsp"%>

	<!-- footer_link -->
	<%@include file="../inc/footer_link.jsp"%>

</body>

</html>