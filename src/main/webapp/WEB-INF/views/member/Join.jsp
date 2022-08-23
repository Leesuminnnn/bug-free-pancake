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

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	//아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
	var idCheck = 0;
	var pwdCheck = 0;
	
	//아이디 체크하여 가입버튼 비활성화, 중복확인.
	function checkId() {
		
		var inputed = $('#member_id').val();
		console.log(inputed);
		$.ajax({
			type : 'post',
			data : {
				member_id : inputed
			},
			url : "${pageContext.request.contextPath}/checkId.do",
			success : function(data) {
				
				if (inputed == "" && data == 'N') {
					$("#submit").prop("disabled", true);	
					$("#member_id").css("background-color", "#FFCECE");
					idCheck = 0;
				} else if (data == 'N') {
					$("#member_id").css("background-color", "#B0F6AC");
					idCheck = 1;
					if (idCheck == 1 && pwdCheck == 1) {
						$("#submit").prop("disabled", false);
					}
				} else if (data == 'Y') {
					$("#submit").prop("disabled", true);
					$("#member_id").css("background-color", "#FFCECE");
					idCheck = 0;
				}
			}
		});
	}
	//재입력 비밀번호 체크하여 가입버튼 비활성화 또는 맞지않음을 알림.
	function checkPwd() {
		var inputed = $('#member_pw').val();
		var reinputed = $('#member_pw2').val();
		console.log(inputed);
		console.log(reinputed);
		if (reinputed == "" && (inputed != reinputed || inputed == reinputed)) {
			$("#submit").prop("disabled", true);
			$("#member_pw2").css("background-color", "#FFCECE");
		} else if (inputed == reinputed) {
			$("#member_pw2").css("background-color", "#B0F6AC");
			pwdCheck = 1;
			if (idCheck == 1 && pwdCheck == 1) {
				$("#submit").prop("disabled", false);
			}
		} else if (inputed != reinputed) {
			pwdCheck = 0;
			$("#submit").prop("disabled", true);
			$("#member_pw2").css("background-color", "#FFCECE");

		}
	}
</script>
<style>
</style>
</head>
<body class="center">
	<c:import url="../include/top.jsp" />

	<div class="container">
		<div class="row">
			<div class="col-3"></div>
			<div class="col-6">
				<div class="card p-4 p-md-4 my-4 mx-3 mx-md-0">
					<form
						action="${pageContext.request.contextPath}/member/JoinProcess.do"
						method="post" id="Joinform">
						<table class="table table-borderless">
							<tbody>
								<tr>
									<td style="width: 120px;">이름</td>
									<td style="width: 350px;"><input class="form-control"
										type="text" name="member_name" id="member_name" autofocus>
									</td>

								</tr>
								<tr>
									<td>아이디</td>
									<td>
										<div class="input-group">
											<input class="form-control" type="text" name="member_id"
												id="member_id" oninput="checkId()">
										</div>
									</td>

								</tr>
								<tr>
									<td>비밀번호</td>
									<td><input class="form-control" type="password"
										name="member_pw" id="member_pw" oninput="checkPwd()">
									</td>

								</tr>
								<tr>
									<td>비밀번호확인</td>
									<td><input class="form-control" type="password"
										name="member_pw2" id="member_pw2" oninput="checkPwd()">
									</td>

								</tr>

							</tbody>
						</table>

						<div class="d-grid gap-2 d-md-flex justify-content-md-end">
							<button type="submit" class="btn btn-outline-dark" id="submit" disabled="disabled">회원가입</button>
							<button type="button" class="btn btn-outline-dark"
								onclick="history.back();">돌아가기</button>
						</div>
					</form>

				</div>

			</div>

			<div class="col-3"></div>
		</div>

	</div>



	<script>
		$(function() {
			$("#submit").click(function() {
				let member_name = $("#member_name").val();
				let member_id = $("#member_id").val();
				let member_pw = $("#member_pw").val();
				let member_pw2 = $("#member_pw2").val();

				if (member_id == "") {
					alert("아이디를 입력해 주세요");
					$("#member_id").focus();
					return false;
				} else if (member_pw == "") {
					alert("비밀번호를 입력해 주세요");
					$("#member_pw").focus();
					return false;
				} else if (member_pw2 == "") {
					alert("비밀번호확인을 입력해 주세요");
					$("#member_pw2").focus();
					return false;
				} else if (member_pw != member_pw2) {
					alert("비밀번호와 비밀번호 확인 값이 다릅니다.");
					$("#member_pw2").focus();
					return false;
				}
			});
		});
	</script>
	<c:import url="../include/footer.jsp" />
</body>
</html>