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
<link rel="stylesheet" href="css/storeOnly.css">
<script src="js/storeOnly.js"></script>
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
	<section id="section">
		<div class="container">
			<div class="box"></div>		
			<div class="box"></div>		
			<div class="box"></div>		
			<div class="box"></div>		
			<div class="box"></div>		
		</div>
	</section>
	
	<div class="modal fade" id="myModal">
	    <div class="modal-dialog">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title">Modal Heading</h4>
	          <button type="button" class="close" data-dismiss="modal">×</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body">
	          Modal body..
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	        </div>
	        
	      </div>
	    </div>
  	</div>
  	</c:otherwise>
	</c:choose>

</body>
</html>