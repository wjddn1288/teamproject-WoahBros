<%@page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

	<!-- title -->
	<title>합치기테스트</title>
	
<style>
	.chartBox {
		 width:400px; 
	}
</style> 
	<!-- header_link -->
	<%@include file="./inc/header_link.jsp" %>

<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js"></script>


<!-- 그래프 막대 표시 CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-datalabels/2.2.0/chartjs-plugin-datalabels.min.js" 
		   integrity="sha512-JPcRR8yFa8mmCsfrw4TNte1ZvF1e3+1SdGMslZvmrzDYxS69J7J49vkFL8u6u8PlPJK+H3voElBtUCzaXj+6ig==" 
		   crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</head>
<body>
	
	<!-- preloader -->
	<%@include file="./inc/preloader.jsp" %>
	
	<!-- header -->
	<%@include file="./inc/header.jsp" %>

	<!-- contact form -->

<!-- 그래프 들어갈 곳-->

	<h5>내용 나올곳</h5>
	<div id="container">
		<div class="row">
			 <h2><span>전국</span><span>모든지역</span>&nbsp;유기동물 현황</h2>
			 <div class="chartBox">
				<canvas id="myChart"></canvas>
			 </div>
		</div>
			<h3>2022년 06월 01일 ~ 2023년 03월 12일</h3>
			<div>
				<canvas id="chart" width="400" height="300"></canvas>
			</div>
	 </div>

	 <!-- 그래프 끝나는 곳 -->

	<!-- end contact form -->


	<!-- footer -->
	<%@include file="./inc/footer.jsp" %>
	
	<!-- footer_link -->
	<%@include file="./inc/footer_link.jsp" %>
	
</body>
			 
<!-- <canvas id="myChart" width="400" height="400"></canvas> -->
<!-- 도넛 그래프 -->
<script>
	const datapoints =['보호중', '입양', '반환', '자연사', '안락사', '방사', '기증'];
	const data ={
	        labels: datapoints,
	        datasets: [{
	            label: '마리',
	            data: [13877, 21332, 10687, 23358, 13421, 1362, 2100],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)',
	                'rgba(204,153,051, 0.3)',
	                'transparent'
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)',
	                'rgba(204,153,051, 0.3)',
	                'transparent'
	            ],
	            borderWidth: 1,
	            cutout: '90%',
	          /*   borderRadius:8 */
	        }]		
	};
	
	const counter = {
			id: 'counter',
			beforeDraw(chart, args, options){
				const {ctx, chartArea:{top, right, bottom, left, width, height}}=chart;
				ctx.save();
				
				ctx.font=options.fontSize + ' '+ options.fontFamily;
				ctx.textAlign= 'center';
				ctx.fillStyle= options.fontColor;
				ctx.fillText('총 86,137'+ ' 마리', width / 2 , top + (height / 2));
			}
	};
	
	const config = {
		    type: 'doughnut',
		    data,
		    options: {
      		  legend:{ //그래프의 항목 옵션
    			  display:true,
    			  position:'bottom'
    		  },
    		  plugins:{
    			  counter:{
    				  fontColor: 'blue',
    				  fontSize: '30px',
    				  fontFamily: 'serif'
    			  },
    			  title:{ //그래프의 제목 옵션
        			  display:true,
        			  text: '전국 유기동물 현황',
        			  fontSize :'100'
        		  },
        		  legend:{ //그래프의 항목 옵션
        			  display:true,
        			  position:'bottom'
        		  }
    		  }
		    },
		    plugins: [counter]
		};
	
	const myChart = new Chart(
			document.getElementById('myChart'),
			config
	);
</script>

<!-- 차트 그래프 -->
 <script>
 var chart = new Chart('chart', {
	  plugins:[ChartDataLabels],
	  type: 'bar',
	  data: {
	    axis:'y',
	    datasets: [
	      {
    		label: '마리',
	    	data: [13877, 21332, 10687, 23358, 13421, 1362, 2100],
	        backgroundColor: ["rgba(255, 0, 0, 0.3)", 
									   "rgba(100, 255, 0, 0.3)", 
									   "rgba(200, 50, 255, 0.3)", 
									   "rgba(0, 100, 255, 0.3)", 
									   "rgba(153,255,255, 0.3)", 
									   "rgba(255,255,0, 0.3)", 
									   "rgba(204,153,051, 0.3)"],
									   
			borderColor: [ "rgba(255, 99, 132)",
								 "rgb(255, 159, 64)",
								 "rgb(255, 205, 86)",
								 "rgb(75, 192, 192)",
								 "rgb(54, 162, 235)",
								 "rgb(153, 102, 255)",
								 "rgb(201, 203, 207)"
								],
			borderWidth: 2,
			datalabels:{
				anchor:'end',
				align:'end'
			}
	      }
	    ],
	    labels: ['보호중', '입양', '반환', '자연사', '안락사', '방사', '기증']
	  },
	  options: {
		  plugins:{
			  datalables:{
				  formatter:function(value,context){
					  var idx=context.dataIndex;
					  return context.chart.data.labels[idx]+' '+addComma(value)+(idx==0? '마리': 'p');
				  }
			  },
			  legend:{ display:false},
		  },
		 responsive:false,
		 indexAxis:'y' //세로로 눕히기!
	  }
	});
</script>
</html>