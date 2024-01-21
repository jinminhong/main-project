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
		<div style="display:flex">
			<section id="section">
				<div class="container">
					<c:forEach var="i" begin="0" end="4">
						<div class="box"></div>							
					</c:forEach>
	
				</div>
			</section>
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
		</div>
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
	        	<h3>메뉴</h3>
	        	<hr>
	        	<c:forEach var="menuList" items="${menuList}">
		        	<div class="menuList" style="display:flex;justify-content: space-between">
			        	<div>
			        		${menuList.foodname}
			        	</div>
			        	<div>
			        		<a href="#" class="round-button min-price" data-value="${menuList.foodprice}">-</a><span class="food-price">${menuList.foodprice}</span><a href="#"class="round-button add-price" data-value="${menuList.foodprice}" >+</a>
			        	</div>
		        	</div>	        	
	        	</c:forEach>
	        	<div style="display:flex;justify-content: space-between"><span>합계</span><span class="total-price">0</span></div>
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <button type="button" class="btn btn-danger" data-dismiss="modal">계산</button>
	        </div>
	        
	      </div>
	    </div>
  	</div>
		</c:otherwise>
	</c:choose>
	<script>
	$(function () {
		var total = 0;
		 $(".add-price").on("click", function() {
	            
	            var value = parseInt($(this).data("value"), 10);
	            total += value;
				console.log("a")
	            
	            $(".total-price").text(total);
	        });
		 
		 $(".min-price").on("click", function() {
	            
	            var value = parseInt($(this).data("value"), 10);
	            total -= value;
				console.log("b")
	            
	            $(".total-price").text(total);
	        });
		
	})
	</script>
</body>
</html>