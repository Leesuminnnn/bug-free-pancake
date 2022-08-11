<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<c:import url="${pageContext.request.contextPath}/resources/css/self.css"/><script src="https://kit.fontawesome.com/6c060c00b1.js"
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
<style>
/*레이아웃 영역 지정*/
.wrapper {
	display: flex;
	width: 100%;
	align-items: stretch;
} /*메뉴 텍스트에 마우스 올려놓을 시 밑줄생김 방짐*/
a, a:hover {
	text-decoration: none;
} /*사이드 메뉴 영역*/
#sidebar {
	min-width: 250px;
	max-width: 250px;
	min-height: 100vh;
	background-color: #ddd;
	transition: 0.5s all;
}

#sidebar ul li a {
	padding: 10px 15px;
	font-size: 1.1em;
	display: block;
	color: black;
} /*사이드 메뉴 숨기기 버튼 클릭 시 사이드 메뉴에 스타일 설정*/
#sidebar.active {
	margin-left: -250px;
}

a[data-toggle="collapse"] {
	position: relative;
} /*상위 메뉴의 화살표 스타일 설정*/
.dropdown-toggle::after {
	display: block;
	position: absolute;
	top: 50%;
	right: 20px;
	transform: translateY(-50%);
} /*하위 메뉴의 텍스트 스타일 설정*/
ul ul a {
	font-size: 0.9em !important;
	padding-left: 24px !important;
	background-color: #ddd;
}
</style>
</head>
<body class="center">

	<c:import url="../include/top.jsp" />


	<!--사이드 메뉴와 콘텐츠 영역을 나누기 위한 레이아웃 영역-->
	<div class="wrapper">
		<!--사이드 메뉴-->
		<nav id="sidebar" class="active">
			<ul class="list-unstyled components">
				<li><a href="#dropdownMenu1" data-toggle="collapse"
					aria-expanded="false" class="dropdown-toggle"> 내정보 </a> <!--드롭다운 메뉴-->
					<ul class="collapse list-unstyled" id="dropdownMenu1">
						<li><a href="#">링크1</a></li>
						<li><a href="#">링크2</a></li>
						<li><a href="#">링크3</a></li>
					</ul></li>
				<li><a href="#dropdownMenu2" data-toggle="collapse"
					aria-expanded="false" class="dropdown-toggle"> Menu2 </a> <!--드롭다운 메뉴-->
					<ul class="collapse list-unstyled" id="dropdownMenu2">
						<li><a href="#">Menu2-1</a></li>
						<li><a href="#">Menu2-2</a></li>
						<li><a href="#">Menu2-3</a></li>
					</ul></li>
				<li><a href="#"> Menu3 </a></li>
			</ul>
		</nav>
		<!--콘텐츠영역-->
		<div class="container" id="content">
			<div class="row">
				<div class="col-1">
					<!--토글 버튼-->
					<button type="button" class="btn" id="sidebarToggle">
						<i class="fa-solid fa-bars"></i>
					</button>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="container text-center">
						<form
							action="${pageContext.request.contextPath}/member/JoinProcess.do"
							method="post">
							
							<div class="d-grid gap-2 d-md-flex justify-content-md-end">
								
								<button type="button" class="btn btn-outline-dark"
									onclick="history.back();">돌아가기</button>
							</div>
						</form>


					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
		integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
		crossorigin="anonymous"></script>
	<script>
		$(function() {
			$('#sidebarToggle').on('click', function() {
				$('#sidebar').toggleClass('active');
			});
		});
	</script>
</body>
</html>