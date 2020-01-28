<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



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

<title>Mapping Lab and Tests</title>
<style>
table {
  border-collapse: collapse;
  border: 1.2px solid black;
}

button {
align:center;
}
</style>

</head>
<body>
	<c:if test="${pageContext.request.userPrincipal.name != 'administrator'}">
		<c:redirect url="userWelcome" />
	</c:if>
	<header class="site-header">
		<div class="nav-bar">
			<div class="container">
				<div class="row">
					<div
						class="col-12 d-flex flex-wrap justify-content-between align-items-center">
						<div class="site-branding d-flex align-items-center">
							<b><a class="d-block" href="${contextPath}/Home" rel="home">EM DIAGNOS</a></b>
							<!-- <img
								class="d-block" src="images/logo.png" alt="logo"> -->
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
	</header>



	<%-- <nav class="navbar" style="background-color: body">

		<div class="container">
			<div class="navbar-header">
			<!-- <div class="col-xs-4"> -->
				<a href="welcome.jsp" title=""><image src="Images/diagnostics-logo.jpg" style="width:250px;height:70px" class="img-responsive"></image></a>
           <!--  </div> -->
			</div>

			<ul class="nav navbar-nav navbar-right">
				<br>

				<button type="button" class="btn btn-primary">Welcome
					${pageContext.request.userPrincipal.name}</button>
				&nbsp;&nbsp;&nbsp;
				
				<a onclick="document.forms['logoutForm'].submit()" class="btn btn-primary">Logout</a>


    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <!-- <h2><a onclick="document.forms['logoutForm'].submit()" class="btn btn-primary">Logout</a></h2> -->
    </c:if>
			</ul>
			<br> <br>
		</div>
	</nav>
	<hr> --%>

	
		<%-- <form action="${contextPath}/assign" method="get" align="center">
				<div class="column">
					<div class="col-sm-3">
						<b>Select-Lab</b> <select class="form-control" name="labname">
							<c:forEach var="obj" items="${AllLabdetails}">
								<option>${obj.labName}</option>

							</c:forEach>
						</select> &nbsp;&nbsp;&nbsp;&nbsp; <b>Select-Test</b> <select
							class="form-control" name="testname">
							<c:forEach var="tlist" items="${AllTestdetails}">
								<option>${tlist.testName}</option>
							</c:forEach>
						</select>
						<br>
						<div class="btn-btnprimary">
							<button type="submit" name="button" value="Assign"
								class="button gradient-bg" >Assign</button>
						</div>
					</div>
				</div>
			</form> --%>
			<br>
<div class="container">
		<h1 align="center" style="font-weight: bolder;">Assign Lab And Tests</h1>
		<br>
		<form action="${contextPath}/assign" method="get">
			<table class="table">
			<tr>
			<th>LABS</th>
			<th>TESTS</th></tr>
			
			
				<tr>

					<td><c:forEach var="obj" items="${AllLabdetails}">
							<input type="checkbox" name="lid" value="${obj.labId}">${obj.labName}<br>
						
					</c:forEach> </td>

					<td><c:forEach var="tlist" items="${AllTestdetails}">
							<input type="checkbox" name="tid" value="${tlist.tId}">${tlist.testName} <br>
				
				</c:forEach></td>
				</tr>
			</table>
			<button type="submit" class="button gradient-bg" name="button">Assign</button>
		</form>
     <br>
     <br>
     
	</div>
</body>
</html>