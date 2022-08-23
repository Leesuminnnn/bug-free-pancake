<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Home</title>
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
<style>

</style>
</head>
<body class="">
<div class="text-center">
	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
		<a class="navbar-brand"
			href="${pageContext.request.contextPath}/home.do">Logo</a>
			
		<!-- 모바일때 표시되는 메뉴 버튼(PC 버젼에서는 보이지 않는다.)  -->
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<!-- 메인 메뉴 아이템 -->
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<!-- Home 메뉴 -->
				<li class="nav-item active"><a class="nav-link"
					href="${pageContext.request.contextPath}/board/List.do">공지사항 <span
						class="sr-only">(current)</span>
				</a></li>
				<!-- Link 메뉴 -->
				<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/#">시공사례</a></li>
				<c:choose>
					<c:when test="${sessionScope.userid != null}">
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/member/Logout.do">로그아웃</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/member/Join.do">회원가입</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/member/Login.do">로그인</a></li>
					</c:otherwise>
				</c:choose>

				<!-- Dropdown 메뉴 -->

				<li class="nav-item">
					<div class="dropdown">
						<a class="nav-link dropdown-toggle" data-toggle="dropdown"> <i
							class="fa-solid fa-circle-info">&nbsp;Center</i>
						</a>
						<div class="dropdown-menu">
							<a class="dropdown-item"
								href="${pageContext.request.contextPath}/member/Info.do">마이페이지</a>
						</div>
					</div>
				</li>


				<c:if test="${sessionScope.userid != null}">
					<li class="nav-item">
						<div class="nav-item">${sessionScope.userid}(${sessionScope.name})님
							환영합니다</div>
					</li>
				</c:if>
			</ul>
		</div>
	</nav>
	<script>
		// dropdown menu hover시 작동
		var $dropdown = $(".navbar-nav .nav-item .dropdown");
		var $dropdownToggle = $(".dropdown-toggle");
		var $dropdownMenu = $(".dropdown-menu");
		var showClass = "show";
		$(window).on("load resize", function() {
			if (this.matchMedia("(min-width: 768px)").matches) {
				$dropdown.hover(function() {
					var $this = $(this);
					$this.addClass(showClass);
					$this.find($dropdownToggle).attr("aria-expanded", "true");
					$this.find($dropdownMenu).addClass(showClass);
				}, function() {
					var $this = $(this);
					$this.removeClass(showClass);
					$this.find($dropdownToggle).attr("aria-expanded", "false");
					$this.find($dropdownMenu).removeClass(showClass);
				});
			} else {
				$dropdown.off("mouseenter mouseleave");
			}
		});
	</script>
	<!-- 상단부
 -->
	<div id="carouselExampleIndicators"
		class="carousel carousel-dark slide" data-bs-ride="carousel"
		style="max-with: 100vh; max-height: 100vh;">
		<div class="carousel-indicators">
			<button style="background-color: white" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
				class="active" aria-current="true" aria-label="Slide 1"></button>
			<button style="background-color: white" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
				aria-label="Slide 2"></button>
			<button style="background-color: white" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
				aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner" style="text-align: center;">
			<div class="carousel-item active">
				<img
					src="${pageContext.request.contextPath}/resources/images/aa.jpg"
					class="d-b lock w-70">
				<h5></h5>
			</div>
			<div class="carousel-item">
				<img
					src="${pageContext.request.contextPath}/resources/images/bb.png"
					class="d-b lock w-70">
				<h5></h5>
			</div>
			<div class="carousel-item">
				<img
					src="${pageContext.request.contextPath}/resources/images/cc.png"
					class="d-b lock w-70">
				<h5></h5>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
</div>
<c:import url="include/footer.jsp" />
</body>
</html>
