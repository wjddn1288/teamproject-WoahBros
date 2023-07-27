<%@page import="com.edu.teamproject.util.PageManager"%>
<%@page import="com.edu.teamproject.domain.Campaign"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
	List<Campaign> campaignList = (List)request.getAttribute("campaignList");
	PageManager pm = new PageManager();
	pm.init(campaignList, request);
%>
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
						<h1>공모사업 게시판</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->
	<!-- contact form -->

	<div class="container" style="padding-top: 20px">
		<form id="form1">
			<div class="row-md-12">
				<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
						<div class="col-2">
							<select id="category" class="form-control" name="category">
								<option value="">선택▼</option>			
								<option value="title">제목</option>					
								<option value="writer">작성자</option>
								<option value="regdate">작성일</option>
							</select>
						</div>
						<div class="col-9">
							<input class="form-control mr-sm-2" type="text" placeholder="Search.." id="keyword" name="keyword">
						</div>
						<div class="col-1">
							<button class="btn btn-warning" type="button" id="bt_search">Search</button>
						</div>
				</nav>
			</div>

			<div class="row-md-12">
				<table class="table" style="border: 1px solid; text-align: center">
					<thead class="thead-dark">
						<tr>
							<th width="20%">No</th>
							<th width="35%">제목</th>
							<th width="20%">작성자</th>
							<th width="10%">작성일</th>
							<th width="15%">조회수</th>
						</tr>
					</thead>
					<tbody>
						<%int curPos=pm.getCurPos(); %>
						<%int num=pm.getNum(); %>					
						<%for(int a=0;a<pm.getPageSize();a++){ %>
						<%if(num<1)break; %>						
						<%Campaign campaign=campaignList.get(curPos++); %>
						<tr>
							<td><%=num-- %></td>
							<td>
								<a href="/campaign/detail?campaign_idx=<%=campaign.getCampaign_idx()%>">
									<%=campaign.getTitle() %>
								</a>
							</td>
							<td><%=campaign.getAuthor() %></td>
							<td><%=campaign.getRegdate().substring(0,10) %></td>
							<td><%=campaign.getHit() %></td>
						</tr>
						<%} %>
						
					</tbody>
				</table>
			</div>
			<div class="row">
				<div class="col-10 pagination-wrap"
					style="text-align: center; padding-bottom: 20px">
					<ul>
						<%if(pm.getTotalPage()<pm.getFirstPage()-1){ %>
							<li><a href="/campaign/list?currentPage=<%=pm.getFirstPage()-1%>">Prev</a></li>
						<%}else{ %>
							<li><a href="javascript:alert('이전페이지가 없습니다.')">Prev</a></li>
						<%} %>
						
						<%for(int a=pm.getFirstPage();a<=pm.getLastPage();  a++){ %>
						<%if(a>pm.getTotalPage())break; %>
						<li  class="page-item <%if(a==pm.getCurrentPage()){ %>active<%}%>">
						 <a href="/campaign?currentPage=<%=a%>"><%=a %></a></li>
						<%} %>
						
						<%if(pm.getTotalPage()> pm.getLastPage()+1){ %>
							<li><a href="/admin/adopt/list?currentPage=<%=pm.getLastPage()+1%>">Next</a></li>
						<%}else{ %>
							<li><a href="javascript:alert('다음페이지가 없습니다.')">Next</a></li>
						<%} %>
						
					</ul>
				</div>
				<div col="col-2" style="margin: auto">
					<button type="button" class="btn btn-warning" id="bt_regist">글등록</button>
				</div>
			</div>

		</form>
	</div>

	<!-- end contact form -->


	<!-- footer -->
	<%@include file="../inc/footer.jsp" %>
	
	<!-- footer_link -->
	<%@include file="../inc/footer_link.jsp" %>
	
</body>
<script type="text/javascript">

function getListBySearch(){
	$("#form1").attr({
		action:"/campaign/search",
		method:"post"
	});
	$("#form1").submit();
}

$(function(){
	$("#bt_search").click(function(){
		getListBySearch();
	});
	
	$("#bt_regist").click(function(){
		location.href="/info/registform";			
	});
});
</script>
   
</html>