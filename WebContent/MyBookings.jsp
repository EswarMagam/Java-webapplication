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
	href="${contextPath}/https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="${contextPath}/https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="${contextPath}/https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th,td {
 padding:15px;
}
</style>
<meta charset="UTF-8">
<title>User Bookings</title>
</head>
<body>
<c:if test="${pageContext.request.userPrincipal.name != 'administrator'}">
<c:redirect url="${contextPath}/userWelcome"/>
</c:if>
<br>
<%-- <header class="site-header">
		<div class="nav-bar">
			<div class="container">
				<div class="row">
					<div
						class="col-12 d-flex flex-wrap justify-content-between align-items-center">
						<div class="site-branding d-flex align-items-center">
							<a class="d-block" href="${contextPath}/userWelcome" rel="home"><img
								class="d-block" src="${contextPath}/images/logo.png" alt="logo"></a>
						</div>
						<!-- .site-branding -->

						<nav
							class="site-navigation d-flex justify-content-end align-items-center">
							<ul
								class="d-flex flex-column flex-lg-row justify-content-lg-end align-items-center">
								<li class="current-menu-item"><a
									href="${contextPath}/userWelcome">Home</a></li>
								<li><a href="${contextPath}/userWelcome">${pageContext.request.userPrincipal.name}</a></li>


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
								<li><a
									href="${contextPath}/${pageContext.request.userPrincipal.name}/Mybookings">MyBookings</a></li>
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

									<div class="entry-content mt-4">---------</div>
									<!-- .entry-content -->

									<footer
										class="entry-footer d-flex flex-wrap align-items-center mt-4">
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
				</div>
				</div>
				</header> --%>



<nav class="nav-bar">
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
	</nav>
	<hr>





<div class="container">
	<h3>Bookings</h3>
					<table class="table table-bordered table-striped table-hover">
						<tr>
							<!-- <th>bid</th> -->
							<th>UserName</th>
							<th>User Details</th>
							<th>Date</th>
							<th>LabName</th>
							<th>TestName</th>
							<!-- <th>path</th> -->
							<th>TimeSlot</th>
							<th>Status</th>
						</tr>
						<c:forEach var="obj" items="${mybookings}">
							<tr>
								<%-- <td>${obj.bid}</td> --%>
								<td>${obj.uName}</td>
								<td>${obj.userDetails}</td>
								<td>${obj.date}</td>
								<td>${obj.lName}</td>
								<td>${obj.tName}</td>
								<%-- <td><a href="${contextPath}/${obj.path}/view">View</a></td> --%>
								<%-- <td><img src="${contextPath}/upload/${obj.path}" width="80" height="80"/></td> --%>
								<td>${obj.timeslot}</td>
								<td>${obj.status}</td>
								<%-- <td><form action="${contextPath}/Accept" method="get">
								<input type="button" id ="button" class="btn btn-primary" style="background-color: green;" value="Accept">
								</form>
									</td>
								<td><form action="${contextPath}/Reject" method="get">
								<input type="button" class="btn btn-primary" style="background-color: red;" value="Reject">
								</form>
									</td>	 --%>
							</tr>

						</c:forEach>
					</table>
</div>

</body>
</html>