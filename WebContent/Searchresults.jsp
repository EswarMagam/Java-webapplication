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
<title>Search Results</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Swiper CSS -->
<link rel="stylesheet" href="css/swiper.min.css">

<!-- Styles -->
<link rel="stylesheet" href="css/style.css">
<script src="js/custom.js"></script>

<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th,td {
 padding:5px;
}
</style>
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
							<b><a class="d-block" href="userWelcome" rel="home">EM DIAGNOS</a></b>
						</div>
						<!-- .site-branding -->

						<nav
							class="site-navigation d-flex justify-content-end align-items-center">
							<ul
								class="d-flex flex-column flex-lg-row justify-content-lg-end align-items-center">
								<li class="current-menu-item"><a href="userWelcome">Home</a></li>
								<li><a href="userWelcome">${pageContext.request.userPrincipal.name}</a></li>


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

									<div class="entry-content mt-4">---------</div>
									<!-- .entry-content -->

									<footer
										class="entry-footer d-flex flex-wrap align-items-center mt-4">
										<a href="${contextPath}/${pageContext.request.userPrincipal.name}/Mybookings" method="get" class="button gradient-bg">MyBookings</a>
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
<%-- <nav class="nav-bar">
		<div class="container">
			<div class="navbar-header">
				<a href="" title=""><image
						src="Images/diagnostics-logo.jpg" style="width:250px;height:70px"
						class="img-responsive"></image></a>
			</div>
			<c:if test="${pageContext.request.userPrincipal.name != null}">
				<form id="logoutForm" method="POST" action="${contextPath}/logout">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>
				<div>
					<ul class="navbar-right">
						<button type="button" class="btn btn-primary">Welcome
							${pageContext.request.userPrincipal.name}</button>
						<a class="btn btn-primary"
							onclick="document.forms['logoutForm'].submit()">Logout</a>
					</ul>
				</div>
			</c:if>
		</div>
	</nav> --%>
	<hr>

	<div>



		<div>

			<%-- <h2 style="color: orange">UserName
				${pageContext.request.userPrincipal.name}</h2> --%>

           
			<div class="container">
			<div class="col-sm-10">
			<br>
				<h1 align="center">Available Labs</h1>
				<br>
				<table class="table table-bordered table-striped table-hover" align="center" >

					<tr>
						<th>LAB NAME</th>
						<th>LAB LOCATION</th>
						<th>BOOK LAB</th>
					</tr>
					<c:forEach var="labs" items="${Availablelabdetails}">
						<tr>
							<td style="color: blue">${labs.labName}</td>
							<td style="color: blue">${labs.labLocation}</td>
							<td>
								<form action="${contextPath}/book" method="get">
									<input type="submit" class="button gradient-bg" value="Book" name="book"> <input
										type="hidden" name="testname" value="${testname}">
									<!-- from search availability method in UserController we added attribute testname -->
									<input type="hidden" name="labname" value="${labs.labName}">
									<!-- from for Each -->
									<input type="hidden" name="username"
										value="${pageContext.request.userPrincipal.name}">
								</form>
							</td>
						</tr>
					</c:forEach>
				</table>
				</div>
			</div>
		</div>
	</div>
<br>
<br>
<br>
<br>


</body>
</html>
