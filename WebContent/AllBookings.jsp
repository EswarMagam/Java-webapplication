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
<style>
table, th, td {
	border: 1.5px solid black;
	border-collapse: collapse;
}

th {
	padding: 25px;
}

table {
	width: 30px;
}

.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding-top: 60px;
}
/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 1px solid #888;
	width: 80%; /* Could be more or less, depending on screen size */
	display: block;
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
<body>

	<br>

	<header class="site-header">
		<div class="nav-bar">
			<div class="container">
				<div class="row">
					<div
						class="col-12 d-flex flex-wrap justify-content-between align-items-center">
						<div class="site-branding d-flex align-items-center">
							<b><a class="d-block" href="${contextPath}/Home" rel="home">EM
									DIAGNOS</a></b>
						</div>
						<!-- .site-branding -->

						<nav
							class="site-navigation d-flex justify-content-end align-items-center">
							<ul
								class="d-flex flex-column flex-lg-row justify-content-lg-end align-items-center">
								<li class="current-menu-item"><a href="${contextPath}/Home">Home</a></li>

								<li><a href="${contextPath}/addTest">Add Test</a></li>
								<li><a href="${contextPath}/addLab">Add Lab</a></li>
								<li><a href="${contextPath}/assignbutton">SetUp</a></li>
								<li><a href="${contextPath}/bookings">Bookings</a></li>

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

									<div class="entry-content mt-4"></div>
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






	<br>
	<h1 align="center" style="font-weight: bolder;">BOOKINGS</h1>
	<br>
	<div class="mx-auto" style="width: 80%;">
		<table class="table table-striped">
			<tr style="color: black; background-color: powderblue;">
				<th>User Name</th>
				<th>Details</th>
				<th>Date</th>
				<th>Lab Name</th>
				<th>Test Name</th>
				<th>Prescription</th>
				<th>Time Slot</th>
				<th>Status</th>
			</tr>
			<c:forEach var="obj" items="${bookings}">
				<tr style="font: bold; font-family: sans-serif;">
					<%-- <td>${obj.bid}</td> --%>
					<td>${obj.uName}</td>
					<td>${obj.userDetails}</td>
					<td>${obj.date}</td>
					<td>${obj.lName}</td>
					<td>${obj.tName}</td>
					<%-- <td><a href="${contextPath}/${obj.path}/view">View</a></td> --%>
					<td><button type="button" class="btn btn-sm"
							data-toggle="modal" data-target="#${obj.bid}">View
							Prescription</button>

						<div id="${obj.bid}" class="modal fade">
							<!-- id = "${b.bid}" - because to view all prescriptions based on id -->
							<div class="modal-dialog" align="center" style="width: 1250px">
								<div class="modal-content">
									<div class="modal-header">
										<hr>
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">&times;</button>
									</div>
									<img src="${contextPath}/upload/${obj.path}" width="400"
										height="300" />
								</div>
							</div>
						</div></td>


					<%-- <td><img src="${contextPath}/upload/${obj.path}" width="80" height="80"/></td> --%>
					<td>${obj.timeslot}</td>
					<td><c:set var="status" scope="session" value="${obj.status}" />
						<c:out value="${status}" /> <c:choose>

							<c:when test="${status == 'pending'}">


								<a href="${contextPath}/${obj.bid}/Accept" method="get"> <input
									type="submit" id="button" name="accept" class="btn btn-success"
									style="background-color: green;" value="Accept">
								</a>


								<a href="${contextPath}/${obj.bid}/Reject"> <input
									type="submit" name="Reject" class="btn btn-danger"
									value="Reject">
								</a>

							</c:when>
							<c:otherwise>
								<!-- Successfully updated -->
							</c:otherwise>
						</c:choose></td>


				</tr>

			</c:forEach>
		</table>
		<br> <br> <br>
	</div>
</body>
</html>