$(function (){
	var babyNum=0;
	var adultNum = 0;
	$("#adult-asc").on("click",function(){
		adultNum++;
		$("#counterAdult").html(adultNum);
		$("#adultNum").val(adultNum);
		$("#totalNum").val(adultNum+babyNum);
		$("#totalNumShow").html(adultNum+babyNum+"명");
	})
	$("#adult-desc").on("click",function(){
		adultNum--;
		if(adultNum<0) adultNum=0;
		$("#counterAdult").html(adultNum);
		$("#adultNum").val(adultNum);
		$("#totalNum").val(adultNum+babyNum);
		$("#totalNumShow").html(adultNum+babyNum+"명");
	})
	$("#baby-asc").on("click",function(){
		babyNum++;
		$("#counterBaby").html(babyNum);
		$("#babyNum").val(babyNum);
		$("#totalNum").val(adultNum+babyNum);
		$("#totalNumShow").html(adultNum+babyNum+"명");
	})
	$("#baby-desc").on("click",function(){
		babyNum--;
		if(babyNum<0) babyNum=0;
		$("#counterBaby").html(babyNum);
		$("#babyNum").val(babyNum);
		$("#totalNum").val(adultNum+babyNum);
		$("#totalNumShow").html(adultNum+babyNum+"명");
	})
})