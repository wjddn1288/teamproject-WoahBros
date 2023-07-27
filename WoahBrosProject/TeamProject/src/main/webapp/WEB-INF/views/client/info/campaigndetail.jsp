<%@page import="com.edu.teamproject.domain.Campaign"%>
<%@page import="com.edu.teamproject.domain.Member"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
	Campaign campaign= (Campaign)request.getAttribute("campaign");
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
<title>AnimalFair</title>

<!-- header_link -->

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
						<h1>공모사업 게시판</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->
	<!-- contact form -->

	<div class="container">

		<div id="collapseOne" class="collapse show"
			aria-labelledby="headingOne" data-parent="#accordionExample" style="">
			<div class="card-body">
				<div class="billing-address-form">
					<form id="form1">
							<input type="hidden" name="campaign_idx" value="<%=campaign.getCampaign_idx()%>">
						<p>
							<input type="text" name="title" value="<%=campaign.getTitle()%>">
						</p>
						<p>
							<input type="text" name="writer" value="<%=campaign.getAuthor() %>" readonly="readonly">
						</p>
						<p>
							<textarea id="content" name="content"><%=campaign.getContent() %></textarea>
						</p>
					</form>
					<div style="text-align: center; padding-top: 30px">
						<%if(member.getId().equals(campaign.getMember().getId())){ %>
							<button type="button" class="btn btn-warning btn-lg" id="bt_edit">수정</button>
							<button type="button" class="btn btn-warning btn-lg" id="bt_del">삭제</button>
							<button type="button" class="btn btn-warning btn-lg" id="bt_list">목록</button>
						<%}else{ %>
							<button type="button" class="btn btn-warning btn-lg" id="bt_list">목록</button>
						<%} %>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- end contact form -->


	<!-- footer -->
	<%@include file="../inc/footer.jsp"%>

	<!-- footer_link -->
	<%@include file="../inc/footer_link.jsp"%>

</body>

<script type="text/javascript">
function edit(){
	let json ={};
	
	json['campaign_idx']=$("#form1 input[name='campaign_idx']").val();
	json['title']=$("#form1 input[name='title']").val();
	json['writer']=$("#form1 input[name='writer']").val();
	json['content']=$("#form1 textarea[name='content']").val();
	
	$.ajax({
		url:"/rest/campaign",
		type:"put",
		contentType:"application/json;charset=utf-8", 
		data:JSON.stringify(json),
		processData:false,   // 쿼리스트링 사용여부
		success:function(result, status, xhr){
			alert(result.msg);
			location.href="/campaign";
		}
	});
}

function del(){
	$("#form1").attr({
		action:"/campaign/del",
		method:"post"
	});
	$("#form1").submit();
}

$(function() {

	$("#content").summernote({
		height : 400
	});
	
	$("#bt_edit").click(function(){
		if(confirm("해당 게시물을 수정하시겠습니까?")){
			edit();
		}
	});
	
	$("#bt_list").click(function(){
		location.href = "/campaign";
	});
	
	$("#bt_del").click(function(){
		if(confirm("해당 게시물을 삭제하시겠습니까?")){
			del();
		}
	});

});
</script>

</html>
