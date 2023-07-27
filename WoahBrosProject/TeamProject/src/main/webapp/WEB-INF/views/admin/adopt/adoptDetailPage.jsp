<%@page import="com.edu.teamproject.domain.AdoptImg"%>
<%@page import="com.edu.teamproject.domain.Adopt"%>
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

<title>Dashboard - Analytics | Sneat - Bootstrap 5 HTML Admin
	Template - Pro</title>

<!-- header_link -->
<%@include file="../inc/header_link.jsp"%>

<%
	Adopt adopt = (Adopt) request.getAttribute("adopt");
String path = (String) request.getAttribute("path");
System.out.println(adopt);
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
								<h5 class="card-header">입양 등록</h5>
								<div class="card-body">
								
									<input type="hidden" name="adopt_idx" value="<%=adopt.getAdopt_idx()%>" /> 
									<input type="hidden" name="status" value="<%=adopt.getStatus()%>" />
									<input type="hidden" name="adopt_idx" value="<%=adopt.getAdopt_idx()%>" />
									<input type="hidden" name="status" value="<%=adopt.getStatus()%>" />

									<div class="mb-3 row">
										<label for="html5-text-input" class="col-md-2 col-form-label">이름</label>
										<div class="col-md-10">
											<input class="form-control" type="text" name="name"
												value="<%=adopt.getName()%>" />
										</div>
									</div>

									<div class="mb-3 row">
										<label for="html5-text-input" class="col-md-2 col-form-label">성별</label>
										<div class="col-md-10">
											<select id="defaultSelect" class="form-select" name="gender">
												<option>선택▼</option>
												<option value="남" <%if (adopt.getGender().equals("남")) {%>
													selected <%}%>>남</option>
												<option value="여" <%if (adopt.getGender().equals("여")) {%>
													selected <%}%>>여</option>
											</select>
										</div>
									</div>

									<div class="mb-3 row">
										<label for="html5-text-input" class="col-md-2 col-form-label">종류</label>
										<div class="col-md-10">
											<select id="defaultSelect" class="form-select" name="type">
												<option>선택▼</option>
												<option value="개" <%if (adopt.getType().equals("개")) {%>
													selected <%}%>>개</option>
												<option value="고양이" <%if (adopt.getType().equals("고양이")) {%>
													selected <%}%>>고양이</option>
											</select>
										</div>
									</div>

									<div class="mb-3 row">
										<label for="html5-text-input" class="col-md-2 col-form-label">나이</label>
										<div class="col-md-10">
											<input class="form-control" type="number" name="age"
												value="<%=adopt.getAge()%>" />
										</div>
									</div>

									<div class="mb-3 row">
										<label for="html5-url-input" class="col-md-2 col-form-label"></label>

										<div class="col-md-10" align="left">

											<%for (AdoptImg adoptImg : adopt.getAdoptImgList()) {%>
											<div class="box-style">
												<img alt=""src="/resources/data/<%=adoptImg.getFilename()%>">
											</div>
											<%}%>

										</div>
									</div>

									<div class="mb-3 row">
										<div class="col-md-12">
											<textarea class="form-control" id="content" name="content"><%=adopt.getContent()%></textarea>
										</div>
									</div>

									<div>
										<button type="button" class="btn rounded-pill btn-primary"
											id="bt_edit">수정</button>
										<button type="button" class="btn rounded-pill btn-primary"
											id="bt_del">삭제</button>
										<button type="button" class="btn rounded-pill btn-primary"
											id="bt_list">목록</button>

										<% int status = adopt.getStatus(); %>
										<% if (status == 0) { %>
											<button type="button" class="btn rounded-pill btn-warning" id="bt_status">입양처리</button>
										<%} else {%>
											<button type="button" class="btn rounded-pill btn-secondary" id="bt_status">입양취소</button>
										<%}%>
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
	
	json['adopt_idx']=$("#form1 input[name='adopt_idx']").val();
	json['name']=$("#form1 input[name='name']").val();
	json['gender']=$("#form1 select[name='gender']").val();
	json['type']=$("#form1 select[name='type']").val();
	json['age']=$("#form1 input[name='age']").val();
	json['content']=$("#form1 textarea[name='content']").val();
	
	$.ajax({
		url:"/admin/rest/adopt",
		type:"put",
		contentType:"application/json;charset=utf-8", 
		data:JSON.stringify(json),
		processData:false, // 쿼리스트링화 여부
		success:function(result, status, xhr){
			alert(result.msg);
		},
		error:function(xhr, status, err){
			
		}
	});
}

function del(){
	$("#form1").attr({
		action:"/admin/adopt/del",
		method:"post"
	});
	$("#form1").submit();
}

function adoptStatusChange(){
	let json={};
	
	json['adopt_idx']=$("#form1 input[name='adopt_idx']").val();
	json['status']=$("#form1 input[name='status']").val();
	json['name']=$("#form1 input[name='name']").val();
	json['gender']=$("#form1 select[name='gender']").val();
	json['type']=$("#form1 select[name='type']").val();
	json['age']=$("#form1 input[name='age']").val();
	json['content']=$("#form1 textarea[name='content']").val();
	
	$.ajax({
		url:"/admin/rest/adopStatus",
		type:"put",
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(json),
		processData:false,
		success:function(result, status, xhr){
			alert(result.msg);	
			
			if($("#form1 input[name='status']").val()==0){
				$("#bt_status").removeClass( "btn rounded-pill btn-warning" ).addClass( "btn rounded-pill btn-secondary" ).text("입양취소");
				$("#form1 input[name='status']").val(1);
			}else{				
				$("#bt_status").removeClass( "btn rounded-pill btn-secondary" ).addClass( "btn rounded-pill btn-warning" ).text("입양처리");
				$("#form1 input[name='status']").val(0);
			}
		},
		error:function(xhr, status, err){
			
		}
	})
}

$(function(){
	
	$("#content").summernote({
		height:400
	});
	
	//수정버튼 눌렀을때
	$("#bt_edit").click(function(){
		if(confirm("입양정보를 수정하시겠습니까?")){
			edit();
		}
	})
	
	//삭제버튼 눌렀을때
	$("#bt_del").click(function(){
		if(confirm("입양정보를 삭제하시겠습니까?")){
			del();
		}
	});
	
	//목록 버튼 눌렀을 때
	$("#bt_list").click(function(){
		location.href="/admin/adopt/list";
	})

	//입양완료 버튼 눌렀을 때
	$("#bt_status").click(function(){
		if(confirm("입양처리 하시겠습니까?")){
			adoptStatusChange();
		}
	})

});
</script>
</html>
