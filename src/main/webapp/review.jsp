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
<link rel="stylesheet" href="css/review.css" />
</head>
<body>
	<div class="container" style="display:flex;align-items: center;margin-bottom:50px">
		<a href="index.do" style="margin-right:20px"><img src="img/뒤로가기.png" alt=""></a>
		<h2>리뷰 쓰러가기</h2>
	</div>
	<div class="container">
		<h2 class="title">${user.nickname}님 만족하신 식당의 리뷰를 써주세요</h2>
			<div class="eatStore-list" >
				<div style="display:flex;align-items: center;justify-content: space-around;margin-bottom:30px">
					<div><h2>가게 이름</h2></div>
					<div><h2>날짜</h2></div>
					<div><h2></h2></div>
				</div>
				<c:forEach var="reviewList" items = "${reviewList}">
					<div style="display:flex;align-items: center;justify-content: space-around;margin-bottom:30px">
						<div><h2>${reviewList.sname}</h2></div>
						<div><h2>${reviewList.waitingtime}</h2></div>
						<div><h2><a href="storeReview.do?sname=${reviewList.sname}&no=${reviewList.no}">리뷰 쓰러가기</a></h2></div>
					</div>
				</c:forEach>
			</div>
	</div>
</body>
</html>