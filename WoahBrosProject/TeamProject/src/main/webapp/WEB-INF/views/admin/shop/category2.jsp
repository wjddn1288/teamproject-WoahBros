<%@page import="com.edu.teamproject.util.PageManager"%>
<%@page import="com.edu.teamproject.domain.Category"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
	List<Category> categoryList = (List) request.getAttribute("categoryList");
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
<%@include file="../inc/header_link.jsp"%>

<style type="text/css">
.box-style {
	width: 150px;
	height: 150px;
	border: 1px solid #ccc;
	display: inline-block;
	margin: 5px;
}

.box-style img {
	width: 150px;
	height: 150px;
}
</style>

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

					<div class="navbar-nav-right d-flex align-items-center"
						id="navbar-collapse">
						<!-- Search -->
						<div class="navbar-nav align-items-center">
							<div class="nav-item d-flex align-items-center">
								<i class="bx bx-search fs-4 lh-0"></i> <input type="text"
									class="form-control border-0 shadow-none"
									placeholder="Search..." aria-label="Search..." />
							</div>
						</div>
						<!-- /Search -->

						<ul class="navbar-nav flex-row align-items-center ms-auto">
							<!-- Place this tag where you want the button to render. -->
							<li class="nav-item lh-1 me-3"><a class="github-button"
								href="https://github.com/themeselection/sneat-html-admin-template-free"
								data-icon="octicon-star" data-size="large"
								data-show-count="true"
								aria-label="Star themeselection/sneat-html-admin-template-free on GitHub">Star</a>
							</li>

							<!-- User -->
							<li class="nav-item navbar-dropdown dropdown-user dropdown">
								<a class="nav-link dropdown-toggle hide-arrow"
								href="javascript:void(0);" data-bs-toggle="dropdown">
									<div class="avatar avatar-online">
										<img src="/resources/admin/assets/img/avatars/1.png" alt
											class="w-px-40 h-auto rounded-circle" />
									</div>
							</a>
								<ul class="dropdown-menu dropdown-menu-end">
									<li><a class="dropdown-item" href="#">
											<div class="d-flex">
												<div class="flex-shrink-0 me-3">
													<div class="avatar avatar-online">
														<img src="/resources/admin/assets/img/avatars/1.png" alt
															class="w-px-40 h-auto rounded-circle" />
													</div>
												</div>
												<div class="flex-grow-1">
													<span class="fw-semibold d-block">John Doe</span> <small
														class="text-muted">Admin</small>
												</div>
											</div>
									</a></li>
									<li>
										<div class="dropdown-divider"></div>
									</li>
									<li><a class="dropdown-item" href="#"> <i
											class="bx bx-user me-2"></i> <span class="align-middle">My
												Profile</span>
									</a></li>
									<li><a class="dropdown-item" href="#"> <i
											class="bx bx-cog me-2"></i> <span class="align-middle">Settings</span>
									</a></li>
									<li><a class="dropdown-item" href="#"> <span
											class="d-flex align-items-center align-middle"> <i
												class="flex-shrink-0 bx bx-credit-card me-2"></i> <span
												class="flex-grow-1 align-middle">Billing</span> <span
												class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20">4</span>
										</span>
									</a></li>
									<li>
										<div class="dropdown-divider"></div>
									</li>
									<li><a class="dropdown-item" href="auth-login-basic.html">
											<i class="bx bx-power-off me-2"></i> <span
											class="align-middle">Log Out</span>
									</a></li>
								</ul>
							</li>
							<!--/ User -->
						</ul>
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
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
									</tr>
								</thead>
								<tbody class="table-border-bottom-0">
									<% for (int a = 0; a < categoryList.size(); a++) { %>
									<% Category category = categoryList.get(a); %>
									<tr>
										<td><%=category.getCategory_idx()%></td>
										<td><%=category.getCategory_name()%></td>
									<%}%>
								</tbody>
							</table>
							
							<div class="demo-inline-spacing">
								<div class="row">
									<div class="col-sm-10">
										<nav aria-label="Page navigation">
											<ul class="pagination"></ul>
										</nav>
									</div>
									<div class="col-sm-2">	
										<button type="button" class="btn btn-primary" id="bt_regist">등록</button>
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
	<script type="text/javascript">
let app1;
let selectedRow; //현재 선택된 Row 컴포넌트. 

const row={
	template:`
      <tr>
        <td>{{category.category_idx}}</td>
        <td @click="getDetail(category)"><a href="#">{{category.category_name}}</a></td>
      </tr>				
	`,
	props:["obj"],
	data(){
		return{
			category:this.obj
		};		
	},
	methods:{
		getDetail:function(category){
			$("#form2 input[name='category_idx']").val(category.category_idx);
			$("#form2 input[name='category_name']").val(category.category_name);
			
			console.log(this); //상세보기 누를때 각종 데이터가 들어가있구나~
			selectedRow(this);
		}
	}
};

app1=new Vue({
	el:"#app1",
	components:{
		row
	},
	data:{
		count:10,
		categoryList:[]
	}
});

function regist() {
	$.ajax({
		url:"/admin/rest/category",
		type:"post",
		data:{
			category_name:$("input[name='category_name']").val()
		},
		//서버로부터 전송된 HTTP 응답 헤더 정보가 성공일때 반응
		success:function(result, status, xhr){
			//alert(result.msg); //{code:, msg:"성공"}
			getCategoryList();
		},
		//서버로부터 전송된 HTTP 응답 헤더 정보가 실패일때 반응
		error:function(xhr, status, err){
			alert("에러에요"+err);
		}
	});
}
//비동기 방식의 수정 요청
function editAsync() {
	if(!confirm("수정하시겠습니까?")){
		return; //삭제 안한다고 하면 밑에 못지나가게 
	}
	
	//전송 데이터를 ajax 형식으로 변환
	let json={};
	json['category_idx']=$("#form2 input[name='category_idx']").val();
	json['category_name']=$("#form2 input[name='category_name']").val();
	
	$.ajax({
		url:"/admin/rest/category",
		type:"put",		
		contentType:"application/json;charset=utf-8", //header 정보 구성
		//웹상의 데이터 교환시 데이터 형식은 무조건, 문자열이 되어야 한다.
		//따라서 자바스크립트 내장객체인 json 자체는 전송대상이 될수 없다.
		data:JSON.stringify(json), //body 정보구성
		processData:false, //쿼리스트링화 여부
		success:function(result, status, xhr){
			console.log(result);
			selectedRow.category=json;
		},
		error:function(xhr, status, err){
			
		}
	});
	
//비동기 삭제
function delAsync() {
	if(!confirm("삭제하시겠습니까?")){
		return; 
	}
	
	$.ajax({
		url:"/admin/rest/category/"+$("#form2 input[name='category_idx']").val(),
		type:"delete",
		success:function(result, status, xhr){
			getCategoryList();
		},		
		error:function(xhr, status, err){
			
		}		
	});
}

function getCategoryList() {
	$.ajax({
		url:"/admin/rest/category",
		type:"get",
		success:function(result, status, xhr){
			app1.categoryList=result;
		}
	});
}

$(function(){	
	//비동기로 카테고리 목록 가져오기
	getCategoryList();
	
	$("#bt_regist").click(function(){
		regist();
	});			
	$("#bt_edit").click(function(){
		//edit();
		editAsync();
	});			
	$("#bt_del").click(function(){
		delAsync();
	});			
});	

</script>
</body>
</html>
