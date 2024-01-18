<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>

<link href="css/storeOnly.css">
<script src="js/jquery.js"></script>

</head>
<body>
	<c:choose>
		<c:when test="${store.sname eq null}">
			<div id="login" style="position: absolute;left: 50%;top: 50%;transform:translate(-50%,-50%);">
				<form action="storeLogin.do" method="post" style="display:flex; width:500px">
					<div>
	                    <label for="sname">Store name:</label><br>
	                    <input type="text" id="sname" name="sname" style="height:40px;width:250px;border:1px solid black"><br>
	                    <label for="spassword">Password:</label><br>
	                    <input type="password" id="spassword" name="password" style="height:40px;width:250px;border:1px solid black">           	
                	</div>
                	<div>
	                    <input type="image" src="img/커비.png" id="Login-btn">
                	</div>
				</form>
				<div><a href="storeJoin.do">가게 회원가입</a></div>
			</div>	
		</c:when>
		<c:otherwise>
			<div id="in-and-out" style="position: absolute;left: 50%;top: 50%;transform:translate(-50%,-50%);">
				<a href="inStore.do?sname=${store.sname}" class="btn">입장</a>
				<a href="outStore.do?sname=${store.sname}" class="btn">퇴장</a>			
			</div>
			<div class="waitingList">
				<table>
					<caption>현재 웨이팅 정보</caption>
					<tr>
						<th>이름</th>
						<th>성인</th>
						<th>유아</th>
						<th>총 인원</th>
						<th>안옴</th>
					</tr>
					<c:forEach var="waitingList" items="${waitingList}">
						<tr>
							<td>${waitingList.name }</td>
							<td>${waitingList.aNum }</td>
							<td>${waitingList.bNum }</td>
							<td>${waitingList.tNum }</td>
							<td><a href="leaveStore.do?num=${waitingList.no}&sname=${store.sname}"><button>안옴</button></a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>