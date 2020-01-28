<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html lang="en">
<head>
<title>Hello World</title>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Swiper CSS -->
<link rel="stylesheet" href="css/swiper.min.css">

<!-- Styles -->
<link rel="stylesheet" href="css/style.css">
<script src="js/custom.js"></script>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="utf-8">
<!-- <style>
.button {
    padding: 12px 50px 10px;
    margin-right: 32px;
    border: 0;
    border-bottom: 3px solid #18a3eb;
    border-radius: 20px;
    font-size: 16px;
    font-weight: 600;
    line-height: 1;
    color: #404040;
    outline: none;
    background: #f0f4f8;
    text-decoration: none !important;
}
img {
    vertical-align: baseline;
}
body {
    color: #404040;
    font-size: 16px;
    line-height: 1.8;
    font-family: 'Raleway', sans-serif;
}
.swiper-container {
  margin: 0 auto;
  position: relative;
  overflow: hidden;
  list-style: none;
  padding: 0;
  /* Fix of Webkit flickering */
  z-index: 1;
}
</style>
 -->
</head>
<body>
	<header class="site-header">
		<div class="nav-bar">
			<div class="container">
				<div class="row">
					<div
						class="col-12 d-flex flex-wrap justify-content-between align-items-center">
						<div class="site-branding d-flex align-items-center">
							<a class="d-block" href="index.html" rel="home"><img
								class="d-block" src="images/logo.png" alt="logo"></a>
						</div>
						<!-- .site-branding -->

						<nav
							class="site-navigation d-flex justify-content-end align-items-center">
							<ul
								class="d-flex flex-column flex-lg-row justify-content-lg-end align-items-center">
								<li class="current-menu-item"><a href="Home.jsp">Home</a></li>
								<li><a href="Home.jsp">${pageContext.request.userPrincipal.name}</a></li>
								<li><a href="${contextPath}/bookings">MyBookings</a></li>
                                
								<!-- <li class="call-btn button gradient-bg mt-3 mt-md-0"><a
									class="d-flex justify-content-center align-items-center"
									href="#"><img src="images/emergency-call.png"> +34
										586 778 8892</a></li> -->
								<li><c:if test="${pageContext.request.userPrincipal.name != null}">
					               <form id="logoutForm" method="POST" action="${contextPath}/logout">
						               <input type="hidden" name="${_csrf.parameterName}"
							                 value="${_csrf.token}" />
				                   	</form>
				                    </c:if></li>
				                <li><a onclick="document.forms['logoutForm'].submit()">Logout</a></li>
							</ul>
						</nav>
						<!-- .site-navigation -->

						<div class="hamburger-menu d-lg-none">
							<span></span> <span></span> <span></span> <span></span>
						</div>
						<!-- .hamburger-menu -->
					</div>
					<!-- .col -->
				</div>
				<!-- .row -->
			</div>
			<!-- .container -->
		</div>
		<!-- .nav-bar -->

		<div class="swiper-container hero-slider">
			<div class="swiper-wrapper">
				<div class="swiper-slide hero-content-wrap"
					style="background-image: url('images/hero.jpg')">
					<div class="hero-content-overlay position-absolute w-100 h-100">
						<div class="container h-100">
							<div class="row h-100">
								<div
									class="col-12 col-lg-6 d-flex flex-column justify-content-center align-items-start">
									<header class="entry-header">
										<h1>
											The Best <br>Medical Services
										</h1>
									</header>
									<!-- .entry-header -->

									<div class="entry-content mt-4">
										---------
									</div>
									<!-- .entry-content -->

									<footer
										class="entry-footer d-flex flex-wrap align-items-center mt-4">
										<a href="#" class="button gradient-bg">Read More</a>
									</footer>
									<!-- .entry-footer -->
								</div>
								<!-- .col -->
							</div>
							<!-- .row -->
						</div>
						<!-- .container -->
					</div>
					<!-- .hero-content-overlay -->
				</div>
				<!-- .hero-content-wrap -->

				<div class="swiper-slide hero-content-wrap"
					style="background-image: url('images/hero.jpg')">
					<div class="hero-content-overlay position-absolute w-100 h-100">
						<div class="container h-100">
							<div class="row h-100">
								<div
									class="col-12 col-lg-6 d-flex flex-column justify-content-center align-items-start">
									<header class="entry-header">
										<h1>
											The Best <br>Medical Services
										</h1>
									</header>
									<!-- .entry-header -->

									<div class="entry-content mt-4">
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing
											elit. Donec malesuada lorem maximus mauris scelerisque, at
											rutrum nulla dictum. Ut ac ligula sapien. Suspendisse cursus
											faucibus finibus.</p>
									</div>
									<!-- .entry-content -->

									<footer
										class="entry-footer d-flex flex-wrap align-items-center mt-4">
										<a href="#" class="button gradient-bg">Read More</a>
									</footer>
									<!-- .entry-footer -->
								</div>
								<!-- .col -->
							</div>
							<!-- .row -->
						</div>
						<!-- .container -->
					</div>
					<!-- .hero-content-overlay -->
				</div>
				<!-- .hero-content-wrap -->

				<div class="swiper-slide hero-content-wrap"
					style="background-image: url('images/hero.jpg')">
					<div class="hero-content-overlay position-absolute w-100 h-100">
						<div class="container h-100">
							<div class="row h-100">
								<div
									class="col-12 col-lg-6 d-flex flex-column justify-content-center align-items-start">
									<header class="entry-header">
										<h1>
											The Best <br>Medical Services
										</h1>
									</header>
									<!-- .entry-header -->

									<div class="entry-content mt-4">
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing
											elit. Donec malesuada lorem maximus mauris scelerisque, at
											rutrum nulla dictum. Ut ac ligula sapien. Suspendisse cursus
											faucibus finibus.</p>
									</div>
									<!-- .entry-content -->

									<footer
										class="entry-footer d-flex flex-wrap align-items-center mt-4">
										<a href="#" class="button gradient-bg">Read More</a>
									</footer>
									<!-- .entry-footer -->
								</div>
								<!-- .col -->
							</div>
							<!-- .row -->
						</div>
						<!-- .container -->
					</div>
					<!-- .hero-content-overlay -->
				</div>
				<!-- .hero-content-wrap -->
			</div>
			<!-- .swiper-wrapper -->

			<div class="pagination-wrap position-absolute w-100">
				<div class="swiper-pagination d-flex flex-row flex-md-column"></div>
			</div>
			<!-- .pagination-wrap -->
		</div>
		<!-- .hero-slider -->
	</header>
	<!-- .site-header -->

	<div class="homepage-boxes">
		<div class="container">
			<div class="row">
				<div class="col-12 col-md-6 col-lg-4">
					<div class="opening-hours">
						<h2 class="d-flex align-items-center">Opening Hours</h2>

						<ul class="p-0 m-0">
							<li>Monday - Thursday <span>8.00 - 19.00</span></li>
							<li>Friday <span>8.00 - 18.30</span></li>
							<li>Saturday <span>9.30 - 17.00</span></li>
							<li>Sunday <span>9.30 - 15.00</span></li>
						</ul>
					</div>
				</div>

				<div class="col-12 col-md-6 col-lg-3 mt-5 mt-md-0">
					<div class="emergency-box">
						<h2 class="d-flex align-items-center">Emergency</h2>

						<div class="call-btn button gradient-bg">
							<a class="d-flex justify-content-center align-items-center"
								href="#"><img src="images/emergency-call.png"> +34 586
								778 8892</a>
						</div>

						<p>Lorem ipsum dolor sit amet, cons ectetur adipiscing elit.
							Donec males uada lorem maximus mauris sceler isque, at rutrum
							nulla.</p>
					</div>
				</div>

				<div class="col-12 col-md-6 col-lg-5 mt-5 mt-lg-0">
					<div class="appointment-box">
						<h2 class="d-flex align-items-center">Make an Appointment</h2>

						<form class="d-flex flex-wrap justify-content-between">
							<select class="select-department">
								<option value="value1">Select Department</option>
								<option value="value2">Select Department 1</option>
								<option value="value3">Select Department 2</option>
							</select> <select class="select-doctor">
								<option>Select Doctor</option>
								<option>Select Doctor 1</option>
								<option>Select Doctor 2</option>
							</select> <input type="text" placeholder="Name"> <input
								type="number" placeholder="Phone No"> <input
								class="button gradient-bg" type="submit"
								value="Boom Appoitnment">
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>

	<div class="our-departments">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="our-departments-wrap">
						<h2>Our Departments</h2>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- .testimonial-section -->

	<div class="the-news">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h2>The News</h2>

					<div class="row">
						<div class="col-12 col-md-6 col-lg-4">
							<div class="the-news-wrap">
								<figure class="post-thumbnail">
									<a href="#"><img src="images/news-1.png" alt=""></a>
								</figure>

								<header class="entry-header">
									<h3>The latest in Medicine</h3>

									<div class="post-metas d-flex flex-wrap align-items-center">
										<div class="posted-date">
											<label>Date: </label><a href="#">April 12, 2018</a>
										</div>

										<div class="posted-by">
											<label>By: </label><a href="#">Dr. Jake Williams</a>
										</div>

										<div class="post-comments">
											<a href="#">2 Comments</a>
										</div>
									</div>
								</header>

								<div class="entry-content">
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
										Donec malesuada lorem maximus mauris scelerisque, at rutrum
										nulla dictum. Ut ac ligula sapien. Suspendisse cursus faucibus
										finibus.</p>
								</div>
							</div>
						</div>

						<div class="col-12 col-md-6 col-lg-4">
							<div class="the-news-wrap">
								<figure class="post-thumbnail">
									<a href="#"><img src="images/news-2.png" alt=""></a>
								</figure>

								<header class="entry-header">
									<h3>All you need to know about pills</h3>

									<div class="post-metas d-flex flex-wrap align-items-center">
										<div class="posted-date">
											<label>Date: </label><a href="#">April 12, 2018</a>
										</div>

										<div class="posted-by">
											<label>By: </label><a href="#">Dr. Jake Williams</a>
										</div>

										<div class="post-comments">
											<a href="#">2 Comments</a>
										</div>
									</div>
								</header>

								<div class="entry-content">
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
										Donec malesuada lorem maximus mauris scelerisque, at rutrum
										nulla dictum. Ut ac ligula sapien. Suspendisse cursus faucibus
										finibus.</p>
								</div>
							</div>
						</div>

						<div class="col-12 col-md-6 col-lg-4">
							<div class="the-news-wrap">
								<figure class="post-thumbnail">
									<a href="#"><img src="images/news-3.png" alt=""></a>
								</figure>

								<header class="entry-header">
									<h3>Marketing and Medicine</h3>

									<div class="post-metas d-flex flex-wrap align-items-center">
										<div class="posted-date">
											<label>Date: </label><a href="#">April 12, 2018</a>
										</div>

										<div class="posted-by">
											<label>By: </label><a href="#">Dr. Jake Williams</a>
										</div>

										<div class="post-comments">
											<a href="#">2 Comments</a>
										</div>
									</div>
								</header>

								<div class="entry-content">
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
										Donec malesuada lorem maximus mauris scelerisque, at rutrum
										nulla dictum. Ut ac ligula sapien. Suspendisse cursus faucibus
										finibus.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="subscribe-banner">
		<div class="container">
			<div class="row">
				<div class="col-12 col-lg-8 offset-lg-2">
					<h2>Subscribe to our newsletter</h2>

					<form>
						<input type="email" placeholder="E-mail address"> <input
							class="button gradient-bg" type="submit" value="Subscribe">
					</form>
				</div>
			</div>
		</div>
	</div>

	<footer class="site-footer">
		<div class="footer-widgets">
			<div class="container">
				<div class="row">
					<div class="col-12 col-md-6 col-lg-4">
						<div class="foot-about">
							<h2>
								<a href="#"><img src="images/logo.png" alt=""></a>
							</h2>

							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Donec malesuada lorem maximus mauris scelerisque, at rutrum
								nulla dictum. Ut ac ligula sapien.</p>

							<p class="copyright">
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved | This template is made with <i
									class="fa fa-heart" aria-hidden="true"></i> by <a
									href="https://colorlib.com" target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
						</div>
						<!-- .foot-about -->
					</div>
					<!-- .col -->

					<div class="col-12 col-md-6 col-lg-4 mt-5 mt-md-0">
						<div class="foot-contact">
							<h2>Contact</h2>

							<ul class="p-0 m-0">
								<li><span>Addtress:</span>Mitlton Str. 26-27 London UK</li>
								<li><span>Phone:</span>+53 345 7953 32453</li>
								<li><span>Email:</span>yourmail@gmail.com</li>
							</ul>
						</div>
					</div>
					<!-- .col -->

					<div class="col-12 col-md-6 col-lg-4 mt-5 mt-md-0">
						<div class="foot-links">
							<h2>Usefull Links</h2>

							<ul class="p-0 m-0">
								<!--   <li><a href="index.html">Home</a></li> -->
								<!--  <li><a href="about.html">About us</a></li> -->
								<li><a href="#">Departments</a></li>
								<li><a href="contact.html">Contact</a></li>
								<li><a href="news.html">FAQ</a></li>
								<li><a href="services.html">Testimonials</a></li>
							</ul>
						</div>
						<!-- .foot-links -->
					</div>
					<!-- .col -->
				</div>
				<!-- .row -->
			</div>
			<!-- .container -->
		</div>
		<!-- .footer-widgets -->
	</footer>
	<!-- .site-footer -->

	<script type='text/javascript' src='js/jquery.js'></script>
	<script type='text/javascript' src='js/jquery.collapsible.min.js'></script>
	<script type='text/javascript' src='js/swiper.min.js'></script>
	<script type='text/javascript' src='js/jquery.countdown.min.js'></script>
	<script type='text/javascript' src='js/circle-progress.min.js'></script>
	<script type='text/javascript' src='js/jquery.countTo.min.js'></script>
	<script type='text/javascript' src='js/jquery.barfiller.js'></script>
	<script type='text/javascript' src='js/custom.js'></script>
</body>
</html>