<%@page import="com.edu.teamproject.util.PageManager"%>
<%@page import="com.edu.teamproject.domain.Member"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
	List<Member> userList = (List) request.getAttribute("userList");
	PageManager pm = new PageManager();
	pm.init(userList, request);
%>
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
<%@include file="./inc/header_link.jsp"%>
</head>

<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- Menu -->

			<%@include file="./inc/menu.jsp"%>

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
							<option value="bg-primary">이름</option>
							<option value="bg-secondary">가입일</option>
							<option value="bg-success">전화번호</option>
							<option value="bg-danger">자원봉사</option>
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
										<th>이름</th>
										<th>이메일</th>
										<th>가입경로</th>
										<th>가입일</th>
										<th>자원봉사</th>
									</tr>
								</thead>
								<tbody class="table-border-bottom-0">
									<%
										int curPos = pm.getCurPos();
									%>
									<%
										int num = pm.getNum();
									%>
									<%
										for (int a = 0; a < pm.getPageSize(); a++) {
									%>
									<%
										if (num < 1)
																	break;
									%>
									<%
										Member user = userList.get(curPos++);
									%>
									<tr>
										<td><i class="fab fa-angular fa-lg text-danger me-3"></i>
											<strong><%=num--%></strong></td>
										<td><%=user.getName()%></td>
										<td><%=user.getEmail()%></td>
										<td><%=user.getSns()%></td>
										<td><%=user.getRegdate().substring(0, 10)%></td>
										<%
											if (user.getChecking() == 1) {
										%>
										<td><span class="badge bg-label-primary me-1">신청</span></td>
										<%
											} else {
										%>
										<td>-</td>
										<%
											}
										%>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
							<div class="col-conter">
								<div class="demo-inline-spacing">
									<!-- Basic Pagination -->
									<div class="row">
										<div class="col">
											<nav aria-label="Page navigation">
												<ul class="pagination">
													<%
														if (pm.getTotalPage() < pm.getFirstPage() - 1) {
													%>
													<li class="page-item prev"><a class="page-link"
														href="/admin/memberlist?currentPage=<%=pm.getFirstPage() - 1%>"><i
															class="tf-icon bx bx-chevron-left"></i></a></li>
													<%
														} else {
													%>
													<li class="page-item prev"><a class="page-link"
														href="javascript:alert('이전페이지가 없습니다.')"><i
															class="tf-icon bx bx-chevron-left"></i></a></li>
													<%
														}
													%>
													<%
														for (int a = pm.getFirstPage(); a <= pm.getLastPage(); a++) {
													%>
													<%
														if (a > pm.getTotalPage())
														break;
													%>
													<li
														class="page-item <%if (a == pm.getCurrentPage()) {%>active<%}%>"><a
														class="page-link"
														href=" memberList?currentPage=<%=a%>"><%=a%></a></li>
													<%
														}
													%>

													<%
														if (pm.getTotalPage() > pm.getLastPage() + 1) {
													%>
													<li class="page-item next"><a class="page-link"
														href="/admin/memberlist?currentPage=<%=pm.getLastPage() + 1%>"><i
															class="tf-icon bx bx-chevron-right"></i></a></li>
													<%
														} else {
													%>
													<li class="page-item next"><a class="page-link"
														href="javascript:alert('다음페이지가 없습니다.');"><i
															class="tf-icon bx bx-chevron-right"></i></a></li>
													<%
														}
													%>
												</ul>
											</nav>
										</div>
									</div>
									<!--/ Basic Pagination -->
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- / Content -->

				<!-- Content wrapper -->


				<!-- Footer -->
				<%@include file="./inc/footer.jsp"%>
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
	<%@include file="./inc/footer_link.jsp"%>
</body>
</html>
