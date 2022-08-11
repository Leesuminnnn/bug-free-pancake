<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
$(function(){
	
	$("#checkId").click(function(){
		
		let member_id = $("#member_id").val();
		if(member_id == ""){
			result = "아이디를 입력해주세요";
			$("#result_checkId").html(result).css("color", "red");
			$("#member_id").val("").trigger("focus");
			return false;
		}
		
		$.ajax({
			type:'post',
			url:"${pageContext.request.contextPath}/checkId.do",
			data: {"member_id":member_id},
			success: function(data){
				if(data == "N"){
					result = "사용 가능한 아이디입니다.";
					$("#result_checkId").html(result).css("color", "green");
					$("#member_pw").trigger("focus");
				}else{
					result = "이미 사용중인 아이디입니다.";
					$("#result_checkId").html(result).css("color", "red");
					$("#member_id").val("").trigger("focus");
				}
			},
			error: function(error){alert(error);}
		});
	
	});
});	

</script>
</head>
<body class="center">
	<c:import url="../include/top.jsp" />

	<div class="container">
		<div class="row">
			<div class="col-3"></div>
			<div class="col-6">
				<form
					action="${pageContext.request.contextPath}/member/JoinProcess.do"
					method="post">
					<table class="table table-hover">
						<tbody>
							<tr>
								<td style="width:120px;">이름</td>
								<td style="width:350px;"><input class="form-control" type="text"
									name="member_name" id="member_name">
								</td>
								<td>
								
								</td>
							</tr>
							<tr>
								<td>아이디</td>
								<td><div class="input-group"><input class="form-control" type="text"
									name="member_id" id="member_id">
									<input type="button" class="btn btn-outline-dark" id="checkId" value="중복체크"/></div>
								</td>
								<td>
									<div style="font-size:12px;" id="result_checkId" ></div>
								</td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td><input class="form-control" type="password"
									name="member_pw" id="member_pw">
								</td>
								<td>
								
								</td>
							</tr>
							<tr>
								<td>비밀번호확인</td>
								<td><input class="form-control" type="password"
									name="member_pw2" id="member_pw2">
								</td>
								<td>
								
								</td>
							</tr>
							
						</tbody>
					</table>
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<button type="submit" class="btn btn-outline-dark" id="submit">회원가입</button>
						<button type="button" class="btn btn-outline-dark"
							onclick="history.back();">돌아가기</button>
					</div>
				</form>

			</div>
			<div class="col-3"></div>
		</div>

	</div>
	<script>
$(function(){
	$("#submit").click(function(){
		let member_name = $("#member_name").val();
		let member_id = $("#member_id").val();
		let member_pw = $("#member_pw").val();
		let member_pw2 = $("#member_pw2").val();
		
		if(member_id == ""){
			alert("아이디를 입력해 주세요");
			$("#member_id").focus();
			return false;	
		}else if(member_pw == ""){
			alert("비밀번호를 입력해 주세요");
			$("#member_pw").focus();
			return false;	
		}else if(member_pw2 == ""){
			alert("비밀번호확인을 입력해 주세요");
			$("#member_pw2").focus();
			return false;	
		}else if(member_pw != member_pw2){
			alert("비밀번호와 비밀번호 확인 값이 다릅니다.");
			$("#member_pw2").focus();
			return false;
		}
	});
});
</script>
</body>
</html>