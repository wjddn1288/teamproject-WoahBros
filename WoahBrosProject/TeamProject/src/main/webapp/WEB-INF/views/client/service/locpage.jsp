<%@page import="com.edu.teamproject.domain.Shelter"%>
<%@page import="java.util.List"%>
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

<!-- vue -->
<script src="https://cdn.jsdelivr.net/npm/vue@2.7.14/dist/vue.js"></script>

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
						<h1>보호소 위치</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->
	<!-- contact form -->

	<div class="container" id="app1">

		<div class="row" style="padding: 30px">

			<div class="col-6" bg="yellow">
				<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
					<form class="form-inline" action="/action_page.php">
						<div class="col">
							<select id="category" class="form-control" name="category">
								<option value="">선택▼</option>
								<option value="type">지역</option>
								<option value="gender">이름</option>
							</select>
						</div>
						<div class="col">
							<input class="form-control mr-sm-2" type="text"
								placeholder="Search..">
						</div>
						<div class="col">
							<button class="btn btn-warning" type="button">Search</button>
						</div>
					</form>
				</nav>
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th>No</th>
							<th>지역</th>
							<th>이름</th>
							<th>전화번호</th>
						</tr>
					</thead>
					<tbody>
					
						<template v-for="(shelter, i) in shelterList">
							<shelter :key="shelter.shelter_idx" :num="num-i" :obj="shelter"/>
						</template>
						
					</tbody>
				</table>
				<div class="pagination-wrap" 	style="text-align: center; padding-bottom: 20px">
					<ul id="paging-area"></ul>
				</div>
			</div>
			<!-- <div class="col-6" style="background-color:yellow">맵나올 곳 </div> -->
			<div id="googleMap" style="width: 50%;height: 680px;"></div>
		</div>

	</div>

	<!-- end contact form -->


	<!-- footer -->
	<%@include file="../inc/footer.jsp"%>

	<!-- footer_link -->
	<%@include file="../inc/footer_link.jsp"%>

</body>
<script type="text/javascript" src="/resources/js/Pager.js"></script>
<script>
let pager = new Pager();  // 인스턴스 생성
let currentPage = 1; // 현재 보고 있는 페이지
let totalCount=0;

let key=0;
let app1;

let lati=37.556449;
let lngi=126.945195;

const shelter={
		template:`
			<tr>
				<td>{{n}}</td>
				<td>{{shelter.loc}}</td>
				<td><a href="#" v-on:click="setLoc(shelter.lat,shelter.lng)">{{shelter.name}}</a></td>
				<td>{{shelter.phone}}</td>
			</tr>
		`,
		props:['obj','num'],
		data(){
			return{
				shelter:this.obj,
				n:this.num
			} 
		},
		methods:{
			setLoc(a, b){
				lati=a;
				lngi=b;
				
				if(lati>1 && lngi>1){
					myMap();
				}else{
					alert("위치가 등록되지 않은 보호소입니다.");
				}
			}
		}
}

app1 = new Vue({
	el:"#app1",
	components:{
		shelter
	},
	data:{
		shelterList:[],
		currentList:[],
		num:0,
	}
});



function pageLink(totalCount, n){
	
	//서버에서 가져온 데이터를 대상으로 펠이징 로직을 적용해보기
	pager.init(totalCount, n);

	console.log("totalRecord=",  pager.totalRecord);
	console.log("pageSize=",  pager.pageSize);
	console.log("totalPage=",  pager.totalPage);
	console.log("blockSize=",  pager.blockSize);
	console.log("currentPage=",  pager.currentPage);
	console.log("firstPage=",  pager.firstPage);
	console.log("lastPage=",  pager.lastPage);
	console.log("curPos=",  pager.curPos);
	console.log("num=",  pager.num);
	
	app1.num = pager.num;
	
	currentPage=pager.currentPage;
	
	//넘겨받은 페이지 번호를 이용하여 해당페이지에 보여질 배열을 생성 후 
	//currentLst에 대입. (Vue의 변수인 currentList만 제어하면 디자인은 자동으로 변경)
	
	if(app1.currentList.length<1){
		console.log("app1.currentList 지워지기 전 :"+app1.currentList[0]);
	}else{
		console.log("app1.currentList 지워지기 전 :"+app1.currentList[0].loc);		
	}
	
	app1.currentList.splice(0, app1.currentList.length);  // 채우기전 비우고 넣기 쌓이는것을 막기위함.
	
	
	let index=0;
	
	for(let a=pager.curPos; a<pager.curPos+pager.pageSize;a++){
		
		index++;	
		
		//num이 1보다 작아지면 멈춤
		if(pager.num<1)break;
		pager.num--;
				
		//전체배열에서 일부 배열로 옮겨 심기
		app1.currentList.push(app1.shelterList[index]);
	}
	
	//getList();

}

function getList(page){
	$.ajax({
		url:"/rest/loc?currentPage="+page,
		type:"get",
		success:function(result, status, xhr){
			app1.shelterList=result.shelterList;
			//int result=result.totalCount;
			totalCount=result.totalCount;
			
			pageLink(totalCount, page);
			
			$("#paging-area").empty();
			
			if(pager.firstPage-1>1){
				$("#paging-area").append("<li><a href='javascript:getList("+(pager.firstPage-1)+")'>Prev</a></li>");				
			}else{
				$("#paging-area").append("<li><a href='javascript:alert(\"이전페이지가 없습니다.\")''>Prev</a></li>");
			}
			
			
			for(let a=pager.firstPage;a<=pager.lastPage;a++){
				if(a >pager.totalPage)break;
				if(a==pager.currentPage){
					$("#paging-area").append("<li><a class='active' href='javascript:getList("+a+")'>"+a+"</a></li>");
				}else{
					$("#paging-area").append("<li><a href='javascript:getList("+a+")'>"+a+"</a></li>");
				}
			}
			
			if(pager.totalPage>=pager.lastPage+1){					
				$("#paging-area").append("<li><a href='javascript:getList("+(pager.lastPage+1)+")'>Next</a></li>");		
			}else{
				$("#paging-area").append("<li><a href='javascript:alert(\"다음페이지가 없습니다.\")'>Next</a></li>");
			}
			
		}
	});	
}


$(function(){
	getList(currentPage);
});

/*---------------------------------------------------------------------------------------------------------*/

//구글맵 API
function myMap(){
   var cityHall = {lat: lati, lng: lngi}; 
 
   var mapOptions = { 
         center:cityHall,
         zoom:16
   };

   var map = new google.maps.Map( 
          document.getElementById("googleMap") 
         , mapOptions );
   
   var marker = new google.maps.Marker({position: cityHall, map: map});
}
</script> 
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA7KFV2t85lCBJQZqCV9wsnFMn3g_njebw&callback=myMap"></script>
</html>