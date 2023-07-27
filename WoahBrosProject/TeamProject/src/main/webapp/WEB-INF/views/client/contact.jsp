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

<%@include file="./inc/header_link.jsp"%>


</head>
<body>

	<!-- preloader -->
	<%@include file="./inc/preloader.jsp"%>

	<!-- header -->
	<%@include file="./inc/header.jsp"%>

	<!-- contact form -->

	<!-- search area -->
	<div class="search-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<span class="close-btn"><i class="fas fa-window-close"></i></span>
					<div class="search-bar">
						<div class="search-bar-tablecell">
							<h3>Search For:</h3>
							<input type="text" placeholder="Keywords">
							<button type="submit">
								Search <i class="fas fa-search"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end search arewa -->

	<!-- breadcrumb-section -->
	<div class="breadcrumb-section breadcrumb-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="breadcrumb-text">
						<p>Get 24/7 Support</p>
						<h1>Contact us</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->

	<!-- contact form -->
	<div class="contact-from-section mt-150 mb-150">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mb-5 mb-lg-0">
					<div class="form-title">
						<h2>Have you any question?</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Pariatur, ratione! Laboriosam est, assumenda. Perferendis, quo
							alias quaerat aliquid. Corporis ipsum minus voluptate? Dolore,
							esse natus!</p>
					</div>
					<div id="form_status"></div>
					<div class="contact-form">
						<form type="POST" id="fruitkha-contact"
							onSubmit="return valid_datas( this );">
							<p>
								<input type="text" placeholder="Name" name="name" id="name">
								<input type="email" placeholder="Email" name="email" id="email">
							</p>
							<p>
								<input type="tel" placeholder="Phone" name="phone" id="phone">
								<input type="text" placeholder="Subject" name="subject"
									id="subject">
							</p>
							<p>
								<textarea name="message" id="message" cols="30" rows="10"
									placeholder="Message"></textarea>
							</p>
							<input type="hidden" name="token" value="FsWga4&@f6aw" />
							<p>
								<input type="submit" value="Submit">
							</p>
						</form>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="contact-form-wrap">
						<div class="contact-form-box">
							<h4>
								<i class="fas fa-map"></i> Shop Address
							</h4>
							<p>
								34/8, East Hukupara <br> Gifirtok, Sadan. <br> Country
								Name
							</p>
						</div>
						<div class="contact-form-box">
							<h4>
								<i class="far fa-clock"></i> Shop Hours
							</h4>
							<p>
								MON - FRIDAY: 8 to 9 PM <br> SAT - SUN: 10 to 8 PM
							</p>
						</div>
						<div class="contact-form-box">
							<h4>
								<i class="fas fa-address-book"></i> Contact
							</h4>
							<p>
								Phone: +00 111 222 3333 <br> Email: support@fruitkha.com
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end contact form -->

	<!-- find our location -->
	<div class="find-location blue-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<p>
						<i class="fas fa-map-marker-alt"></i> Find Our Location
					</p>
				</div>
			</div>
		</div>
	</div>
	<!-- end find our location -->
	<!-- google map section -->
	<div id="googleMap" style="width: 100%;height: 450px;"/>
	<!-- end google map section -->

	<!-- end contact form -->


	<!-- footer -->
	<%@include file="./inc/footer.jsp"%>

	<!-- footer_link -->
	<%@include file="./inc/footer_link.jsp"%>

</body>
<script>
   function myMap(){
	  var cityHall = {lat: 37.556449, lng: 126.945195}; 
	   
      var mapOptions = { 
            center:cityHall,
            zoom:18
      };
 
      var map = new google.maps.Map(document.getElementById("googleMap"), mapOptions );
      
      var marker = new google.maps.Marker({position: cityHall, map: map});
   }
</script> 
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA7KFV2t85lCBJQZqCV9wsnFMn3g_njebw&callback=myMap"></script>
</html>