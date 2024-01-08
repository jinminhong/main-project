<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/locationMenu1.css">
<script src="js/jquery.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


<script
	src="
https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js
"></script>
<script src="js/search.js"></script>
<body>
	<div class="container fixed-top">
		<nav class="navbar navbar-expand-sm back">
			<header>
				<a href=""> <img src="img/뒤로가기.png"alt"">
				</a>
				<div>검색 결과</div>
			</header>
		</nav>
		<div class="detail-btn">
			<nav class="navbar navbar-expand-sm bg-light book-nav">
				<div class="book-btn">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="#">예약</a></li>
						<li class="nav-item"><a class="nav-link" href="#">픽업 예약</a></li>
						<li class="nav-item"><a class="nav-link" href="#">웨이팅</a></li>
					</ul>
				</div>
			</nav>
			<nav class="navbar navbar-expand-sm bg-light date-nav"
				style="border-top: 2px solid black">
				<div class="date-btn">
					<ul class="navbar-nav" id="selectDate">
						<li class="nav-item" style="border-right: 2px solid black"><a
							class="nav-link" href="#">오늘(금)</a></li>
						<li class="nav-item" style="border-right: 2px solid black"><a
							class="nav-link" href="#">오후 7:00</a></li>
						<li class="nav-item"><a class="nav-link" href="#">2명</a></li>
					</ul>
				</div>
			</nav>
			<nav class="navbar navbar-expand-sm bg-light place-nav"
				style="border-top: 2px solid black">
				<div class="place-btn">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="#"><img
								src="img/지도 접힌 모습.png" id="mapIcon"></a></li>
						<li class="nav-item" style="border-right: 2px solid black"><a
							class="nav-link" href="#"><img src="img/조절.png"
								id="adjustIcon"></a></li>
						<li class="nav-item"><a class="nav-link" href="#">내 주변</a></li>
						<li class="nav-item"><a class="nav-link" href="#">음식 종류</a></li>
						<li class="nav-item"><a class="nav-link" href="#">가격</a></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<div class="container">
		<div class="store-list">
			<c:forEach items="${storeList}" var="store"></c:forEach>
			<div class="store-img">
				<img alt="" src="${store.getPic}">
			</div>
		</div>
	</div>
	<!-- priceModal -->
	<div class="modal fade" id="modalPrice" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">가격</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="seek-bar-wrapper">
					<div class="seek-bar">
						<div class="circle" id="circle">
							<span>#</span>
						</div>
						<div class="circle" id="circle2">
							<span>#</span>
						</div>
					</div>
				</div>
				<div class="price-result">
					<div>
						<input type="text" placeholder="0" />만원
					</div>
					<div>~</div>
					<div>
						<input type="text" placeholder="40" />만원
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- member num Modal -->
	<div class="modal fade" id="memberNumModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div id="calendar"></div>
			</div>
		</div>
	</div>


</body>
</html>