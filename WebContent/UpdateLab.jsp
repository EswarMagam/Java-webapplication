<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${pageContext.request.userPrincipal.name != 'administrator'}">
<c:redirect url="userWelcome"/>
</c:if>
<nav class="navbar" style="background-color: body">

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
	<hr>



	<div class="container">
		<form:form action="${contextPath}/${labs.labId}/UpdateLab" modelAttribute="labs"
			method="post">
			<div>${labs.labId}</div>
			<br>
			<div>
			<div class="col-sm-3">
				<form:label path="labName" class="form-control">Lab Name</form:label>
				<form:input type="text" id="labName" path="labName" />
				<form:errors path="labName" />
			</div>
			<div class="col-sm-3">
				<form:label path="labLocation" class="form-control">Lab Location</form:label>
				<form:input type="text" id="labLocation" path="labLocation" />
				<form:errors path="labLocation" />
			</div>
			<div>
			<br>
			<br>
				<div>
					<input type="submit" value="Update Lab" class="btn btn-primary">
				</div>
			</div>
			</div>
		</form:form>

	</div>

</body>
</html>