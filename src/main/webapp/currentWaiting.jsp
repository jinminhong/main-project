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
<link rel="stylesheet" href="css/currentWaiting.css" />
</head>
<body>
	<div class="container" style="display:flex;align-items: center;margin-bottom:50px">
		<a href="index.do" style="margin-right:20px"><img src="img/뒤로가기.png" alt=""></a>
		<h2>웨이팅 정보 확인</h2>
	</div>
	<div class="container">
		<h2 class="title" >${user.nickname}님의 웨이팅을 확인하세요</h2>
			<div class="waiting-list" >
				<div>
				<c:forEach var="waitingList" items="${waitingList}">
					<h2 class="waiting-store">${waitingList.sname}가게의 웨이팅 번호는</h2>				
				</c:forEach>
				</div>
				<div>
				<c:forEach var="waitingNum" items="${waitingNum}">
					<h2 class="waiting-num">${waitingNum}번 입니다</h2>
				</c:forEach>
				</div>
			</div>
	</div>
</body>
</html>