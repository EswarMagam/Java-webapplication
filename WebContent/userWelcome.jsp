<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
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
<style>
select {
	width: 100px;
	height: 60px;
}
</style>
<title>UserWelcome</title>
</head>

<body>


	<br>
	<header class="site-header">
		<div class="nav-bar">
			<div class="container">
				<div class="row">
					<div
						class="col-12 d-flex flex-wrap justify-content-between align-items-center">
						<div class="site-branding d-flex align-items-center">
							<b><a class="d-block" href="${contextPath}/userWelcome" rel="home">EM DIAGNOS</a></b>
						</div>
						<!-- .site-branding -->

						<nav
							class="site-navigation d-flex justify-content-end align-items-center">
							<ul
								class="d-flex flex-column flex-lg-row justify-content-lg-end align-items-center">
								<li class="current-menu-item"><a
									href="${contextPath}/userWelcome">Home</a></li>


								<!-- <li class="call-btn button gradient-bg mt-3 mt-md-0"><a
									class="d-flex justify-content-center align-items-center"
									href="#"><img src="images/emergency-call.png"> +34
										586 778 8892</a></li> -->
								<li><c:if
										test="${pageContext.request.userPrincipal.name != null}">
										<form id="logoutForm" method="POST"
											action="${contextPath}/logout">
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

									<div class="entry-content mt-4"></div>
									<!-- .entry-content -->

									<footer class="entry-footer d-flex flex-wrap align-items-center mt-4">
										<form action="${contextPath}/Mybookings" method="get">
											<input type="submit" value="MyBookings"
												class="button gradient-bg"> <input type="hidden"
												name="username"
												value="${pageContext.request.userPrincipal.name}">

										</form>
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
			<!-- .pagination-wrap -->
		</div>
		<!-- .hero-slider -->
	</header>


	<%-- 	<nav class="nav-bar">
		<div class="container">
			<div class="navbar-header">
				<a href="${contextPath}/index" ><image
						src="Images/diagnostics-logo.jpg" style="width:250px;height:70px"
						class="img-responsive"></image></a>
			</div>
			
				<div>
				<c:if test="${pageContext.request.userPrincipal.name != null}">
				
					
					<ul class="navbar-right">
					
				<form id="logoutForm" method="POST" action="${contextPath}/logout">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form> 
					
					
					
						<button type="button" class="btn btn-primary">
							${pageContext.request.userPrincipal.name}</button>
						<a class="btn btn-primary"
							onclick="document.forms['logoutForm'].submit()">Logout</a></li>
					
					<a href="${contextPath}/${pageContext.request.userPrincipal.name}/Mybookings" method="get" class="btn btn-primary">MyBookings</a>
					
					
					<form action="${contextPath}/Mybookings" method="get" >
					<input type="submit" value="MyBookings" class="btn btn-primary">
				<input type="hidden" name="username"
										value="${pageContext.request.userPrincipal.name}">
			    
				</form> 		
				
						</ul>		
					
					
				</c:if>
				</div>
			
		</div>
	</nav> --%>


	<hr>
	<div class="container">
		<div class="form-group">
			<div>
				<div>

					<br>
					<form action="${contextPath}/search" method="get">
						<div class="col-sm-3">
							<h3>
								<b style="color: orange">Select-Test</b> <select
									class="form-control" title="Choose one of the following.."
									name="searchTest">
									<c:forEach var="tlist" items="${AllTestdetails}">
										<option>${tlist.testName}</option>
									</c:forEach>
								</select>
							</h3>
						</div>
						<br>
						<button type="submit" name="button" value="Search"
							class="button gradient-bg">Search</button>

					</form>
				</div>
				<br> <br>
			</div>
		</div>
	</div>
</body>
</html>