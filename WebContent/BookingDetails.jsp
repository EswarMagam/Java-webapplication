<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>BookingDetails</title>
<style type="text/css">
	.form {
		margin: 0 auto;
		width: 210px;
	}
	.form label{
		display: inline-block;
		text-align: center;
		float: left;
	}
	.form input{
		display: inline-block;
		text-align: center;
		float: center;
	}
</style>

<meta charset="UTF-8">
<title>All Bookings</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Swiper CSS -->
<link rel="stylesheet" href="${contextPath}/css/swiper.min.css">

<!-- Styles -->
<link rel="stylesheet" href="${contextPath}/css/style.css">
<script src="${contextPath}/js/custom.js"></script>


</head>

<!-- <script>
$(function(){
    $('#date').combodate();    
});
</script> -->
<body>
	<br>
	<header class="site-header">
		<div class="nav-bar">
			<div class="container">
				<div class="row">
					<div
						class="col-12 d-flex flex-wrap justify-content-between align-items-center">
						<div class="site-branding d-flex align-items-center">
							<b><a class="d-block" href="${contextPath}/Home" rel="home">EM DIAGNOS</a></b>
						</div>
						<!-- .site-branding -->

						<nav
							class="site-navigation d-flex justify-content-end align-items-center">
							<ul
								class="d-flex flex-column flex-lg-row justify-content-lg-end align-items-center">
								<li class="current-menu-item"><a href="${contextPath}/Home">Home</a></li>
                                
								<li><c:if test="${pageContext.request.userPrincipal.name != null}">
					               <form id="logoutForm" method="POST" action="${contextPath}/logout">
						               <input type="hidden" name="${_csrf.parameterName}"
							                 value="${_csrf.token}" />
				                   	</form>
				                    </c:if></li>
				                <li><button class="btn btn-link"><a onclick="document.forms['logoutForm'].submit()">Logout</a></button></li>
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
					style="background-image: url('${contextPath}/images/hero.jpg')">
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
									
									</div>
									<!-- .entry-content -->

									<footer
										class="entry-footer d-flex flex-wrap align-items-center mt-4">
										<a href="${contextPath}/bookings" class="button gradient-bg">Bookings</a>
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
				
				</div>
				</div>
				</header>
	
	
	
	




	<div class="body">
		<div class="container">
             <br>
			<h1 align="center" style="font-weight: bolder;">Booking Details</h1>
           <br>
			<form action="${contextPath}/bookingdetails?${_csrf.parameterName}=${_csrf.token}" method="POST" enctype="multipart/form-data"
				align="center" style="font-weight:normal;">
				Test Name: <input type="text" name="testname" value="${testname}"
					readonly><br> <br> Lab Name: <input type="text"
					name="labname" value="${labname}" readonly><br> <br>
				User Name: <input type="text" name="username" value="${username}"
					readonly><br>
				<!-- Date: <input
					type="text" id="date" data-format="DD-MM-YYYY"
					data-template="D MMM YYYY" name="date"> -->
				<br> Date <input type="date" name="bookingdate"> 
				<br>
				<br>
				
				<div class="form" align="center">
					TimeSlot: 
					<select name="timeslot" class="form-control">

						<option value="9:30AM-10:30AM">9:30AM-10:30AM</option>
						<option value="10:30AM-11:30AM">10:30AM-11:30AM</option>
						<option value="11:30AM-12:30PM">11:30AM-12:30PM</option>
						<option value="12:30PM-01:30PM">12:30PM-01:30PM</option>
						<option value="01:30PM-02:30PM">01:30PM-02:30PM</option>
						<option value="02:30PM-03:30PM">02:30PM-03:30PM</option>
						<option value="03:30PM-04:30PM">03:30PM-04:30PM</option>
						<option value="04:30PM-05:30PM">05:30PM-06:30PM</option>
						<option value="04:30PM-05:30PM">06:30PM-07:30PM</option>
						<option value="04:30PM-05:30PM">07:30PM-08:30PM</option>
						<option value="04:30PM-05:30PM">08:30PM-09:30PM</option>

					</select>
				</div>
				<br> 

				<div class="form" align="center">
					<input type="file" name="file" class="btn btn-info"/><br /> <br />
				  </div>


				<!-- DoctorPrescription: <input type="text" name="path"> <br> -->
				<br> Details <br> <input type="text"
					name="userdetails" size="25"> <br> <br> <input
					type="submit" name="book" value="Book" class="button gradient-bg">
				<hr>
			</form>

           <br>
           <br>
           <br>
		</div>
	</div>




</body>
</html>