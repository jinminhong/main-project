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
<style>
	.navbar-nav > li
{

padding-left:40px;

padding-right:40px;

}
.sticky-top {
      padding: 10px; /* 여백 추가 */
      position: -webkit-sticky;
      position: sticky;
      top: 56px; /* 상단 Navbar의 높이만큼 여백 추가 */
      z-index: 1000; /* 다른 콘텐츠 위에 표시되도록 z-index 설정 */
    }
</style>
<body>
	<input id = "inputSname" type="hidden" value="${param.sname}">
	<input id="inputAddress" type="hidden" value="${param.address}">
	<input id = "inputId" type="hidden" value="${user.id}">
	<div class="container fixed-top">
		<nav class="navbar navbar-expand-sm back" style="background-color:white">
			<header>
				<div>
					<a href="javascript:history.back()" style="margin-right:20px"> <img src="img/뒤로가기.png" alt"">
					</a>
					<a href="index.do"><img src="img/홈.png" alt=""></a>
				</div>
				<div>
					<a href="#" id="bookMark" style="margin-right:20px"><img src="img/북마크.png" alt=""></a>
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
	        <div class="store-info" style="display:flex">
	        	<div class="store-phone">
	        		<a href="#">전화</a>
	        	</div>
	        	<span>|</span>
	        	<div class="store-location">
	        		<a href="#">위치</a>
	        	</div>
	        	<span>|</span>
	        	<div class="store-allAbout">
	        		<a href="#">매장정보</a>
	        	</div>
	        </div>
	    </div>
	</div>
	<div class="container">
		<hr>
	</div>
	<div class="container sticky-top">
		<nav class="navbar navbar-expand-sm sticky-top justify-content-center">
	  		<ul class="navbar-nav">
	  			<li class="nav-item ">
			  		<a class="nav-link text-dark" href="#">홈</a>
	  			</li>
	  			<li class="nav-item ">
			  		<a class="nav-link text-dark" href="#">메뉴</a>
	  			</li>
	    		<li class="nav-item">
		     		<a class="nav-link text-dark" href="#">리뷰</a>
	    		</li>
	    		<li class="nav-item">
		      		<a class="nav-link text-dark" href="#">사진</a>
	    		</li>
	  		</ul>
		</nav>
	</div>
	<div class="container">
		<hr>
	</div>
	<div class="container">
		<div class="store-menu">
			<h1>메뉴</h1>
			<hr>
			<c:forEach var="menu" items="${menu}">
				<div>
					<div style="display:flex;justify-content: space-between;">
						<p>${menu.foodname}</p>
						<p>${menu.foodprice}</p>
					</div>
					<div>
						<p>${menu.foodInfo}</p>
					</div>			
				</div>			
			</c:forEach>
			<hr>
		</div>
		<div class="store-review">
			<h1>리뷰</h1>
			<hr>
				<div class="star"><img src="img/별.png">${storeInfo.avg_star}</div>
				<div class="reviews" style="display:flex">
					<c:forEach var="review" items="${review}">
						<div class="personal-review" style="margin-right:10px">
							<div class="review-img"><img src="${review.review_img}" alt=""></div>
							<div class="review-id-star" style="display:flex;justify-content: space-between;">
								<div class="review-id">${review.id}</div>
								<div class="review-star"><img src="img/별.png">${review.star}</div>
							</div>
							<div class="review-review">${review.review }</div>
						</div>
					</c:forEach>
				</div>
			<hr>
		</div>
		
		<div class="store-place">
			<h1>위치</h1>
			<div id="map" style="width:100%;height:350px;"></div>
			
		</div>
	</div>
	<div class="container fixed-bottom">
		<c:choose>
			<c:when test="${storeInfo.spaces le '0'}">
				<form action ="book.do" method="post">
					<input type="hidden" name="sname" value="${storeInfo.sname}">
					<input type="submit" value="줄서기" style="width:100%;background-color:red">
				</form>		
			</c:when>
			<c:otherwise>
				<form action ="book.do" method="post">
					<input type="hidden" name="sname" value="${storeInfo.sname}">
					<input type="submit" value="바로 입장 가능합니다." style="width:100%" disabled>
				</form>
			</c:otherwise>
		</c:choose>
	</div>
</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a8568101b200df8af87438da11f7da1&libraries=services"></script>
<script>
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 
var inputSname = $("#inputSname").val();
var inputAddress = $("#inputAddress").val();
var words = inputAddress.split(" ");
console.log(inputAddress);
console.log(inputSname+" "+inputAddress);
// 키워드로 장소를 검색합니다
ps.keywordSearch(inputSname+words[2], placesSearchCB);

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
console.log(inputSname);
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}
</script>
<script>
	$(function(){
		let id = $('#inputId').val();
		let sname = $('#inputSname').val();
		$.ajax({
	        url:"bookMark1.do",
	        type:"post",
	        data:{"sname":sname,"id":id},
	        dataType:'text',
	        success: function(data){
	        	console.log(data+"load");
	        	if(data==0){
	        		$("#bookMark > img").attr("src", "img/북마크 했을 때.png");
	        	}else{
	        		$("#bookMark > img").attr("src","img/북마크.png");
	        	}
	        }
		})
		$("#bookMark").on("click",function(){
			$.ajax({
		        url:"bookMark.do",
		        type:"post",
		        data:{"sname":sname,"id":id},
		        dataType:'text',
		        success: function(data){
		        	console.log(data);
		        	if(data==1){
		        		$("#bookMark > img").attr("src", "img/북마크 했을 때.png");
		        	}else{
		        		$("#bookMark > img").attr("src","img/북마크.png");
		        	}
		        }
			})
		})
	})
</script>
</html>