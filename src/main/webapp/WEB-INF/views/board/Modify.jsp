<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify</title>
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
$(function(){
	
	$("#submit").on('click' , function(){
		
		let title = $("#title").val();
		let content = $("#content").val();
		
		if(title == ""){
			alert("작성하지 않은 부분이 있습니다.");
			$("#title").focus();
			return false;	
			
		}else if(content == ""){
			alert("작성하지 않은 부분이 있습니다.");
			$("#content").focus();
			return false;	
			
		}
	}
}
</script>
<body class="text-center">
	<c:if test="${sessionScope.userid == null}">
		<script>
			alert("로그인을 해주세요");
			location.href = "${pageContext.request.contextPath}/home.do";
		</script>
	</c:if>
	<c:import url="../include/top.jsp" />
	<form class="form-data" id="form"
		action="${pageContext.request.contextPath}/board/Update.do"
		method="post" enctype="multipart/form-data">
		<input type="hidden" name="nowPage" value="${pageMaker.page}">
		<input type="hidden" name="cntPerPage" value="${pageMaker.PerPageNum}">
		<input type="hidden" name="bidx" value="${vo.bidx}">

		<div class="container">
			<!-- 제목 -->
			<div class="form-group">
				<div class="input-group col-12">
					<input type="text" class="form-control col-10" id="title"
						placeholder="제목을 입력하세요" name="title"
						aria-label="Recipient's username" aria-describedby="button-addon2"
						value="${vo.title}">
					<!-- 작성자 -->
					<input type="text" class="form-control col-2" id="member_id"
						placeholder="작성자" readonly="readonly"
						value="${sessionScope.userid}" name="member_id"
						aria-label="Recipient's username" aria-describedby="button-addon2" ><br>
				</div>


				<!--  -->
				<div>
					<textarea style="height: 400px;" class="form-control"
						name="content" rows="" cols="" id="content">${vo.content}</textarea>
					<div id="content_result"></div>
					<input type="file"
						accept='image/jpg,impge/png,image/jpeg,image/gif'
						class="bg-light form-control" multiple="multiple" name="files"
						value="${vo.member_id }"> <img alt=""
						src="${pageContext.request.contextPath}/resources/images/${vo.filename}">
				</div>
			</div>

			<div class="form-group pt-1 text-right">

				<input class="btn btn-outline-secondary" id="submit" type="submit"
					value="글작성" /> <input class="btn btn-outline-secondary"
					type="button" value="돌아가기"
					onclick="location.href='${pageContext.request.contextPath}/board/List.do'" />

			</div>
		</div>
	</form>
</body>
</html>