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
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
<c:if test="${pageContext.request.userPrincipal.name != 'administrator'}">
<c:redirect url="userWelcome"/>
</c:if>
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
	<embed src="${contextPath}/upload/${images}" width="780" height="880"/>	
	</div>

</body>
</html>