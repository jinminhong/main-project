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
	<link rel="stylesheet" href="css/storeReview.css" />
</head>
<body>
<div class="container" style="display:flex;align-items: center;margin-bottom:50px">
		<a href="index.do" style="margin-right:20px"><img src="img/뒤로가기.png" alt=""></a>
		<h2>리뷰 쓰러가기</h2>
	</div>
	<div class="container">
	<h2>맛있게 드셨다면 리뷰를 작성해주세요</h2>
		<form action="storeReviewOK.do" class="mb-3" name="myform" id="myform" method="post">
		<input type="hidden" name="no" value="${param.no}">
			<div>
				<input type="text" name="sname" value="${param.sname}" readOnly>
			</div>
			<div>
				<input type="text" name="nickname"value="${user.nickname}" readOnly>
			</div>
			<div>리뷰를 적어주세요</div>
			<div>
				<textarea name="review"></textarea>
			</div>
				<div class="text-bold">별점을 선택해주세요</div>
			<fieldset>
				<input type="radio" name="star" value="5" id="rate1"><label
					for="rate1">★</label>
				<input type="radio" name="star" value="4" id="rate2"><label
					for="rate2">★</label>
				<input type="radio" name="star" value="3" id="rate3"><label
					for="rate3">★</label>
				<input type="radio" name="star" value="2" id="rate4"><label
					for="rate4">★</label>
				<input type="radio" name="star" value="1" id="rate5"><label
					for="rate5">★</label>
			</fieldset>
			<div>
				<input type="submit" value="작성하기">
			</div>
		</form>
	</div>


     <script>
     $('.starRev span').click(function(){
    	  $(this).parent().children('span').removeClass('on');
    	  $(this).addClass('on').prevAll('span').addClass('on');
    	  return false;
    	});
</script>
</body>
</html>