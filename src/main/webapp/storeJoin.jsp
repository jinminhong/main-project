<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<link href="css/join.css">
</head>
<body style="font-family: insungitCutelivelyjisu">
	<div class="jumbotron">
		<div class="container">
			<h1>회원가입</h1>
			<form action="storeJoinOK.do" method="post" class="was-validated">
				<div class="form-group">
					<div>가게 이름</div>
					<input type="text" name="sname" id="sname" class="form-control"
						required>
					<div class="valid-feedback">Valid.</div>
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
					<div>가게 설명</div>
					<input type="text" name="storeDesc" id="storeDesc" class="form-control"
						required>
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>
				<div class="form-group">
					<div>자리 수</div>
					<input type="text" name="spaces" id="spaces" class="form-control"
						required>
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>
				<div class="form-group">
					<div>메뉴 1</div>
					<input type="text" name="menu" id="menu1"
						class="form-control" required>
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
					<div>메뉴 설명</div>
					<input type="text" name="menuInfo" id="menu1Info"
						class="form-control" required>
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
					<div>메뉴 가격</div>
					<input type="text" name="menuPrice" id="menu1Price"
						class="form-control" required>
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>
				
				
				 <div id="dynamicMenuFields">
                <!-- 동적으로 추가될 메뉴 필드들이 여기에 들어갑니다 -->
            </div>
				 <button type="button" id="addMenu" class="btn btn-link">메뉴 추가</button><br><br>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
	</div>
	<script>
	$(function () {
			var i=1;
		$("#addMenu").click(function() {
			i++;
			console.log(i);
			 var newMenuField = '<div class="form-group">' +
		        '<div>메뉴' + i + '</div>' +
		        '<input type="text" name="menu" class="form-control" required>' +
		        '<div class="valid-feedback">Valid.</div>' +
		        '<div class="invalid-feedback">Please fill out this field.</div>' +
		        '<div>메뉴 설명</div>' +
		        '<input type="text" name="menuInfo" class="form-control" required>' +
		        '<div class="valid-feedback">Valid.</div>' +
		        '<div class="invalid-feedback">Please fill out this field.</div>' +
		        '<div>메뉴 가격</div>' +
		        '<input type="text" name="menuPrice" class="form-control" required>' +
		        '<div class="valid-feedback">Valid.</div>' +
		        '<div class="invalid-feedback">Please fill out this field.</div>' +
		        '</div>';
         
         $("#dynamicMenuFields").append(newMenuField);
        	
    	});
	})

	</script>
</body>
</html>