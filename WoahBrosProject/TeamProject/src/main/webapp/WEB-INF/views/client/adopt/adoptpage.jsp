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
						<h1>입양페이지</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->
	<!-- contact form -->

	<!-- latest news -->
	<div class="latest-news mt-150 mb-150" id="app1">
		<div class="container">
			<div class="row">
				<template v-for="(adopt,i) in currentList">
					<row :key="i" :obj="adopt" />
				</template>
			</div>
		</div>

		<div class="row">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<div class="pagination-wrap">
							<ul id="paging-area"></ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- end latest news -->

	<!-- end contact form -->


	<!-- footer -->
	<%@include file="../inc/footer.jsp"%>

	<!-- footer_link -->
	<%@include file="../inc/footer_link.jsp"%>

</body>
<script type="text/javascript" src="/resources/js/Pager.js"></script>
<script type="text/javascript">
let pager = new Pager();  // 인스턴스 생성
let currentPage =1;
let totalCount=0;

let key=0;
let app1;

const row={
		template:`
			<div class="col-lg-4 col-md-6">
				<div class="single-latest-news">
					<a>
						<img :src="'/resources/data/'+adopt.adoptImgList[0].filename" style="width: 350px; height: 200px">
					</a>
					<div class="news-text-box">
						<h3>
							<a>{{adopt.name}}</a>
						</h3>
						<p class="blog-meta">
							<span class="author"><i class="fas fa-user"></i> Admin</span> <span
								class="date"><i class="fas fa-calendar"></i> {{adopt.regdate.substring(0,10)}}</span>
						</p>
						<p class="excerpt">종류 = {{adopt.type}} <br> 나이 = {{adopt.age}}</p>
						<a href="#" class="read-more-btn" v-on:click="getDetail(adopt.adopt_idx)" >read more <i
							class="fas fa-angle-right"></i></a>
					</div>
				</div>
			</div>
		`,
		props:['obj'],
		data(){
			return{
				adopt:this.obj
			}
		},
		methods:{
			getDetail(adopt_idx){
				location.href="/adopt/detail?adopt_idx="+adopt_idx
			}
		}
}

app1=new Vue({
	el:"#app1",
	components:{
		row
	},
	data:{
		count:3,
		adoptList:[],
		currentList:[],
		num:0
	}
});

function pageLink(list, page, size){
	
	//서버에서 가져온 데이터를 대상으로 펠이징 로직을 적용해보기
	pager.init(list, page, size);

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
	
	
	//넘겨받은 페이지 번호를 이용하여 해당페이지에 보여질 배열을 생성 후 
	//currentLst에 대입. (Vue의 변수인 currentList만 제어하면 디자인은 자동으로 변경)
	
	app1.currentList.splice(0, app1.currentList.length);  // 채우기전 비우고 넣기 쌓이는것을 막기위함.
	
	for(let a=pager.curPos; a<pager.curPos+pager.pageSize;a++){
		//num이 1보다 작아지면 멈춤
		if(pager.num<1)break;
		pager.num--;
		
		//전체배열에서 일부 배열로 옮겨 심기
		app1.currentList.push(app1.adoptList[a]);
	}
}

function getList(currentPage){
	$.ajax({
		url:"/rest/adopt",
		type:"post",
		success:function(result, status, xhr){
			app1.adoptList=result;
			
			pageLink(app1.adoptList, currentPage, 6);
			
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
	})
}

$(function(){
	getList(currentPage);
})


</script>

</html>