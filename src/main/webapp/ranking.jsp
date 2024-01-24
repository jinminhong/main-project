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

<script src="js/jquery.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="css/bookMark.css">
</head>
<body>

	<div class="container fixed-top" style="background-color: white">
		<nav class="navbar navbar-expand-sm back">
			<header>
				<a href="index.do"> <img src="img/뒤로가기.png"alt"">
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
	<div class="container" id="store-container" style="margin-top: 300px">
		<c:forEach var="rankingList" varStatus="status" items="${rankingList}">
			<input type="hidden" name="rankingList${status.index}"
				class="rankingList" value="${rankingList.sname}">
			<div class="${rankingList.sname}">${status.index+1}등</div>
		</c:forEach>
	</div>
	<script type="text/javascript"
		src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=7a8568101b200df8af87438da11f7da1&libraries=services"></script>
	<script>
		$(function() {
			$('.rankingList').each(function(index, element) {
				console.log(element.value)
				var ps = new kakao.maps.services.Places();

				// 키워드로 장소를 검색합니다
				ps.keywordSearch(element.value, placesSearchCB);

				// 키워드 검색 완료 시 호출되는 콜백함수 입니다
				function placesSearchCB(data, status, pagination) {
					if (status === kakao.maps.services.Status.OK) {

					}
					console.log(data);
					createAndAppendStoreNodes(data);
				}
			})
			function createAndAppendStoreNodes(data) {
				var category_name = data[0].category_name.split('>').pop();
				let sname = data[0].place_name;

				//ajax로 db랑 통신해서 뽑아내자.
				$
						.ajax({
							url : "storeCheck.do",
							type : "post",
							data : {
								"sname" : sname
							},
							dataType : 'json',
							success : function(result) {
								console.log(result.pic);
								if (result != 0) {
									let spaces = Number(result.spaces);
									let waitingNum = Number(result.waitingNum);
									console.log(result.waitingNum);
									let spacesInput;
									if (spaces > 0 & waitingNum == 0) {
										spacesInput = "현재 바로 입장가능합니다.";
										var storeNode = $('<div class="store-container" style="display:flex; margin-bottom: 20px; width: 100%;justify-content: space-between;">'
												+ '<a href="storeDetail.do?sname='
												+ sname
												+ '&genre='
												+ category_name
												+ '&address='
												+ data[0].road_address_name
												+ '&phone='
												+ data[0].phone
												+ '" style="text-decoration-line: none; color:black; width: 70%;">'
												+ '<div class="store-list" style="display:flex; width: 100%;">'
												+ '<div class="store-img" style="margin-right: 20px; width: 200px; height: 300px;"><img style="width:200px; height:100%" alt="" src="img음식점/'
												+ result.pic
												+ '"></div>'
												+ '<div class="store-detail" style="width: 100%;">'
												+ '<div class="place_name"><h3>'
												+ data[0].place_name
												+ '</h3></div>'
												+ '<div class="category_name">'
												+ category_name
												+ '</div>'
												+ '<div class="phone">'
												+ data[0].phone
												+ '</div>'
												+ '<div class="road_address_name">'
												+ data[0].road_address_name
												+ '</div>'
												+ '</div>'
												+ '</div></a>'
												+ '<div class="additional-info" style="width: 200px; margin-left: 20px;">'
												+ '<p style="text-align:center">'
												+ spacesInput
												+ '</p>'
												+ '</div>' + '</div>');
									} else {
										spacesInput = Math.abs(spaces);
										var storeNode = $('<div class="store-container" style="display:flex; margin-bottom: 20px; width: 100%;justify-content: space-between;">'
												+ '<a href="storeDetail.do?sname='
												+ sname
												+ '&genre='
												+ category_name
												+ '&address='
												+ data[0].road_address_name
												+ '&phone='
												+ data[0].phone
												+ '" style="text-decoration-line: none; color:black; width: 70%;">'
												+ '<div class="store-list" style="display:flex; width: 100%;">'
												+ '<div class="store-img" style="margin-right: 20px; width: 200px; height: 300px;"><img style="width:200px; height:100%" alt="" src="img음식점/'
												+ result.pic
												+ '"></div>'
												+ '<div class="store-detail" style="width: 100%;">'
												+ '<div class="place_name"><h3>'
												+ data[0].place_name
												+ '</h3></div>'
												+ '<div class="category_name">'
												+ category_name
												+ '</div>'
												+ '<div class="phone">'
												+ data[0].phone
												+ '</div>'
												+ '<div class="road_address_name">'
												+ data[0].road_address_name
												+ '</div>'
												+ '</div>'
												+ '</div></a>'
												+ '<div class="additional-info" style="width: 200px; margin-left: 20px;">'
												+ '<p style="text-align:center">'
												+ Number(result.waitingNum)
												+ '명 대기중입니다.</p>'
												+ '<form action="book.do" method="post">'
												+ '<input type="hidden" name="date">'
												+ '<input type="hidden" name="sname" value="'+sname+'">'
												+ '<input type="hidden" name="memberNum">'
												+ '<input type="submit" value="줄서기" style="background-color:red;width:100%">'
												+ '</form>'
												+ '</div>'
												+ '</div>');
									}
									str = sname.replaceAll(" ",".");
									// 생성한 노드를 container 안에 추가
									$("div." + str).append(storeNode);
									console.log("성공" + "div." + str);
								} else {
									console.log("없음");
								}
							},
							error : function() {
								console.log("서버요청실패");
							}
						})
			}
		})
	</script>
</body>
</html>