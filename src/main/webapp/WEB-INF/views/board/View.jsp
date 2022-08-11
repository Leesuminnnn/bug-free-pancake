<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View</title>
<c:import url="${pageContext.request.contextPath}/resources/css/self.css"/>
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
<script>
	$(function() {
		$("#modi").click(function() {
			location.replace('${pageContext.request.contextPath}/board/Modify.do/${vo.bidx}?page=${pageMaker.cri.page}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}');
		});
	});
	$(function(){
		$("#del").click(function(){
			var result = confirm("삭제하시겠습니까?");
			
			if(result){
				location.replace('${pageContext.request.contextPath}/board/Delete.do/${vo.bidx}');
			}else{
				
			}
		});
	});
</script>
<body class="text-center">
	<c:import url="../include/top.jsp" />
	<form class="form-data" method="post">
		<input type="hidden" name="type" value="${pageMaker.cri.type}">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		<input type="hidden" name="page" value="${pageMaker.cri.page}">
		<input type="hidden" name="PerPageNum"
			value="${pageMaker.cri.perPageNum}"> <input type="hidden"
			name="bidx" value="${vo.bidx}">
	</form>
	<div class="container">
		게시판 상세보기
		<div class="form-group row">
			<div class="col-2"></div>
			<div class="col-8">
				<div class="input-group">
					<c:if test="${ct_idx == 2 }">
					</c:if>
					<div class="form-control col-auto" aria-describedby="button-addon2">${vo.title}</div>
					<div class="form-control col-2">${vo.member_id}</div>
					<div class="form-control col-2">
						<fmt:formatDate pattern="yyyy-MM-dd" value="${vo.regdate}" />
					</div>
				</div>
				<div style="height: 400px; text-align: left;" class="form-control">

					<br /> ${vo.content} <br />
					<!-- 만약 이미지가 없을 때 엑박 처리되는 형상 제거 -->
					<c:choose>
						<c:when
							test="${vo.filename == '-' or vo.filename == 'noimg' or vo.filename == 'null'}">
							<div style="display: none;">
								<img
									src="${pageContext.request.contextPath}/resources/images/${vo.filename}"
									id="filename" width="300px" height="300px" />
							</div>
						</c:when>
						<c:when test="${vo.filename != null}">
							<div>
								<img
									src="${pageContext.request.contextPath}/resources/images/${vo.filename}"
									id="filename" width="300px" height="300px;" /><br />
							</div>
						</c:when>
					</c:choose>
				</div>

			</div>


		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<input class="btn btn-outline-secondary" type="button" value="돌아가기"
						onclick="location.href='${pageContext.request.contextPath}/board/List.do'" />
					<button class="btn btn-outline-secondary" id="modi">수정하기</button>
					<button class="btn btn-outline-secondary" id="del">삭제하기</button>
				</div>
			</div>
			<div class="col-2"></div>
		</div>
	</div>

</body>
</html>