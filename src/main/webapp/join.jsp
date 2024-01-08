<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="js/jquery.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="jumbotron">
		<div class="container">
			<h1>회원가입</h1>
			<form action="joinOK.do" method="post" class="was-validated">
				<div class="form-group">
					<div>이름</div>
					<input type="text" name="name" id="name" class="form-control"
						required>
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>
				<div class="form-group">
					<div>아이디</div>
					<input type="text" name="id" id="id" class="form-control" required>
					<div id="idValid" class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>
				<div class="form-group">
					<div>닉네임</div>
					<input type="text" name="nickname" id="nickname"
						class="form-control" required>
					<div id="nicknameValid" class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>
				<div class="form-group">
					<div>비밀번호</div>
					<input type="password" name="password" id="password"
						class="form-control" required>
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>
				<div class="form-group">
					<div>비밀번호 확인</div>
					<input type="password" name="passwordChk" id="passwordChk"
						class="form-control" required>
					<div id="passwordValid" class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>
				<div class="form-group">
					<div>이메일</div>
					<input type="email" name="email" id="email"
						class="form-control" required>
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>
				<div class="form-group">
					<div>나이</div>
					<input type="text" name="age" id="age">
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
	</div>
	<script>
		$('#id').on('focusout keyup', function(){
			let id = $('#id').val();
			
			$.ajax({
				url : "idCheck.do",		// 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				type:  "post",			// HTTP 요청방식 (get/post)
				data: {"id": id},			// HTTP 요청과 함께 서버로 보낼 데이터
				dataType: 'text',		// 서버에서 보내줄 데이터의 타입
				// 성공적으로 값을 서버로 보냈을 경우 처리하는 코드
				success: function(result){
					if(result != 0){
						$("#idValid").html('사용할 수 없는 아이디 입니다.');
						$("#idValid").addClass('text-danger');
						$("#id").addClass('border-danger');
					}else{
						$("#idValid").html('사용할 수 있는 아이디 입니다.');
						$("#idValid").removeClass('text-danger');
						$("#id").removeClass('border-danger');
					}
				},
				error:function(){
					alert("서버요청실패");
				}
			})
		})
		
		$('#nickname').on('focusout keyup', function(){
			let nickname = $('#nickname').val();
			
			$.ajax({
				url : "nicknameCheck.do",		// 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
				type:  "post",			// HTTP 요청방식 (get/post)
				data: {"nickname": nickname},			// HTTP 요청과 함께 서버로 보낼 데이터
				dataType: 'text',		// 서버에서 보내줄 데이터의 타입
				// 성공적으로 값을 서버로 보냈을 경우 처리하는 코드
				success: function(result){
					if(result != 0){
						$("#nicknameValid").html('사용할 수 없는 닉네임 입니다.');
						$("#nicknameValid").addClass('text-danger');
						$("#nickname").addClass('border-danger');
					}else{
						$("#nicknameValid").html('사용할 수 있는 닉네임 입니다.');
						$("#nicknameValid").removeClass('text-danger');
						$("#nickname").removeClass('border-danger');
					}
				},
				error:function(){
					alert("서버요청실패");
				}
			})
		})
		
		$('#passwordChk').on('focusout',function(){
			let passwordChk = $('#passwordChk').val();
			let password = $('#password').val();
			if(passwordChk!=password){
				$("#passwordValid").html('비밀번호가 일치하지 않습니다.');
				$("#passwordValid").addClass('text-danger');
				$("#passwordChk").addClass('border-danger');
			}else{
				$("#passwordValid").html('비밀번호가 일치합니다.');
				$("#passwordValid").removeClass('text-danger');
				$("#passwordChk").removeClass('border-danger');
			}
		})
	</script>
</body>
</html>