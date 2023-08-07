<%@page import="com.edu.teamproject.domain.Category"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<%-- <% List<Category> categoryList=(List)request.getAttribute("categoryList");%> --%>
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

<title>상품등록</title>

<!-- header_link -->
<%@include file="../inc/header_link.jsp"%>

<style type="text/css">
.box-style {
	width: 90px;
	height: 95px;
	border: 1px solid #ccc;
	display: inline-block;
	margin: 5px;
}

.box-style img {
	width: 90px;
	height: 90px;
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
								<h5 class="card-header">상품 등록</h5>
								<div class="card-body">
									<div class="mb-3 row">
										<label for="html5-text-input" class="col-md-2 col-form-label">종류</label>
										<div class="col-md-10">
 											<select  id="defaultSelect"  class="form-select" name="category_name">
												<option>선택▼</option>
													<option value="사료">사료</option>
													<option value="배변패드">배변패드</option>
													<option value="굿즈">굿즈</option>
											</select>
										</div>
									</div>
									
									<div class="mb-3 row">
										<label for="html5-text-input" class="col-md-2 col-form-label">상품 이름</label>
										<div class="col-md-10">
											<input class="form-control" type="text" placeholder="상품 이름 입력.." name="name">
										</div> 
									</div>
									
									<div class="mb-3 row">
										<label for="html5-text-input" class="col-md-2 col-form-label">가격</label>
										<div class="col-md-10">
											<input class="form-control" type="text" placeholder="상품 가격 입력.." name="price">
										</div> 
									</div>

									<div class="mb-3 row">
										<label for="html5-text-input" class="col-md-2 col-form-label">수량</label>
										<div class="col-md-10">
											<input class="form-control" type="number" placeholder="수량 입력.." name="EA">
										</div>
									</div>

									<div class="mb-3 row">
										<label for="html5-email-input" class="col-md-2 col-form-label">파일</label>
										<div class="col-md-10">
											<input class="form-control" type="file" name="file"
												id="file_find" style="display: none" multiple>
											<button type="button" class="btn rounded-pill btn-primary"
												id="bt_file">사진찾기</button>
										</div>
									</div>
									<div class="mb-3 row">
										<label for="html5-url-input" class="col-md-2 col-form-label"></label>

										<div class="col-md-10" align="left">
											<template v-for="json in imageList">
												<imagebox :key="json.key" :src="json.binary" :obj="json"
													:idx="json.key" />
											</template>
										</div>
									</div>

									<div class="mb-3 row">
										<div class="col-md-12">
											<textarea class="form-control" id="content" name="content"></textarea>
										</div>
									</div>

									<div>
										<button type="button" class="btn rounded-pill btn-primary"
											id="bt_regist">등록</button>
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
let app1;
let key=0;

const imagebox={
		template:`
			<div class="box-style">
				<div @click="delPic(p_idx)"><a href="#">X</a></div>
				<img :src="json.binary" />
			</div>
		`,
		props:['obj','idx'],
		data(){
			return{
				json:this.obj,
				p_idx:this.idx
			}	
		},
		methods:{
			delPic:function(idx){
				for(let a=0;a<app1.imageList.length;a++){
					let json=app1.imageList[a];
					if(json.key==idx){
						app1.imageList.splice(a,1);
					}
				}
			}
		}
}

function init(){
	app1 = new Vue({
		el:"#app1",
		components:{
			imagebox
		},
		data:{
			imageList:[]
		}
	});
}

// 중복된 사진 올라가지 않도록 하기 위한 메서드
function checkDuplicate(filename){
	let count=0;
	for(let a=0;a<app1.imageList.length;a++){
		let json=app1.imageList[a];
		if(json.name==filename){
			count++;
			break;
		}
	}
	return count;
}
/*-------------------------------------
	미리보기
----------------------------------------*/
function preview(files){
	console.log("file은", files);
	
	//이미지 화면에 출력
	for(let a=0;a<files.length;a++){
		let file=files[a];
		
		if(checkDuplicate(file.name)<1){
			let reader = new FileReader();  // 스트림 생성
			
			reader.onload=(e)=>{ //이미지 언제 다 읽었는지 알려주는 이벤트 지원 //안정성을 위해서 화살표함수로 바꿔줌
				
				key++;  // 사용자가 이미지를 선택할 때마다 1씩 증가하여 중복을 불허한다.
				
				//정보를 분석하여  json으로 바꾼다...
				let json=[]; // imageList배열에 복합적인 정보를담아놓기 위한 json
				
				json['key']=key; //추후 삭제시 기준값으로 사용..
				json['name']=file.name;     // 중복이미지가 추가되지 않도록
				json['binary']=e.target.result; // src에 대입할 바이너리 정보
				json['file']=file          //전송할 때 파라미터에 심을 파일
				
				app1.imageList.push(json);
			}
			reader.readAsDataURL(file); //파일을 읽어들임.
		}
	}
}
/*-------------------------------------
	등록
----------------------------------------*/
function regist(){
	let formData= new FormData(); //비어있는 폼을 하나 생성 파일을 넘기기 떄문에 비동기로 가야됨
	
 	formData.append("category_name", $("select[name='category_name']").val()); 
	formData.append("name", $("input[name='name']").val());
	formData.append("price", $("input[name='price']").val());
	formData.append("EA", $("input[name='EA']").val());
	formData.append("content", $("textarea[name='content']").val());
	
	for(let a=0;a<app1.imageList.length;a++){
		let json = app1.imageList[a];
		
		formData.append("productphoto", json.file);
	}
	
	$.ajax({
		url:"/admin/rest/product",
		type:"post",
		data:formData,
		processData:false,   // 쿼리스트링 사용여부
		contentType:false,    // application/x-www-form~~ 사용여부
		success:function(result, status, xhr){
			alert(result.msg);
			location.href="/admin/product/list";
		},
		error:function(xhr, status, err){
			console.log("xhr : ", xhr);
			console.log("status : ", status);
			console.log("err : ", err);
		}
	});
	
}

$(function(){
	init();
	
	$("#content").summernote({
		height:400
	});
	
	$("#bt_regist").click(function(){
		regist();
	});
	
	$("#bt_file").click(function(){
		$("#file_find").click();
	});
	
	//목록 버튼 눌렀을 때
	$("#bt_list").click(function(){
		location.href="/admin/product/list";
	})
	
	//파일에 이벤트 연결
	$("input[name='file']").change(function(){
		preview(this.files);
	});
	
});
</script>
</html>

