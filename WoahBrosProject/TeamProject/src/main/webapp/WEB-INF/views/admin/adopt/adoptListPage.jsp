<%@page import="com.edu.teamproject.util.PageManager"%>
<%@page import="com.edu.teamproject.domain.Adopt"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<% 
		PageManager pm = new PageManager();
		List<Adopt> adoptList=(List)request.getAttribute("adoptList");
		pm.init(adoptList, request);
		
		String category = (String)request.getAttribute("category");
		String keyword = (String)request.getAttribute("keyword");
%>
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

				<form id="form1">
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
							<select id="category" class="form-select color-dropdown" name="category">
								<option value="">선택▼</option>						
								<option value="type">종류</option>
								<option value="gender">성별</option>					
								<option value="name">이름</option>
								<option value="regdate">등록일</option>
								<option value="status">진행상태</option>
							</select>
						</div>
						<div class="col-1"></div>
	
						<div class=" navbar-nav-right d-flex align-items-center"
							id="navbar-collapse">
							<!-- Search -->
							<div class="col-10 navbar-nav align-items-center">
								<div class="nav-item d-flex align-items-center">
									<i class="bx bx-search fs-4 lh-0"></i> 
									<input type="text" class="form-control border-0 shadow-none" placeholder="Search..." aria-label="Search..." name="keyword"/>
								</div>
							</div>
	
							<div>
								<button type="button" id="bt_search" class="btn btn-primary d-block">검색</button>
							</div>
							<!-- /Search -->
	
						</div>
				</nav>
				<!-- / Navbar -->
							<input type="hidden" name="category1" value="<%=category%>" default="0">
							<input type="hidden" name="keyword1" value="<%=keyword%>" default="0">
				</form>  
				
				<!-- Content wrapper -->
				<div class="container">
					<div class="row">
						<!-- Content -->

						<div class="table-responsive text-nowrap">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>No</th>
										<th>종류</th>
										<th>이름</th>
										<th>등록일</th>
										<th>작성자</th>
										<th>진행상황</th>
									</tr>
								</thead>
								<tbody class="table-border-bottom-0">
								<%int curPos=pm.getCurPos(); %>
								<%int num=pm.getNum(); %>
								<%for(int a=0;a<pm.getPageSize();a++){ %>
								<%if(num<1)break; %>
								<% Adopt adopt = adoptList.get(curPos++); %>
									<tr>
										<td><i class="fab fa-angular fa-lg text-danger me-3"></i><strong><%=num-- %></strong></td>
										<td><%=adopt.getType() %></td>
										<td><a id="bt_detail" href="/admin/adopt/detail?adopt_idx=<%=adopt.getAdopt_idx() %>" name="name"><%=adopt.getName() %></a></td>
										<td><%= adopt.getRegdate().substring(0,10) %></td>
										<td>관리자</td>
										<%if(adopt.getStatus()==1){ %>
										<td><span class="badge bg-label-warning me-1">입양완료</span></td>
										<%} else{%>										
										<td><span class="badge bg-label-secondary me-1">입양중</span></td>
										<%} %>
									</tr>
								<%} %>
								</tbody>
								
							</table>
							
							<div class="demo-inline-spacing">
								<div class="row">
									<div class="col-sm-9">
										<nav aria-label="Page navigation">
											<ul class="pagination">
												<%if(pm.getTotalPage()<pm.getFirstPage()-1){ %>
												<li class="page-item prev"><a class="page-link"
													href="/admin/adopt/list?currentPage=<%=pm.getFirstPage()-1%>"><i
														class="tf-icon bx bx-chevron-left"></i></a></li>
												<%}else{ %>
													<li class="page-item prev"><a class="page-link"
													href="javascript:alert('이전페이지가 없습니다.')"><i
														class="tf-icon bx bx-chevron-left"></i></a></li>												
												<%} %>
												<%for(int a=pm.getFirstPage();a<=pm.getLastPage();  a++){ %>
												<%if(a>pm.getTotalPage())break; %>
												<li class="page-item <%if(a==pm.getCurrentPage()){ %>active<%}%>"><a class="page-link"
													href=" list?currentPage=<%=a%>"><%=a %></a></li>
												<%} %>
												
												<%if(pm.getTotalPage()> pm.getLastPage()+1){ %>
													<li class="page-item next"><a class="page-link"
														href="/admin/adopt/list?currentPage=<%=pm.getLastPage()+1%>"><i
															class="tf-icon bx bx-chevron-right"></i></a></li>
												<%} else { %>
														<li class="page-item next"><a class="page-link"
														href="javascript:alert('다음페이지가 없습니다.');"><i
															class="tf-icon bx bx-chevron-right"></i></a></li>
												<%} %>
											</ul>
										</nav>
									</div>
									<div class="col-sm-2">										
										<button type="button" class="btn btn-primary" id="bt_excell">엑셀출력</button>
										<button type="button" class="btn btn-primary" id="bt_regist">입양등록</button>
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
<script>
function getListBySearch(){
 	 $("#form1").attr({
		action:"/admin/adopt/search",
		method:"post"
	});
	$("#form1").submit();  
}

function PrevExcell(){
	console.log()
	 $("#form1").attr({
			action:"/admin/adopt/excell",
			method:"post"
		});
	$("#form1").submit();  
}

$(function(){
	$("#bt_regist").click(function(){
		location.href="/admin/adopt/registform";
	});
	
	$("#bt_search").click(function(){
		getListBySearch();
	});
	
	$("#bt_excell").click(function(){
		PrevExcell()
	});
});

</script>
</html>
