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
<link rel="stylesheet" href="css/storeDetail.css">
<script src="js/jquery.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-sm back" style="background-color:white">
			<header>
				<div>
					<a href="search.do?searchKeyWord=${storeInfo.searchKeyWord}" style="margin-right:20px"> <img src="img/뒤로가기.png" alt"">
					</a>
					<a href="index.do"><img src="img/홈.png" alt=""></a>
				</div>
				<div>
					<a href="#" style="margin-right:20px"><img src="img/북마크.png" alt=""></a>
					<a href="#"><img src="img/공유.png" alt=""></a>
				</div>				
			</header>
		</nav>
	</div>
	<div class="container">
	    <div class="store-pic">
	        <img src="img음식점/${storeInfo.pic}" alt="" style="width:70%;height:300px">
	    </div>
	    <div class="store-detail">
	        <p>${storeInfo.genre} | ${storeInfo.address}</p>
	        <h3>${storeInfo.sname}</h3>
	        <div>
	            <span class="star">★</span>
	            <span class="review">리뷰</span>
	        </div>
	        <div class="store-desc">${storeInfo.storeDesc}</div>
	    </div>
	</div>
	<div class="container fixed-bottom">
		<c:choose>
			<c:when test="${storeInfo.waitNum eq '1'}">
				<form action ="book.do" method="post">
					<input type="hidden" name="sname" value="${storeInfo.sname}">
					<input type="submit" value="줄서기">
				</form>		
			</c:when>
			<c:otherwise>
				<form action ="book.do" method="post">
					<input type="hidden" name="sname" value="${storeInfo.sname}">
					<input type="submit" value="바로 입장 가능합니다." disabled>
				</form>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>