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
<!-- 서머노트를 위해 추가해야할 부분 -->
<script src="${pageContext.request.contextPath}/resources/js/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summernote/summernote-lite.css">
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
	});
});
</script>
</head>
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
					<textarea  id="summernote" class="summernote" name="content" style="text-align:left;">${vo.content}</textarea>
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
<script>
$(document).ready(function() {

	var toolbar = [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    ['insert',['picture','link','video']],
		    // 코드보기, 확대해서보기, 도움말
		    ['view', ['codeview','fullscreen', 'help']]
		  ];

	var setting = {
            height : 300,
            minHeight : null,
            maxHeight : null,
            focus : true,
            lang : 'ko-KR',
            toolbar : toolbar,
            callbacks : { //여기 부분이 이미지를 첨부하는 부분
            onImageUpload : function(files, editor,
            welEditable) {
            for (var i = files.length - 1; i >= 0; i--) {
            uploadSummernoteImageFile(files[i],
            this
            
            
            
            );
            		}
            	}
            }
         };

        $('#summernote').summernote(setting);
        });
function uploadSummernoteImageFile(file, el) {
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "${pageContext.request.contextPath}/uploadSummernoteImageFile",
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(data) {
			$(el).summernote('editor.insertImage', data.url);
		}
	});
}
</script>
</body>
</html>