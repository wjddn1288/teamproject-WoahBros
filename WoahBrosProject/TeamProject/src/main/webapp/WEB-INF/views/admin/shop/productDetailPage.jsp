<%@page import="com.edu.teamproject.domain.ProductImg"%>
<%@page import="com.edu.teamproject.domain.Product"%>
<%@page import="com.edu.teamproject.domain.Category"%>
<%@ page contentType="text/html;charset=UTF-8"%>
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

<title>상품 상세보기</title>

<!-- header_link -->
<%@include file="../inc/header_link.jsp"%>

<%
	Product product = (Product) request.getAttribute("product");
	Category category = (Category) request.getAttribute("category");
	String path = (String) request.getAttribute("path");
	System.out.println(product);
	System.out.println(category);
%>

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
		<div class="layout-container" id="app1">
			<!-- Menu -->

			<%@include file="../inc/menu.jsp"%>

			<div class="container">
				<div class="row">
					<div class="layout-page" align="center">
						<form id="form1">
							<div class="card mb-4">
								<h5 class="card-header">상품 상세보기</h5>
								<div class="card-body">

									<input type="hidden" name="product_idx" value="<%=product.getProduct_idx()%>" />
									<%-- <input type="hidden" name="category_idx" value="<%=category.getCategory_idx()%>" /> --%>
									
									<div class="mb-3 row">
										<label for="html5-text-input" class="col-md-2 col-form-label">상품 이름</label>
										<div class="col-md-10">
											<input class="form-control" type="text" name="name"
												value="<%=product.getName()%>" />
										</div>
									</div>

									<div class="mb-3 row">
										<label for="html5-text-input" class="col-md-2 col-form-label">카테고리</label>
										<div class="col-md-10">
											<select id="defaultSelect" class="form-select"
												name="category_name">
												<option>선택▼</option>
												<option value="사료"
													<%if (category.getCategory_name().equals("사료")) {%> 
														selected <%}%>>사료</option>
												<option value="배변패드" <%if (category.getCategory_name().equals("배변패드")) {%> 
														selected <%}%>>배변패드</option>
												<option value="굿즈" <%if (category.getCategory_name().equals("굿즈")) {%> 
														selected <%}%>>굿즈</option>
											</select>
										</div>
									</div>

									<div class="mb-3 row">
										<label for="html5-text-input" class="col-md-2 col-form-label">가격</label>
										<div class="col-md-10">
											<input class="form-control" type="number" name="price"
												value="<%=product.getPrice()%>" />
										</div>
									</div>

									<div class="mb-3 row">
										<label for="html5-url-input" class="col-md-2 col-form-label"></label>
										<div class="col-md-10" align="left">
											<%for (ProductImg productImg : product.getProductImgList()) {%>
											<div class="box-style">
												<img alt=""src="/resources/admin/productdata/<%=productImg.getFilename()%>">
											</div>
											<%}%>
											
										</div>
									</div>

									<div class="mb-3 row">
										<div class="col-md-12">
											<textarea class="form-control" id="content" name="content"><%=product.getContent()%></textarea>
										</div>
									</div>

									<div>
										<button type="button" class="btn rounded-pill btn-primary"
											id="bt_edit">수정</button>
										<button type="button" class="btn rounded-pill btn-primary"
											id="bt_del">삭제</button>
										<button type="button" class="btn rounded-pill btn-primary"
											id="bt_list">목록</button>
									</div>
								</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	</div>
	<%@include file="../inc/footer_link.jsp"%>
</body>

<
<script type="text/javascript">
	//form 은 Post, Get만 지원... 해결책) json으로 전송...
	 function edit(){
	 let json={};
	
	 json['product_idx']=$("#form1 input[name='product_idx']").val();
	 json['category_name']=$("#form1 select[name='category_name']").val();
	 json['name']=$("#form1 input[name='name']").val();
	 json['price']=$("#form1 input[name='price']").val();
	 json['EA']=$("#form1 input[name='EA']").val();
	 json['content']=$("#form1 textarea[name='content']").val();
	

	$.ajax({
			url : "/admin/rest/product",
			type : "put",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(json),
			processData : false, // 쿼리스트링화 여부
			success : function(result, status, xhr) {
				alert(result.msg);
			},
			error : function(xhr, status, err) {

			}
		});
	}

	function del() {
		$("#form1").attr({
			action : "/admin/product/del",
			method : "post"
		});
		$("#form1").submit();
	}

	$(function() {

		$("#content").summernote({
			height : 400
		});

		//수정버튼 눌렀을때
		$("#bt_edit").click(function() {
			if (confirm("상품을 수정하시겠습니까?")) {
				edit();
			}
		})

		//삭제버튼 눌렀을때
		$("#bt_del").click(function() {
			if (confirm("상품을 삭제하시겠습니까?")) {
				del();
			}
		});

		//목록 버튼 눌렀을 때
		$("#bt_list").click(function() {
			location.href = "/admin/product/list";
		})

	});
</script>
</html>
