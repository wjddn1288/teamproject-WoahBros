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

<!-- 결제 api -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 아래 제이쿼리는 1.0이상이면 원하는 버전을 사용하셔도 무방합니다. -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- 토스 -->
<script src="https://js.tosspayments.com/v1/payment-widget"></script>


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
						<h1>후원페이지</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->

	<!-- contact form -->

	<div class="feature-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-7">
					<div class="featured-text">
						<h2 class="pb-3">
							왜 <span class="orange-text">"UnderDog"인가요?</span>
						</h2>
						<div class="row">
							<div class="col-lg-6 col-md-6 mb-4 mb-md-5">
								<div class="list-box d-flex">
									<div class="list-icon">
										<i class="fas fa-shipping-fast"></i>
									</div>
									<div class="content">
										<h3>Home Delivery</h3>
										<p>sit voluptatem accusantium dolore mque laudantium,
											totam rem aperiam, eaque ipsa quae ab illo.</p>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 mb-5 mb-md-5">
								<div class="list-box d-flex">
									<div class="list-icon">
										<i class="fas fa-money-bill-alt"></i>
									</div>
									<div class="content">
										<h3>Best Price</h3>
										<p>sit voluptatem accusantium dolore mque laudantium,
											totam rem aperiam, eaque ipsa quae ab illo.</p>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 mb-5 mb-md-5">
								<div class="list-box d-flex">
									<div class="list-icon">
										<i class="fas fa-briefcase"></i>
									</div>
									<div class="content">
										<h3>Custom Box</h3>
										<p>sit voluptatem accusantium dolore mque laudantium,
											totam rem aperiam, eaque ipsa quae ab illo.</p>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-md-6">
								<div class="list-box d-flex">
									<div class="list-icon">
										<i class="fas fa-sync-alt"></i>
									</div>
									<div class="content">
										<h3>Quick Refund</h3>
										<p>sit voluptatem accusantium dolore mque laudantium,
											totam rem aperiam, eaque ipsa quae ab illo.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end featured section -->

	<!-- team section -->
	<div class="mt-150">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="section-title">
						<h3>
							우리가 <span class="orange-text">하는일</span>
						</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Aliquid, fuga quas itaque eveniet beatae optio.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<div class="single-team-item">
						<div class="team-bg team-bg-1"></div>
						<h4>
							Jimmy Doe <span>Farmer</span>
						</h4>
						<ul class="social-link-team">
							<li><a href="#" target="_blank"><i
									class="fab fa-facebook-f"></i></a></li>
							<li><a href="#" target="_blank"><i
									class="fab fa-twitter"></i></a></li>
							<li><a href="#" target="_blank"><i
									class="fab fa-instagram"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single-team-item">
						<div class="team-bg team-bg-2"></div>
						<h4>
							Marry Doe <span>Farmer</span>
						</h4>
						<ul class="social-link-team">
							<li><a href="#" target="_blank"><i
									class="fab fa-facebook-f"></i></a></li>
							<li><a href="#" target="_blank"><i
									class="fab fa-twitter"></i></a></li>
							<li><a href="#" target="_blank"><i
									class="fab fa-instagram"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 offset-md-3 offset-lg-0">
					<div class="single-team-item">
						<div class="team-bg team-bg-3"></div>
						<h4>
							Simon Joe <span>Farmer</span>
						</h4>
						<ul class="social-link-team">
							<li><a href="#" target="_blank"><i
									class="fab fa-facebook-f"></i></a></li>
							<li><a href="#" target="_blank"><i
									class="fab fa-twitter"></i></a></li>
							<li><a href="#" target="_blank"><i
									class="fab fa-instagram"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end team section -->
	
	<!-- shop banner -->
	<section class="shop-banner">
		<div class="container">
			<h3>
				후원통해<br>  외로운 아이들을  <span class="orange-text">도와주세요</span>
			</h3>
			<div class="sale-percent">
				<span class="white-text">싸다! <br> 단돈
				</span>100원 <span></span>
			</div>
			<a class="cart-btn btn-lg" id="bt_donate">후원하기</a>
			 <!-- 토스 결제위젯, 이용약관 영역 -->
			<div id="payment-method"></div>
			<div id="agreement"></div>
			<!-- 결제하기 버튼 -->
			<button id="payment-button">toss</button>
			<script>
			  const clientKey = "test_ck_jkYG57Eba3GegBwRPEQrpWDOxmA1"
			  const customerKey = "vfr-Pud8QZBDVQ-l_cOHV" // 내 상점의 고객을 식별하는 고유한 키
			  const button = document.getElementById("payment-button")
			
			  // ------  결제위젯 초기화 ------ 
			  // 비회원 결제에는 customerKey 대신 ANONYMOUS를 사용하세요.
			  const paymentWidget = PaymentWidget(clientKey, customerKey) // 회원 결제
			  // const paymentWidget = PaymentWidget(clientKey, PaymentWidget.ANONYMOUS) // 비회원 결제
			
	/* 		  // ------  결제위젯 렌더링 ------ 
			  // 결제수단 UI를 렌더링할 위치를 지정합니다. `#payment-method`와 같은 CSS 선택자와 결제 금액 객체를 추가하세요.
			  // https://docs.tosspayments.com/reference/widget-sdk#renderpaymentmethods선택자-결제-금액-옵션
			  paymentWidget.renderPaymentMethods("#payment-method", { value: 15_000 }) */
			
			  // ------ '결제하기' 버튼 누르면 결제창 띄우기 ------
			  // 더 많은 결제 정보 파라미터는 결제위젯 SDK에서 확인하세요.
			  // https://docs.tosspayments.com/reference/widget-sdk#requestpayment결제-정보
			  button.addEventListener("click", function () {
			    paymentWidget.requestPayment({
			      amount:100,
			      orderId: "donate",            // 주문 ID(직접 만들어주세요)
			      orderName: "후원하기",                 // 주문명
			      successUrl: "http://localhost:7777/afterLog",  // 결제에 성공하면 이동하는 페이지(직접 만들어주세요)
			      failUrl: "http://localhost:7777/donate",        // 결제에 실패하면 이동하는 페이지(직접 만들어주세요)
			      customerEmail: "wjddn7728@gmail.com",
			      customerName: "김토스"
			    })
			  })
			</script>
		</div>
	</section>
	<!-- end shop banner -->


	<!-- end contact form -->


	<!-- footer -->
	<%@include file="../inc/footer.jsp"%>

	<!-- footer_link -->
	<%@include file="../inc/footer_link.jsp"%>

</body>
<script type="text/javascript">

function regist(price){
    let json={
    		member:{
    				member_idx:<%=member.getMember_idx()%>
    				},
    		price:price
    };
    
    $.ajax({
    	url:"/rest/donate",
    	type:"post",
    	contentType:"application/json;charset=utf-8",
    	data:JSON.stringify(json),
		processData:false, // 쿼리스트링화 여부
    	success:function(result, status, xhr){
    		
    	}
    })
}

function iamport(){
	//가맹점 식별코드
	IMP.init('imp61633154');
	IMP.request_pay({
	    pg : 'kcp',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '일시후원' , //결제창에서 보여질 이름
	    amount : 100, //실제 결제되는 가격
	    buyer_email : "<%=member.getEmail()%>",
	    buyer_name : "<%=member.getName()%>"
	}, function(rsp) {
		console.log(rsp);
	    if ( rsp.success ) {
	    	var msg = '결제가 완료되었습니다.';
	    	/*
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        */
			regist(rsp.paid_amount);
	        
	    } else {
	    	 var msg = '결제에 실패하였습니다.';
	         msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
}
$(function(){
	$("#bt_donate").click(function(){
		iamport();
	});
});

</script>
</html>