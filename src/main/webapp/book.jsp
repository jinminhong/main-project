<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="js/jquery.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="css/book.css" />
<script src="js/book.js"></script>
</head>
<body>
	
	<div class="container" style="display:flex;align-items: center;margin-bottom:50px">
		<a href="search.do?searchKeyWord=${param.searchKeyWord}" style="margin-right:20px"><img src="img/뒤로가기.png" alt=""></a>
		<h2>방문인원 선택하기</h2>
	</div>
	<div class="container">
		<h2 style="text-align:center">방문 총 인원을 확인해주세요</h2>
		<div class="container mem-num">
				<form action="bookOK.do" method="post">
				<div class="adult" style="display:flex;justify-content: space-between;">
					<h3>성인</h3>
					<div>
						<a href="#" class="round-button" id="adult-desc">-</a>
		        		<span id="counterAdult">0</span>
		        		<input type="hidden" name="adultNum" id="adultNum" value="0">
		        		<a href="#"class="round-button" id="adult-asc">+</a>				
					</div>
				</div>
				<div class="baby" style="display:flex;justify-content: space-between;">
					<h3>유아</h3>	
					<div>
						<a href="#" class="round-button" id="baby-desc" >-</a>
		        		<span id="counterBaby">0</span>
		        		<input type="hidden" name="babyNum" id="babyNum" value="0">
		        		<a href="#" class="round-button" id="baby-asc">+</a>				
					</div>							
				</div>
				<input type="hidden" name="totalNum" id="totalNum" value="0">
				<input type="hidden" name="sname" value="${param.sname}">
				<div class="container fixed-bottom">
				<div style="display:flex;justify-content: space-between;">
					<h3>방문인원</h3>
					<h3 id="totalNumShow"></h3>
				</div>
					<input type="submit" value="등록" style="width:100%;background-color:#fc6868;height:60px">
				</div>				
				</form>
				<div class="container" style="margin-top: 50px">
					<div style="text-align:center;color:#fc6868;">
						<h3 style="margin-bottom:30px">현재 웨이팅</h3>
						<h3>${waitingNum}팀</h3>					
					</div>
				</div>
		</div>
	</div>
</body>
</html>