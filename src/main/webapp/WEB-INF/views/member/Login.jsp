<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script src="https://kit.fontawesome.com/6c060c00b1.js"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script>


</script>
</head>
<body class="center">

<c:import url="../include/top.jsp"/>
<div class="container">
	<div class="row">
		<div class="col-4"></div>
		<div class="col-4">
		<div class="card p-4 p-md-4 my-4 mx-3 mx-md-0">
		<form action="${pageContext.request.contextPath}/member/LoginProcess.do" method="post">
		<div class="form-group">
			<input class="form-control my-2" type="text" name="member_id" placeholder="ID" autofocus>
			<input class="form-control my-2" type="password" name="member_pw" placeholder="PW">
		</div>
		<button class="btn btn-outline-dark" type="submit">Login</button>
		</form>
		
		</div>
		</div>
		<div class="col-4"></div>
	</div>
</div>
</body>
</html>