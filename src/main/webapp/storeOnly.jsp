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

</head>
<body>
	<input type="hidden" id ="hiddenSname" value="${store.sname}">
	<input type="hidden" id ="hiddenabSpace value="${store.abSpaces}">
	
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
					<c:forEach var="i" begin="0" end="${store.abSpaces-1}">
						<div class="box" id="box${i}">${i+1}번</div>							
					</c:forEach>
	
				</div>
			</section>
			<div class="waitingList">
				<table>
					<caption>현재 웨이팅 정보</caption>
					<thead>
					<tr>
						<th>이름</th>
						<th>성인</th>
						<th>유아</th>
						<th>총 인원</th>
						<th>안옴</th>
					</tr>
					</thead>
					<tbody id="tbody">
					
					</tbody>
					<tbody id="onceLoginWaitingList">
					<c:forEach var="waitingList" items="${waitingList}" varStatus="status">
						<tr>
							<td>${waitingList.name }</td>
							<td>${waitingList.aNum }</td>
							<td>${waitingList.bNum }</td>
							<td>${waitingList.tNum }</td>
							<td><button class="leave${status.index}"data-no="${waitingList.no}" data-sname="${store.sname}">안옴</button></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<a href="logoutStore.do" style="position:relative;">로그아웃</a>
		<c:forEach var="i" begin="0" end="${store.abSpaces-1}">
		<div class="modal fade" id="myModal${i}">
	    <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h4 class="modal-title">Modal Heading</h4>
	          <button type="button" class="close" data-dismiss="modal">×</button>
	        </div>
	        <div class="modal-body">
	        	<h3>메뉴</h3>
	        	<hr>
	        	<c:forEach var="menuList" items="${menuList}">
		        	<div class="menuList" style="display:flex;justify-content: space-between">
			        	<div>
			        		${menuList.foodname}
			        	</div>
			        	<div>
			        		<a href="#" class="round-button min-price${i}" data-value="${menuList.foodprice}">-</a><span class="food-price">${menuList.foodprice}</span><a href="#"class="round-button add-price${i}" data-value="${menuList.foodprice}" >+</a>
			        	</div>
		        	</div>	        	
	        	</c:forEach>
	        	<div style="display:flex;justify-content: space-between"><span>합계</span><span class="total-price${i}">0</span></div>
	        </div>
	        <div class="modal-footer">
	          <a id="cal${i}" href="#">계산</a>
	        </div>
	        
	      </div>
	    </div>
  	</div>
		</c:forEach>
	
		</c:otherwise>
	</c:choose>
	<script>
		var total0 = 0;
		var total1 = 0;
		var total2 = 0;
		var total3 = 0;
		var total4 = 0;
	$(function () {
		 $(".add-price0").on("click", function() {
	            
	            let value = parseInt($(this).data("value"), 10);
	            total0 += value;
				console.log("a")
	            
	            $(".total-price0").text(total0);
	        });
		 
		 $(".min-price0").on("click", function() {
	            
	            let value = parseInt($(this).data("value"), 10);
	            total0 -= value;
				console.log("b")
	            
	            $(".total-price0").text(total0);
	        });
		 $(".add-price1").on("click", function() {
	            
	            let value = parseInt($(this).data("value"), 10);
	            total1 += value;
				console.log("a")
	            
	            $(".total-price1").text(total1);
	        });
		 
		 $(".min-price1").on("click", function() {
	            
	            let value = parseInt($(this).data("value"), 10);
	            total1 -= value;
				console.log("b")
	            
	            $(".total-price1").text(total1);
	        });
		 $(".add-price2").on("click", function() {
	            
	            let value = parseInt($(this).data("value"), 10);
	            total2 += value;
				console.log("a")
	            
	            $(".total-price2").text(total2);
	        });
		 
		 $(".min-price2").on("click", function() {
	            
	            let value = parseInt($(this).data("value"), 10);
	            total2 -= value;
				console.log("b")
	            
	            $(".total-price2").text(total2);
	        });
		 $(".add-price3").on("click", function() {
	            
	            let value = parseInt($(this).data("value"), 10);
	            total3 += value;
				console.log("a")
	            
	            $(".total-price3").text(total3);
	        });
		 
		 $(".min-price3").on("click", function() {
	            
	            let value = parseInt($(this).data("value"), 10);
	            total3 -= value;
				console.log("b")
	            
	            $(".total-price3").text(total3);
	        });
		 $(".add-price4").on("click", function() {
	            
	            let value = parseInt($(this).data("value"), 10);
	            total4 += value;
				console.log("a")
	            
	            $(".total-price4").text(total4);
	        });
		 
		 $(".min-price4").on("click", function() {
	            
	            let value = parseInt($(this).data("value"), 10);
	            total4 -= value;
				console.log("b")
	            
	            $(".total-price4").text(total4);
	        });
		
	})
	</script>
	<script>
	$(function () {
		var sname = $('#hiddenSname').val();
		
		$("#box0").on("click",function(e){
			if (!$(this).hasClass('active')) {
				$(this).addClass('active');
				$.ajax({
			        url:"inStore.do",
			        type:"post",
			        data:{"sname":sname},
			        dataType:'json',
			        success: function(data){
			        	$("#onceLoginWaitingList").css("display", "none");
			        	$("#tbody").html('');
			        	var waitingNode="";
			        	for(let i = 0;i<data.waitingList.length;i++){
				        	waitingNode += '<tr>'+'<td>'+data.waitingList[i].name+'</td>'+
				        						'<td>'+data.waitingList[i].aNum+'</td>' +
				        						'<td>'+data.waitingList[i].bNum+'</td>'+
				        						'<td>'+data.waitingList[i].tNum+'</td>'+
				        						'<td><button id="leave'+i+'" data-no='+data.waitingList[i].no+' data-sname="'+sname+'">안옴</button></td>'+
				        					'</tr>';
			        	}
			        	$("#tbody").append(waitingNode);
			        },
			        error:function() {
			        	console.log("에러")
			        }
			    })
	        }
			$("#myModal0").modal("toggle");
			
		})
		$("#box1").on("click",function(e){
			if (!$(this).hasClass('active')) {
				$(this).addClass('active');
				$.ajax({
			        url:"inStore.do",
			        type:"post",
			        data:{"sname":sname},
			        dataType:'json',
			        success: function(data){
			        	$("#onceLoginWaitingList").css("display", "none");
			        	$("#tbody").html('');
			        	var waitingNode="";
			        	for(let i = 0;i<data.waitingList.length;i++){
				        	waitingNode += '<tr>'+'<td>'+data.waitingList[i].name+'</td>'+
				        						'<td>'+data.waitingList[i].aNum+'</td>' +
				        						'<td>'+data.waitingList[i].bNum+'</td>'+
				        						'<td>'+data.waitingList[i].tNum+'</td>'+
				        						'<td><button id="leave'+i+'" data-no='+data.waitingList[i].no+' data-sname="'+sname+'">안옴</button></td>'+
				        					'</tr>';
			        	}
			        	$("#tbody").html(waitingNode);
			        },
			        error:function() {
			        	console.log("에러")
			        }
			    })
	        }
			$("#myModal1").modal("toggle");
			
		})
		$("#box2").on("click",function(e){
			if (!$(this).hasClass('active')) {
				$(this).addClass('active');
				$.ajax({
			        url:"inStore.do",
			        type:"post",
			        data:{"sname":sname},
			        dataType:'json',
			        success: function(data){
			        	$("#onceLoginWaitingList").css("display", "none");
			        	$("#tbody").html('');
			        	var waitingNode="";
			        	for(let i = 0;i<data.waitingList.length;i++){
				        	waitingNode += '<tr>'+'<td>'+data.waitingList[i].name+'</td>'+
				        						'<td>'+data.waitingList[i].aNum+'</td>' +
				        						'<td>'+data.waitingList[i].bNum+'</td>'+
				        						'<td>'+data.waitingList[i].tNum+'</td>'+
				        						'<td><button id="leave'+i+'" data-no='+data.waitingList[i].no+' data-sname="'+sname+'">안옴</button></td>'+
				        					'</tr>';
			        	}
			        	$("#tbody").append(waitingNode);
			        },
			        error:function() {
			        	console.log("에러")
			        }
			    })
	        }
			$("#myModal2").modal("toggle");
			
		})
		$("#box3").on("click",function(e){
			if (!$(this).hasClass('active')) {
				$(this).addClass('active');
				$.ajax({
			        url:"inStore.do",
			        type:"post",
			        data:{"sname":sname},
			        dataType:'json',
			        success: function(data){
			        	$("#tbody").html('');
			        	var waitingNode="";
			        	for(let i = 0;i<data.waitingList.length;i++){
				        	waitingNode += '<tr>'+'<td>'+data.waitingList[i].name+'</td>'+
				        						'<td>'+data.waitingList[i].aNum+'</td>' +
				        						'<td>'+data.waitingList[i].bNum+'</td>'+
				        						'<td>'+data.waitingList[i].tNum+'</td>'+
				        						'<td><button id="leave'+i+'" data-no='+data.waitingList[i].no+' data-sname="'+sname+'">안옴</button></td>'+
				        					'</tr>';
			        	}
			        	$("#tbody").append(waitingNode);
			        },
			        error:function() {
			        	console.log("에러")
			        }
			    })
	        }
			$("#myModal3").modal("toggle");
			
		})
		$("#box4").on("click",function(e){
			if (!$(this).hasClass('active')) {
				$(this).addClass('active');
				$.ajax({
			        url:"inStore.do",
			        type:"post",
			        data:{"sname":sname},
			        dataType:'json',
			        success: function(data){
			        	$("#onceLoginWaitingList").css("display", "none");
			        	$("#tbody").html('');
			        	var waitingNode="";
			        	for(let i = 0;i<data.waitingList.length;i++){
				        	waitingNode += '<tr>'+'<td>'+data.waitingList[i].name+'</td>'+
				        						'<td>'+data.waitingList[i].aNum+'</td>' +
				        						'<td>'+data.waitingList[i].bNum+'</td>'+
				        						'<td>'+data.waitingList[i].tNum+'</td>'+
				        						'<td><button id="leave'+i+'" data-no='+data.waitingList[i].no+' data-sname="'+sname+'">안옴</button></td>'+
				        					'</tr>';
			        	}
			        	$("#tbody").append(waitingNode);
			        },
			        error:function() {
			        	console.log("에러")
			        }
			    })
	        }
			$("#myModal4").modal("toggle");
			
		})
		$('#cal0').on("click",function(e){
			total0=0;
			$(".total-price0").text(total0);
			$('#box0').removeClass('active')
			$.ajax({
			        url:"outStore.do",
			        type:"post",
			        data:{"sname":sname},
			        dataType:'json',
			        success: function(data){
			        	$("#onceLoginWaitingList").css("display", "none");
			        	$("#tbody").html('');
			        	var waitingNode="";
			        	for(let i = 0;i<data.waitingList.length;i++){
				        	waitingNode += '<tr>'+'<td>'+data.waitingList[i].name+'</td>'+
				        						'<td>'+data.waitingList[i].aNum+'</td>' +
				        						'<td>'+data.waitingList[i].bNum+'</td>'+
				        						'<td>'+data.waitingList[i].tNum+'</td>'+
				        						'<td><button id="leave'+i+'" data-no='+data.waitingList[i].no+' data-sname="'+sname+'">안옴</button></td>'+
				        					'</tr>';
			        	}
			        	$("#tbody").append(waitingNode);
			        },
			        error:function() {
			        	console.log("에러")
			        }
			    })
			    $("#myModal0").modal("toggle");
		})
		$('#cal1').on("click",function(e){
			total1=0;
			$(".total-price1").text(total1);
			$('#box1').removeClass('active')
			$.ajax({
			        url:"outStore.do",
			        type:"post",
			        data:{"sname":sname},
			        dataType:'json',
			        success: function(data){
			        	$("#onceLoginWaitingList").css("display", "none");
			        	$("#tbody").html('');
			        	var waitingNode="";
			        	for(let i = 0;i<data.waitingList.length;i++){
				        	waitingNode += '<tr>'+'<td>'+data.waitingList[i].name+'</td>'+
				        						'<td>'+data.waitingList[i].aNum+'</td>' +
				        						'<td>'+data.waitingList[i].bNum+'</td>'+
				        						'<td>'+data.waitingList[i].tNum+'</td>'+
				        						'<td><button id="leave'+i+'" data-no='+data.waitingList[i].no+' data-sname="'+sname+'">안옴</button></td>'+
				        					'</tr>';
			        	}
			        	$("#tbody").append(waitingNode);
			        },
			        error:function() {
			        	console.log("에러")
			        }
			    })
			    $("#myModal1").modal("toggle");
		})
		$('#cal2').on("click",function(e){
			total2=0;
			$(".total-price2").text(total2);
		       $('#box2').removeClass('active')
		       $.ajax({
			        url:"outStore.do",
			        type:"post",
			        data:{"sname":sname},
			        dataType:'json',
			        success: function(data){
			        	$("#onceLoginWaitingList").css("display", "none");
			        	$("#tbody").html('');
			        	var waitingNode="";
			        	for(let i = 0;i<data.waitingList.length;i++){
				        	waitingNode += '<tr>'+'<td>'+data.waitingList[i].name+'</td>'+
				        						'<td>'+data.waitingList[i].aNum+'</td>' +
				        						'<td>'+data.waitingList[i].bNum+'</td>'+
				        						'<td>'+data.waitingList[i].tNum+'</td>'+
				        						'<td><button id="leave'+i+'" data-no='+data.waitingList[i].no+' data-sname="'+sname+'">안옴</button></td>'+
				        					'</tr>';
			        	}
			        	$("#tbody").append(waitingNode);
			        },
			        error:function() {
			        	console.log("에러")
			        }
			    })
			    $("#myModal2").modal("toggle");
		})
		$('#cal3').on("click",function(e){
			total3=0;
			$(".total-price3").text(total3);
		       $('#box3').removeClass('active')
			 var href = $(this).attr('href');
		       $.ajax({
			        url:"outStore.do",
			        type:"post",
			        data:{"sname":sname},
			        dataType:'json',
			        success: function(data){
			        	$("#onceLoginWaitingList").css("display", "none");
			        	$("#tbody").html('');
			        	var waitingNode="";
			        	for(let i = 0;i<data.waitingList.length;i++){
				        	waitingNode += '<tr>'+'<td>'+data.waitingList[i].name+'</td>'+
				        						'<td>'+data.waitingList[i].aNum+'</td>' +
				        						'<td>'+data.waitingList[i].bNum+'</td>'+
				        						'<td>'+data.waitingList[i].tNum+'</td>'+
				        						'<td><button id="leave'+i+'" data-no='+data.waitingList[i].no+' data-sname="'+sname+'">안옴</button></td>'+
				        					'</tr>';
			        	}
			        	$("#tbody").append(waitingNode);
			        },
			        error:function() {
			        	console.log("에러")
			        }
			    })
			    $("#myModal3").modal("toggle");
		})
		$('#cal4').on("click",function(e){
				total4=0;
				$(".total-price4").text(total4);
		       $('#box4').removeClass('active')
		       $.ajax({
			        url:"outStore.do",
			        type:"post",
			        data:{"sname":sname},
			        dataType:'json',
			        success: function(data){
			        	$("#onceLoginWaitingList").css("display", "none");
			        	$("#tbody").html('');
			        	var waitingNode="";
			        	for(let i = 0;i<data.waitingList.length;i++){
				        	waitingNode += '<tr>'+'<td>'+data.waitingList[i].name+'</td>'+
				        						'<td>'+data.waitingList[i].aNum+'</td>' +
				        						'<td>'+data.waitingList[i].bNum+'</td>'+
				        						'<td>'+data.waitingList[i].tNum+'</td>'+
				        						'<td><button id="leave'+i+'" data-no='+data.waitingList[i].no+' data-sname="'+sname+'">안옴</button></td>'+
				        					'</tr>';
			        	}
			        	$("#tbody").append(waitingNode);
			        },
			        error:function() {
			        	console.log("에러")
			        }
			    })
			    $("#myModal4").modal("toggle");
		})
		
		
	})
	
	
	
	$(document).on("click","#leave0",function(){
		var sname = $('#hiddenSname').val();
		let no = parseInt($(this).data("no"));
		$.ajax({
	        url:"leaveStore.do",
	        type:"post",
	        data:{"sname":sname,"no":no},
	        dataType:'json',
	        success: function(data){
	        	$("#onceLoginWaitingList").css("display", "none");
	        	$("#tbody").html('');
	        	var waitingNode="";
	        	for(let i = 0;i<data.waitingList.length;i++){
		        	waitingNode += '<tr>'+'<td>'+data.waitingList[i].name+'</td>'+
		        						'<td>'+data.waitingList[i].aNum+'</td>' +
		        						'<td>'+data.waitingList[i].bNum+'</td>'+
		        						'<td>'+data.waitingList[i].tNum+'</td>'+
		        						'<td><button id="leave'+i+'" data-no='+data.waitingList[i].no+' data-sname="'+sname+'">안옴</button></td>'+
		        					'</tr>';
	        	}
	        	$("#tbody").append(waitingNode);
	        },
	        error:function() {
	        	console.log("에러")
	        }
	    })
	})
	
	$(document).on("click","#leave1",function(){
		var sname = $('#hiddenSname').val();
		let no = parseInt($(this).data("no"));
		$.ajax({
	        url:"leaveStore.do",
	        type:"post",
	        data:{"sname":sname,"no":no},
	        dataType:'json',
	        success: function(data){
	        	$("#onceLoginWaitingList").css("display", "none");
	        	$("#tbody").html('');
	        	var waitingNode="";
	        	for(let i = 0;i<data.waitingList.length;i++){
		        	waitingNode += '<tr>'+'<td>'+data.waitingList[i].name+'</td>'+
		        						'<td>'+data.waitingList[i].aNum+'</td>' +
		        						'<td>'+data.waitingList[i].bNum+'</td>'+
		        						'<td>'+data.waitingList[i].tNum+'</td>'+
		        						'<td><button id="leave'+i+'" data-no='+data.waitingList[i].no+' data-sname="'+sname+'">안옴</button></td>'+
		        					'</tr>';
	        	}
	        	$("#tbody").append(waitingNode);
	        },
	        error:function() {
	        	console.log("에러")
	        }
	    })
	})
	$(document).on("click","#leave2",function(){
		var sname = $('#hiddenSname').val();
		let no = parseInt($(this).data("no"));
		$.ajax({
	        url:"leaveStore.do",
	        type:"post",
	        data:{"sname":sname,"no":no},
	        dataType:'json',
	        success: function(data){
	        	$("#onceLoginWaitingList").css("display", "none");
	        	$("#tbody").html('');
	        	var waitingNode="";
	        	for(let i = 0;i<data.waitingList.length;i++){
		        	waitingNode += '<tr>'+'<td>'+data.waitingList[i].name+'</td>'+
		        						'<td>'+data.waitingList[i].aNum+'</td>' +
		        						'<td>'+data.waitingList[i].bNum+'</td>'+
		        						'<td>'+data.waitingList[i].tNum+'</td>'+
		        						'<td><button id="leave'+i+'" data-no='+data.waitingList[i].no+' data-sname="'+sname+'">안옴</button></td>'+
		        					'</tr>';
	        	}
	        	$("#tbody").append(waitingNode);
	        },
	        error:function() {
	        	console.log("에러")
	        }
	    })
	})
	$(document).on("click","#leave3",function(){
		var sname = $('#hiddenSname').val();
		let no = parseInt($(this).data("no"));
		$.ajax({
	        url:"leaveStore.do",
	        type:"post",
	        data:{"sname":sname,"no":no},
	        dataType:'json',
	        success: function(data){
	        	$("#onceLoginWaitingList").css("display", "none");
	        	$("#tbody").html('');
	        	var waitingNode="";
	        	for(let i = 0;i<data.waitingList.length;i++){
		        	waitingNode += '<tr>'+'<td>'+data.waitingList[i].name+'</td>'+
		        						'<td>'+data.waitingList[i].aNum+'</td>' +
		        						'<td>'+data.waitingList[i].bNum+'</td>'+
		        						'<td>'+data.waitingList[i].tNum+'</td>'+
		        						'<td><button id="leave'+i+'" data-no='+data.waitingList[i].no+' data-sname="'+sname+'">안옴</button></td>'+
		        					'</tr>';
	        	}
	        	$("#tbody").append(waitingNode);
	        },
	        error:function() {
	        	console.log("에러")
	        }
	    })
	})
	$(document).on("click","#leave4",function(){
		var sname = $('#hiddenSname').val();
		let no = parseInt($(this).data("no"));
		$.ajax({
	        url:"leaveStore.do",
	        type:"post",
	        data:{"sname":sname,"no":no},
	        dataType:'json',
	        success: function(data){
	        	$("#onceLoginWaitingList").css("display", "none");
	        	$("#tbody").html('');
	        	var waitingNode="";
	        	for(let i = 0;i<data.waitingList.length;i++){
		        	waitingNode += '<tr>'+'<td>'+data.waitingList[i].name+'</td>'+
		        						'<td>'+data.waitingList[i].aNum+'</td>' +
		        						'<td>'+data.waitingList[i].bNum+'</td>'+
		        						'<td>'+data.waitingList[i].tNum+'</td>'+
		        						'<td><button id="leave'+i+'" data-no='+data.waitingList[i].no+' data-sname="'+sname+'">안옴</button></td>'+
		        					'</tr>';
	        	}
	        	$("#tbody").append(waitingNode);
	        },
	        error:function() {
	        	console.log("에러")
	        }
	    })
	})
	$(function(){
		var sname = $('#hiddenSname').val();
		setInterval(() => {
			$.ajax({
				url:"intervalWaiting.do",
				type:"post",
				data:{"sname":sname},
				dataType:'json',
				success:function(data){
					console.log("1");
					$("#onceLoginWaitingList").css("display", "none");
		        	$("#tbody").html('');
		        	var waitingNode="";
		        	for(let i = 0;i<data.waitingList.length;i++){
			        	waitingNode += '<tr>'+'<td>'+data.waitingList[i].name+'</td>'+
			        						'<td>'+data.waitingList[i].aNum+'</td>' +
			        						'<td>'+data.waitingList[i].bNum+'</td>'+
			        						'<td>'+data.waitingList[i].tNum+'</td>'+
			        						'<td><button id="leave'+i+'" data-no='+data.waitingList[i].no+' data-sname="'+sname+'">안옴</button></td>'+
			        					'</tr>';
		        	}
		        	$("#tbody").append(waitingNode);
				},
				error:function(){
					console.log("에러")
				}
			})
		}, 10000);
	})
	
	</script>
	
</body>
</html>