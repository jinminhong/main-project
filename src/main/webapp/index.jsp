<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="js/jquery.js"></script>
<script src="js/project.js"></script>
<link rel="stylesheet" href="css/project.css" />
</head>
<body>
	<c:if test="${reviewMessage ne null }">
		<script>
			alert("리뷰 작성 완료");
		</script>
	</c:if>
	<c:if test="${message ne null}">
		<script>
			alert("아이디 비번이 맞지 않거나 없습니다");
		</script>
	</c:if>
	<c:if test="${messageLogin ne null }">
		<script>
			alert("로그인 후 이용해주세요");
		</script>
	</c:if>
	<c:if test="${bookOKMessage ne null}">
		<script>
			alert("웨이팅 등록이 완료되었습니다.")
		</script>
	</c:if>
	<c:choose>
		<c:when test="${user.id eq null}">
	<div id="header">
		<div id="logo">
			<h1>꿀맛</h1>
		</div>
		<div id="search">
			<form action="search.do" method="post">
				<input type="text" name="searchKeyWord" id="searchBox" placeholder="지역이나 맛집을 검색하세요" >
				<input type="submit" value="검색" id="searchSubmit" >
			</form>
		</div>
		<div id="profile">
			<img src="img/프로필.png" alt=""/>
		</div>
	</div>
	</c:when>
	<c:otherwise>
	<div id="header">
		<div id="logo">
			<h1>꿀맛</h1>
		</div>
		<div id="search">
			<form action="search.do" method="post">
				<input type="text" name="searchKeyWord" id="searchBox" placeholder="지역이나 맛집을 검색하세요" >
				<input type="submit" value="검색" id="searchSubmit">
			</form>
		</div>
		<div id="profile">
			<img src="img/프로필.png" alt=""/>
		</div>
	</div>
	</c:otherwise>
	</c:choose>
	<div id="menu">
		<table>
			<tr>
				<td>
					<a href="myLocation.do">
						<img src="img/위치.png" alt="" class="menuImg"/>
						<p>내 주변</p>
					</a>
				</td>
				<td>
					<a href="bookMarkUser.do?id=${user.id}">
						<img src="img/찜.png" alt="" class="menuImg"/>
						<p>찜</p>
					</a>
				</td>
				<td>
					<a href="">
						<img src="img/추천.png" alt="" class="menuImg"/>
						<p>메뉴 추천</p>
					</a>
				</td>
				<td>
					<a href="">
						<img src="img/확성기.png" alt="" class="menuImg"/>
						<p>lucky day</p>
					</a>
				</td>
				<td>
					<a href="">
						<img src="img/랭킹.png" alt="" class="menuImg"/>
						<p>랭킹</p>
					</a>
				</td>
			</tr>
			<tr>
				<td>
					<a href="search.do?searchKeyWord=pizza">
						<img src="img/피자.png" alt="" class="menuImg"/>
						<p>피자</p>
					</a>
				</td>
				<td>
					<a href="search.do?searchKeyWord=pasta">
						<img src="img/파스타.png" alt="" class="menuImg"/>
						<p>파스타</p>
					</a>
				</td>
				<td>
					<a href="search.do?searchKeyWord=한식">
						<img src="img/비빔밥.png" alt="" class="menuImg"/>
						<p>한식</p>
					</a>
				</td>
				<td>
					<a href="search.do?searchKeyWord=중식">
						<img src="img/만두.png" alt="" class="menuImg"/>
						<p>중식</p>
					</a>
				</td>
				<td>
					<a href="search.do?searchKeyWord=일식">
						<img src="img/새우튀김.png" alt="" class="menuImg"/>
						<p>일식</p>
					</a>
				</td>
			</tr>
			<tr>
				<td>
					<a href="search.do?searchKeyWord=오마카세">
						<img src="img/초밥.png" alt="" class="menuImg"/>
						<p>오마카세</p>
					</a>
				</td>
				<td>
					<a href="search.do?searchKeyWord=우마카세">
						<img src="img/우마카세.png" alt="" class="menuImg"/>
						<p>우마카세</p>
					</a>
				</td>
				<td>
					<a href="search.do?searchKeyWord=다이닝">
						<img src="img/다이닝.png" alt="" class="menuImg"/>
						<p>다이닝</p>
					</a>
				</td>
				<td>
					<a href="search.do?searchKeyWord=케이크">
						<img src="img/케이크.png" alt="" class="menuImg"/>
						<p>케이크</p>
					</a>
				</td>
				<td>
					<a href="search.do?searchKeyWord=카페">
						<img src="img/카페.png" alt="" class="menuImg"/>
						<p>카페</p>
					</a>
				</td>
			</tr>
		</table>
	</div>
	<div id="banner">
            <div id="slideShow">
                <div class="slide">
                    <img src="img/배너-가을제철메뉴.webp" alt="" />
                </div>
                <div class="slide">
                    <img src="img/배너-기념일.webp" alt="" />
                </div>
                <div class="slide">
                    <img src="img/배너-불꽃축제명당맛집.webp" alt="" />
                </div>
                <div class="slide">
                    <img src="img/배너-음식취향.webp" alt="" />
                </div>
                <div class="slide">
                    <img src="img/배너-저장탑30.webp" alt="" />
                </div>
                <div class="slide">
                    <img src="img/배너-파인다이닝추천.webp" alt="" />
                </div>
                <div class="slide">
                    <img src="img/배너-호텔하이볼제공.webp" alt="" />
                </div>
                <div class="slide">
                    <img src="img/배너-히든플레이스.webp" alt="" />
                </div>
                <a class="prev">&#10094;</a>
                <a class="next">&#10095;</a>
            </div>
        </div>
        <div id="recommand-content">
            <div class="recommand-header">
                <div><h2>당신을 위한 추천 식당</h2></div>
            </div>
            <div class="recommand-main">
                <div class="rolling-list">
                    <ul>
                        <li class="recommand-store">
                            <div>
                                <img
                                    src="img음식점/1.jpg"
                                    alt=""
                                    style="width: 250px"
                                />
                            </div>
                            <div>
                                <h2 style="color: #ff3d00">4.4</h2>
                                <p>청담동</p>
                                <p>인기메뉴</p>
                                <p>다 맛있음</p>
                                <div
                                    style="
                                        display: flex;
                                        flex-direction: row;
                                        align-items: center;
                                    "
                                >
                                    <img src="img/눈.png" alt="" />
                                    <p>22130</p>
                                </div>
                            </div>
                        </li>
                        <li class="recommand-store">
                            <div>
                                <img
                                    src="img음식점/내주변 문화마을 서울.jpg"
                                    alt=""
                                    style="width: 250px"
                                />
                            </div>
                            <div>
                                <h2 style="color: #ff3d00">4.4</h2>
                                <p>청담동</p>
                                <p>인기메뉴</p>
                                <p>다 맛있음</p>
                                <div
                                    style="
                                        display: flex;
                                        flex-direction: row;
                                        align-items: center;
                                    "
                                >
                                    <img src="img/눈.png" alt="" />
                                    <p>22130</p>
                                </div>
                            </div>
                        </li>
                        <li class="recommand-store">
                            <div>
                                <img
                                    src="img음식점/2.jpg"
                                    alt=""
                                    style="width: 250px"
                                />
                            </div>
                            <div>
                                <h2 style="color: #ff3d00">4.4</h2>
                                <p>청담동</p>
                                <p>인기메뉴</p>
                                <p>다 맛있음</p>
                                <div
                                    style="
                                        display: flex;
                                        flex-direction: row;
                                        align-items: center;
                                    "
                                >
                                    <img src="img/눈.png" alt="" />
                                    <p>22130</p>
                                </div>
                            </div>
                        </li>
                        <li class="recommand-store">
                            <div>
                                <img
                                    src="img음식점/3.jpg"
                                    alt=""
                                    style="width: 250px"
                                />
                            </div>
                            <div>
                                <h2 style="color: #ff3d00">4.4</h2>
                                <p>청담동</p>
                                <p>인기메뉴</p>
                                <p>다 맛있음</p>
                                <div
                                    style="
                                        display: flex;
                                        flex-direction: row;
                                        align-items: center;
                                    "
                                >
                                    <img src="img/눈.png" alt="" />
                                    <p>22130</p>
                                </div>
                            </div>
                        </li>
                        <li class="recommand-store">
                            <div>
                                <img
                                    src="img음식점/4.jpg"
                                    alt=""
                                    style="width: 250px"
                                />
                            </div>
                            <div>
                                <h2 style="color: #ff3d00">4.4</h2>
                                <p>청담동</p>
                                <p>인기메뉴</p>
                                <p>다 맛있음</p>
                                <div
                                    style="
                                        display: flex;
                                        flex-direction: row;
                                        align-items: center;
                                    "
                                >
                                    <img src="img/눈.png" alt="" />
                                    <p>22130</p>
                                </div>
                            </div>
                        </li>
                        <li class="recommand-store">
                            <div>
                                <img
                                    src="img음식점/5.jpg"
                                    alt=""
                                    style="width: 250px"
                                />
                            </div>
                            <div>
                                <h2 style="color: #ff3d00">4.4</h2>
                                <p>청담동</p>
                                <p>인기메뉴</p>
                                <p>다 맛있음</p>
                                <div
                                    style="
                                        display: flex;
                                        flex-direction: row;
                                        align-items: center;
                                    "
                                >
                                    <img src="img/눈.png" alt="" />
                                    <p>22130</p>
                                </div>
                            </div>
                        </li>
                        <li class="recommand-store">
                            <div>
                                <img
                                    src="img음식점/6.jpg"
                                    alt=""
                                    style="width: 250px"
                                />
                            </div>
                            <div>
                                <h2 style="color: #ff3d00">4.4</h2>
                                <p>청담동</p>
                                <p>인기메뉴</p>
                                <p>다 맛있음</p>
                                <div
                                    style="
                                        display: flex;
                                        flex-direction: row;
                                        align-items: center;
                                    "
                                >
                                    <img src="img/눈.png" alt="" />
                                    <p>22130</p>
                                </div>
                            </div>
                        </li>
                        <li class="recommand-store">
                            <div>
                                <img
                                    src="img음식점/7.jpg"
                                    alt=""
                                    style="width: 250px"
                                />
                            </div>
                            <div>
                                <h2 style="color: #ff3d00">4.4</h2>
                                <p>청담동</p>
                                <p>인기메뉴</p>
                                <p>다 맛있음</p>
                                <div
                                    style="
                                        display: flex;
                                        flex-direction: row;
                                        align-items: center;
                                    "
                                >
                                    <img src="img/눈.png" alt="" />
                                    <p>22130</p>
                                </div>
                            </div>
                        </li>
                        <li class="recommand-store">
                            <div>
                                <img
                                    src="img음식점/8.jpg"
                                    alt=""
                                    style="width: 250px"
                                />
                            </div>
                            <div>
                                <h2 style="color: #ff3d00">4.4</h2>
                                <p>청담동</p>
                                <p>인기메뉴</p>
                                <p>다 맛있음</p>
                                <div
                                    style="
                                        display: flex;
                                        flex-direction: row;
                                        align-items: center;
                                    "
                                >
                                    <img src="img/눈.png" alt="" />
                                    <p>22130</p>
                                </div>
                            </div>
                        </li>
                        <li class="recommand-store">
                            <div>
                                <img
                                    src="img음식점/9.jpg"
                                    alt=""
                                    style="width: 250px"
                                />
                            </div>
                            <div>
                                <h2 style="color: #ff3d00">4.4</h2>
                                <p>청담동</p>
                                <p>인기메뉴</p>
                                <p>다 맛있음</p>
                                <div
                                    style="
                                        display: flex;
                                        flex-direction: row;
                                        align-items: center;
                                    "
                                >
                                    <img src="img/눈.png" alt="" />
                                    <p>22130</p>
                                </div>
                            </div>
                        </li>
                        <li class="recommand-store">
                            <div>
                                <img
                                    src="img음식점/10.jpg"
                                    alt=""
                                    style="width: 250px"
                                />
                            </div>
                            <div>
                                <h2 style="color: #ff3d00">4.4</h2>
                                <p>청담동</p>
                                <p>인기메뉴</p>
                                <p>다 맛있음</p>
                                <div
                                    style="
                                        display: flex;
                                        flex-direction: row;
                                        align-items: center;
                                    "
                                >
                                    <img src="img/눈.png" alt="" />
                                    <p>22130</p>
                                </div>
                            </div>
                        </li>
                        <li class="recommand-store">
                            <div>
                                <img
                                    src="img음식점/내주변 수묵당.jpg"
                                    alt=""
                                    style="width: 250px"
                                />
                            </div>
                            <div>
                                <h2 style="color: #ff3d00">4.4</h2>
                                <p>청담동</p>
                                <p>인기메뉴</p>
                                <p>다 맛있음</p>
                                <div
                                    style="
                                        display: flex;
                                        flex-direction: row;
                                        align-items: center;
                                    "
                                >
                                    <img src="img/눈.png" alt="" />
                                    <p>22130</p>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <c:choose>
        	<c:when test="${user.id eq null}">
        <div id="loginModal" class="modal" style="display: none;">
            <div class="modal-content">
                <h2>Login</h2>
                <form action="login.do" method="post">
                	<div>
	                    <label for="userId">UserId:</label><br>
	                    <input type="text" id="userId" name="id"><br>
	                    <label for="password">Password:</label><br>
	                    <input type="password" id="password" name="password"><br><br>                	
                	</div>
                	<div>
	                    <input type="image" src="img/커비.png" id="Login-btn">
                	</div>
                </form>
                <div id="join">
                	<a href="join.jsp">회원가입</a>
                </div>
            </div>
        </div>
        	</c:when>
        	<c:otherwise>
       	<div id="loginModal" class="modal" style="display: none;">
            <div class="modal-content">
                <div class="loginProfile">
                	<div>안녕하세요. ${user.nickname}님</div>
                	<div><a href="currentWaiting.do">웨이팅 현황</a></div>
                	<div><a href="review.do">리뷰 쓰러가기</a></div>
                	<div><a href="#">회원정보 수정</a></div>
                	<div><a href="logout.do">로그아웃</a></div>
                </div>
            </div>
        </div>
        	</c:otherwise>
        </c:choose>
       <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>