$(function () {

    $("body > div > div > nav.navbar.navbar-expand-sm.bg-light.place-nav > div > ul > li:nth-child(5) > a").on("click",function(){
        $("#modalPrice").modal("toggle");
    })
    
    
	$('#memberNumModal').on('shown.bs.modal', function () {
	    var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
	});
    
    $("#selectDate").on("click",function(){
    	console.log("1");
    	$("#memberNumModal").modal("toggle");
	  	
  	});
  	
  	
  	
    
    dragElement1(document.getElementById("circle"));
    dragElement2(document.getElementById("circle2"));

    function dragElement1(elmnt) {
        let clientX_gab = 0,
            clientX = 0;
        elmnt.onmousedown = dragMouseDown;
        function dragMouseDown(e) {
            e = e || window.event;
            e.preventDefault();
            clientX = e.clientX;
            document.onmouseup = closeDragElement;
            document.onmousemove = elementDrag;
        }
        let pricecnt1 = 0;
        let inputvalue1 = 0;
        function elementDrag(e) {
            e = e || window.event;
            e.preventDefault();
            // console.log("clientX" + clientX);
            clientX_gab = e.clientX - clientX;
            clientX = e.clientX;
            let barLeft = elmnt.offsetLeft + clientX_gab;
            if (elmnt.offsetLeft < 0) {
                barLeft = 0;
            } else if (elmnt.offsetLeft > 400) {
                barLeft = 400;
            }
            if (clientX_gab > 0) {
                pricecnt1 += clientX_gab;
                inputvalue1 = Math.floor(pricecnt1 / 17);
            } else if (clientX_gab < 0) {
                pricecnt1 += clientX_gab;
                inputvalue1 = Math.floor(pricecnt1 / 17);
            }
            document.querySelector(
                ".price-result div:first-child input"
            ).value = inputvalue1;
             if( document.querySelector(
                ".price-result div:first-child input"
            ).value < 0){
                document.querySelector(
                    ".price-result div:first-child input"
                ).value = 0 ;
            }
            elmnt.style.left = barLeft + "px";
        }

        function closeDragElement() {
            document.onmouseup = null;
            document.onmousemove = null;
        }
    }
    function dragElement2(elmnt) {
        let clientX_gab = 0,
            clientX = 0;
        elmnt.onmousedown = dragMouseDown;
        function dragMouseDown(e) {
            e = e || window.event;
            e.preventDefault();
            clientX = e.clientX;
            document.onmouseup = closeDragElement;
            document.onmousemove = elementDrag;
        }
        let pricecnt1 = 0;
        let inputvalue1 = 0;
        function elementDrag(e) {
            e = e || window.event;
            e.preventDefault();
            // console.log("clientX" + clientX);
            clientX_gab = e.clientX - clientX;
            clientX = e.clientX;
            let barLeft = elmnt.offsetLeft + clientX_gab;
            if (elmnt.offsetLeft < 0) {
                barLeft = 0;
            } else if (elmnt.offsetLeft > 400) {
                barLeft = 400;
            }
            if (clientX_gab > 0) {
                pricecnt1 += clientX_gab;
                inputvalue1 = Math.floor(pricecnt1 / 17);
            } else if (clientX_gab < 0) {
                pricecnt1 += clientX_gab;
                inputvalue1 = Math.floor(pricecnt1 / 17);
            }
            document.querySelector(
                ".price-result div:nth-child(3) input"
            ).value = 40 + inputvalue1;
            if(  document.querySelector(
                ".price-result div:nth-child(3) input"
            ).value >40){
                document.querySelector(
                    ".price-result div:nth-child(3) input"
                ).value = 40;
            }
            elmnt.style.left = barLeft + "px";
        }

        function closeDragElement() {
            document.onmouseup = null;
            document.onmousemove = null;
        }
    }
    
})