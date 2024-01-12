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
		<c:when test="${sname eq null}">
			<div id="login" style="position: absolute;left: 50%;top: 50%;transform:translate(-50%,-50%);">
				<form action="storeLogin.do" method="post" style="display:flex; width:500px">
					<div>
	                    <label for="sname">Store name:</label><br>
	                    <input type="text" id="sname" name="sname" style="height:40px;width:250px;border:1px solid black"><br>
	                    <label for="spassword">Password:</label><br>
	                    <input type="password" id="spassword" name="spassword" style="height:40px;width:250px;border:1px solid black">           	
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
				<a href="#" class="btn">입장</a>
				<a href="#" class="btn">퇴장</a>			
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>