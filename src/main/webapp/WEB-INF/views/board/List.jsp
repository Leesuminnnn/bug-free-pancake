<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board</title>
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
</head>
<body class="text-center">
	<form method="post">
		<input type="hidden" name="type" value="${pageMaker.cri.type}">
		<input type="hidden" name="page" value="${pageMaker.cri.page}">
		<input type="hidden" name="perPageNum"
			value="${pageMaker.cri.perPageNum}">
	</form>
	<c:import url="../include/top.jsp" />
	<div class="container">
		게시판 리스트<br> 총 ${pageMaker.totalCount}개의 게시물
		<!-- 검색기능 -->
		<form class="navbar-form" autocomplete="off"
			action="${pageContext.request.contextPath}/board/List.do"
			method="get">
			<div class="input-group" style="display: flex;">
				<div class="form-group navbar-left" style="display: flex;">
					<select class="form-control" name="type" id="type"
						style="width: 150px;">
						<option value="title"
							<c:if test="${map.search_option == 'title'}">selected</c:if>>제목</option>
						<option value="content"
							<c:if test="${map.search_option == 'content'}">selected</c:if>>내용</option>
						<option value="all"
							<c:if test="${map.search_option == 'all'}">selected</c:if>>내용+제목</option>
					</select> <input type="text" class="form-control"
						aria-label="Recipient's username" aria-describedby="button-addon2"
						name="keyword" value="">
					<button class="btn btn-outline-dark" type="submit" id="btn_Search">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</div>
			</div>
		</form>
		<!-- 검색기능 끝 -->
		<table class="table table-hover">
			<tbody>
				<tr class="table-header">
					<td>번호</td>
					<td>제목</td>
					<td>작성일</td>
					<td>작성자</td>
				</tr>
				<c:forEach var="list" items="${list}">
					<tr>
						<td>${list.bidx}</td>
						<td class=""><a
							href="${pageContext.request.contextPath}/board/View.do/${list.bidx}?page=${pageMaker.cri.page}&type=${type}&keyword=${keyword}">${list.title}</a></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${list.regdate}" /></td>
						<td>${list.member_id}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<a href="${pageContext.request.contextPath}/board/Write.do"
				class="btn btn-outline-dark me-md-2">글쓰기</a>
		</div>
		<div class="example" style="display: block; text-align: center;">
			<nav aria-label="...">

				<ul class="pagination justify-content-center" id="pageInfo">
					<!-- 처음페이지로 이동하기 -->
					<c:choose>
						<c:when test="${pageMaker.cri.page != 1}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/board/List.do?page=${pageMaker.startPage - pageMaker.startPage}&perPageNum=${pageMaker.cri.perPageNum}&type=${type}&keyword=${keyword}">First</a>
							</li>
						</c:when>
					</c:choose>
					<!-- 이전페이지로 이동하기 -->
					<c:choose>
						<c:when test="${pageMaker.prev == true}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/board/List.do?page=${pageMaker.startPage - 1}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">Previous</a>
							</li>
						</c:when>
					</c:choose>
					<!-- 리스트 페이징 -->
					<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
						<c:choose>
							<c:when test="${num == pageMaker.cri.page}">
								<li class="page-item active"><a class="page-link"
									href="${pageContext.request.contextPath}/board/List.do?page=${num}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">${num}</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/board/List.do?page=${num}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">${num}</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- 다음 페이지로 이동하기 -->
					<c:choose>
						<c:when test="${pageMaker.next == true}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/board/List.do?page=${pageMaker.endPage + 1}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">Next</a>
							</li>
						</c:when>
					</c:choose>

					<!-- 마지막페이지로 이동하기 -->
					<c:choose>
						<c:when test="${pageMaker.cri.page < pageMaker.endPage}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/board/List.do?page=${pageMaker.endPage}&perPageNum=${pageMaker.cri.perPageNum}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">End</a>
							</li>
						</c:when>

					</c:choose>
				</ul>


			</nav>
		</div>
	</div>
</body>
</html>