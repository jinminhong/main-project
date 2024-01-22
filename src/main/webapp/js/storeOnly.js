window.addEventListener("load",function(){
	var outerContainer = document.querySelector("#section");
	var container = document.querySelector(".container");
	var box = document.querySelector(".box");
	var dragging = false;
	var offset = {x:0,y:0};
	var current = null;
	
	 let isDrag;
	
	container.onmousedown = function(e){
		if(e.target.classList.contains("box")){
			dragging = true;
			current = e.target;
			offset.x = e.offsetX;
			offset.y = e.offsetY;
		}
		 isDrag = false;
	};
	
	container.onmousemove = function(e){
		if(!dragging) return;
		current.style.left = e.pageX - offset.x + "px";
		current.style.top = e.pageY - offset.y + "px";
		isDrag=true
		
	};
	
	container.onmouseup = function(e){
		dragging = false;
		sname = $("#hiddenSname").val();
		if(e.target.classList.contains("box")&!isDrag&!e.target.classList.contains("active")){
			if(!e.target.classList.contains("active")){
				e.target.classList.add("active");
			$.ajax({
				url:"inStore.do",
				type:"post",
				data:{"sname":sname},
				dataType:'json',
				success: function(waitingListData){
					
				}
				
				});
				
			}
        	 $("#myModal").modal("toggle");
      }
	};
	
	
	
})