<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
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

    <meta charset="utf-8">
    <title>AdminWelcome</title>
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<style>
form {
align:center;

}
</style>
    
</head>
<c:if test="${pageContext.request.userPrincipal.name != 'administrator'}">
<c:redirect url="userWelcome"/>
</c:if>
<body>
<div>



</div>
<header class="site-header">
		<div class="nav-bar">
			<div class="container">
				<div class="row">
					<div
						class="col-12 d-flex flex-wrap justify-content-between align-items-center">
						<div class="site-branding d-flex align-items-center">
							<b><a class="d-block" href="${contextPath}/welcome" rel="home">EM DIAGNOS</a></b>
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


  <div class="container">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

<%--         <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>
 --%>    </c:if>
  </div>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="${contextPath}/resources/js/bootstrap.min.js"></script>


<h1 align="center">UPDATE / DELETE (Labs & Tests)</h1>
   
   <div align="center">
   <p> If any errors occured while Adding labs and/or Tests UPDATE Here</p>
   </div>
   <center>
  <form action="${contextPath}/updateOrdelete">
  <input type="submit" value="Update/Delete" class="button gradient-bg">
  
  </form>
  </center>
  
  <br>
  <br>
  <br>
  <br>
  <br>
  
  
 
  
  
  
</body>
</html>
