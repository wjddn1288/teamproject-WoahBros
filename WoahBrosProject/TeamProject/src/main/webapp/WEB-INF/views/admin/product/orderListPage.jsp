<%@page contentType="text/html;charset=UTF-8"%>
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
</head>

<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- Menu -->

			<%@include file="../inc/menu.jsp"%>

			<!-- / Menu -->

			<!-- Layout container -->
			<div class="layout-page">
				<!-- Navbar -->

				<nav
					class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
					id="layout-navbar">


					<div
						class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
						<a class="nav-item nav-link px-0 me-xl-4"
							href="javascript:void(0)"> <i class="bx bx-menu bx-sm"></i>
						</a>
					</div>

					<div class="col-2">
						<select id="selectTypeOpt" class="form-select color-dropdown">
							<option value="bg-primary">선택▼</option>
							<option value="bg-secondary">카테고리</option>
							<option value="bg-success">제품명</option>
							<option value="bg-success">구매자</option>
							<option value="bg-success">진행상황</option>
							<option value="bg-success">주문일</option>
						</select>
					</div>
					<div class="col-1"></div>

					<div class=" navbar-nav-right d-flex align-items-center"
						id="navbar-collapse">
						<!-- Search -->
						<div class="col-10 navbar-nav align-items-center">
							<div class="nav-item d-flex align-items-center">
								<i class="bx bx-search fs-4 lh-0"></i> <input type="text"
									class="form-control border-0 shadow-none"
									placeholder="Search..." aria-label="Search..." />
							</div>
						</div>

						<div>
							<button id="showToastPlacement" class="btn btn-primary d-block">검색</button>
						</div>
						<!-- /Search -->

					</div>
				</nav>

				<!-- / Navbar -->

				<!-- Content wrapper -->
				<div class="container">
					<div class="row">
						<!-- Content -->

						<div class="table-responsive text-nowrap">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>No</th>
										<th>카테고리</th>
										<th>제품명</th>										
										<th>구매자</th>
										<th>진행상황</th>
										<th>주문일</th>
									</tr>
								</thead>
								<tbody class="table-border-bottom-0">
									<tr>
										<td><i class="fab fa-angular fa-lg text-danger me-3"></i>
											<strong>3</strong></td>
										<td>사료</td>
										<td>제주유기농사료</td>
										<td>가나다</td>
										<td>--</td>
										<td>23-03-08</td>
									</tr>
									<tr>
										<td><i class="fab fa-angular fa-lg text-danger me-3"></i>
											<strong>2</strong></td>
										<td>배변패드</td>
										<td>흡수력짱짱패드</td>
										<td>라마바</td>
										<td>발송</td>
										<td>23-03-08</td>
									</tr>
									<tr>
										<td><i class="fab fa-angular fa-lg text-danger me-3"></i>
											<strong>1</strong></td>
										<td>굿즈</td>
										<td>팔찌</td>
										<td>사아자</td>
										<td>발송</td>
										<td>23-03-08</td>
									</tr>
								</tbody>
							</table>
							
							<div class="demo-inline-spacing">
								<div class="row">
									<div class="col-sm-10">
										<nav aria-label="Page navigation">
											<ul class="pagination">
												<li class="page-item prev"><a class="page-link"
													href="javascript:void(0);"><i
														class="tf-icon bx bx-chevron-left"></i></a></li>
												<li class="page-item"><a class="page-link"
													href="javascript:void(0);">1</a></li>
												<li class="page-item"><a class="page-link"
													href="javascript:void(0);">2</a></li>
												<li class="page-item active"><a class="page-link"
													href="javascript:void(0);">3</a></li>
												<li class="page-item"><a class="page-link"
													href="javascript:void(0);">4</a></li>
												<li class="page-item"><a class="page-link"
													href="javascript:void(0);">5</a></li>
												<li class="page-item next"><a class="page-link"
													href="javascript:void(0);"><i
														class="tf-icon bx bx-chevron-right"></i></a></li>
											</ul>
										</nav>
									</div>
							</div>
							</div>
						</div>
					</div>
				</div>
				<!-- / Content -->

				<!-- Content wrapper -->


				<!-- Footer -->
				<%@include file="../inc/footer.jsp"%>
				<!-- / Footer -->

				<div class="content-backdrop fade"></div>
			</div>
			<!-- Content wrapper -->
		</div>
		<!-- / Layout page -->
	</div>

	<!-- Overlay -->
	<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	<%@include file="../inc/footer_link.jsp"%>
</body>
</html>
