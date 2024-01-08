$(function () {
    // 뒤로가기 버튼
    $(".header-left img").on("click", function () {
        window.history.back();
    });

    // 예약 픽업 웨이팅 버튼 클릭했을때
    $(".search-btn button").on("click", function () {
        $(".search-btn button").removeClass("active");
        $(this).addClass("active");
    });
    // 예약 파트 클릭
    $(".dateTime-btn span").on("click", function () {
        var modal = $("#myModal");
        modal.css("display", "block");
        showCalendar();
    });
    // 음식종류 클릭
    var foodModal = $("#modalFood");
    $(".adjust-menu p:nth-child(2)").on("click", function () {
        foodModal.css("display", "block");
    });
    $(".food-btn button:nth-child(1)").on("click", function () {
        foodModal.css("display", "none");
    });
    $(".food-btn button:nth-child(2)").on("click", function () {
        $(".adjust-menu p:nth-child(2)").addClass("active");
        foodModal.css("display", "none");
    });
    // 가격 클릭
    var priceModal = $("#modalPrice");
    $(".adjust-menu p:nth-child(3)").on("click", function () {
        priceModal.css("display", "block");
    });
    $(".price-btn button:nth-child(1)").on("click", function () {
        priceModal.css("display", "none");
    });
    $(".price-btn button:nth-child(2)").on("click", function () {
        $(".adjust-menu p:nth-child(3)").addClass("active");
        priceModal.css("display", "none");
    });

    // 모달 영역 이외의 클릭
    var modal = $("#myModal");
    $(window).click(function (event) {
        if (event.target === modal[0]) {
            modal.css("display", "none");
        }
        if (event.target === foodModal[0]) {
            foodModal.css("display", "none");
        }
        if (event.target === priceModal[0]) {
            priceModal.css("display", "none");
        }
    });
    //시간 동적 추가
    $(document).on(
        "click",
        ".member-number .member-number-btn div",
        function (event) {
            $(".member-number .member-number-btn div").removeClass("active");
            $(this).addClass("active");
            $(".dateTime-btn span").eq(4).text($(this).text());
            if (document.querySelector(".choose-time-btn").hasChildNodes()) {
                document.querySelector(".choose-time-btn").innerHTML = "";
            }

            for (let i = 0; i < 12; i++) {
                let j = 0;
                j++;
                let divTag = document.createElement("div");
                let divTag2 = document.createElement("div");
                if (i == 0) {
                    divTag.innerText = `오후 ${i + 12}시`;
                    divTag2.innerText = `오후 ${i + 12}시 30분`;
                } else {
                    divTag.innerText = `오후 ${i}시`;
                    divTag2.innerText = `오후 ${i}시 30분`;
                }
                document.querySelector(".choose-time-btn").appendChild(divTag);
                document.querySelector(".choose-time-btn").appendChild(divTag2);
            }
            $(".choose-time>div:first-child").css("display", "block");
        }
    );
    //시간 클릭이벤트
    $(document).on(
        "click",
        ".choose-time .choose-time-btn div",
        function (event) {
            $(".choose-time .choose-time-btn div").removeClass("active");
            $(this).addClass("active");
            $(".dateTime-btn span").eq(2).text($(this).text());
        }
    );

    //인원 시간드래그
    const memberNumberBtn = document.querySelector(".member-number-btn");
    const chooseTimeBtn = document.querySelector(".choose-time-btn");
    dragElement3(memberNumberBtn);
    dragElement4(chooseTimeBtn);
    // memberNumberBtn.addEventListener("mousedown", dragStart, false);
    // memberNumberBtn.addEventListener("mouseup", dragEnd, false);
    // memberNumberBtn.addEventListener("mousemove", drag, false);
    // chooseTimeBtn.addEventListener("mousedown", dragStart, false);
    // chooseTimeBtn.addEventListener("mouseup", dragEnd, false);
    // chooseTimeBtn.addEventListener("mousemove", drag1, false);

    //가격 드래그
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
            } else if (elmnt.offsetLeft > 670) {
                barLeft = 670;
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
            } else if (elmnt.offsetLeft > 670) {
                barLeft = 670;
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
            elmnt.style.left = barLeft + "px";
        }

        function closeDragElement() {
            document.onmouseup = null;
            document.onmousemove = null;
        }
    }
    //인원 시간 드래그 펑션
    function dragElement3(elmnt) {
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
            if (elmnt.offsetLeft < -600) {
                barLeft = -600;
            } else if (elmnt.offsetLeft > 0) {
                barLeft = 0;
            }
            elmnt.style.left = barLeft + "px";
        }

        function closeDragElement() {
            document.onmouseup = null;
            document.onmousemove = null;
        }
    }
    function dragElement4(elmnt) {
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
            if (elmnt.offsetLeft < -2180) {
                barLeft = -2180;
            } else if (elmnt.offsetLeft > 0) {
                barLeft = 0;
            }
            elmnt.style.left = barLeft + "px";
        }

        function closeDragElement() {
            document.onmouseup = null;
            document.onmousemove = null;
        }
    }
});

//달력 만드는거 구현부분
let calendar = {
    year: 0,
    month: 0,
    date: 1,
    theDayOfTheWeek: 0,
    lastDay: 0,
    numOfWeeks: 0,
};
let month = [
    "JANUARY",
    "FEBRUARY",
    "MARCH",
    "APRIL",
    "MAY",
    "JUNE",
    "JULY",
    "AUGUST",
    "SEPTEMBER",
    "OCTOBER",
    "NOVEMBER",
    "DECEMBER",
];

function showCalendar() {
    let numOfWeek = 0,
        date = 1,
        i = 0,
        j = 0;
    let dateText = "";
    let curMonth = 0,
        curYear = 0,
        curDate = 0;
    getCalendar();
    let now = new Date();
    curMonth = now.getMonth();
    curYear = now.getFullYear();
    curDate = now.getDate();
    dateText += "<div class = 'month'>";
    dateText += "<ul>";
    dateText +=
        "<li class='prev'><a href='#' onclick='nextMonth(-1)'>&#10094;</a></li>";
    dateText +=
        "<li class='next'><a href='#' onclick='nextMonth(1)'>&#10095;</a></li>";
    dateText += "<li style='text-align:center'>";
    dateText += month[calendar.month] + "<br>";
    dateText += "<span style='font-size:18px'>" + calendar.year + "</span>";
    dateText += "</li>";
    dateText += "</ul>";
    dateText += "</div>";
    dateText += "<table>";
    dateText += "<tr class = 'weekdays'>";
    dateText +=
        "<td>일</td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td>토</td>";
    dateText += "</tr>";

    for (i = 0; i < calendar.numOfWeeks; i++) {
        dateText += "<tr class = 'days'>";
        for (j = 0; j < 7; j++) {
            if (i * 7 + j < calendar.theDayOfTheWeek || date > calendar.lastDay)
                dateText += "<td></td>";
            else {
                if (
                    date == curDate &&
                    calendar.month == curMonth &&
                    calendar.year == curYear
                )
                    dateText += `<td class = 'active' onclick = "selectDate(${date},this)">`;
                else dateText += `<td onclick = "selectDate(${date},this)">`;
                dateText += date++ + "</td>";
            }
        }
        dateText += "</tr>";
    }
    dateText += "</table>";
    document.getElementById("calendar").innerHTML = dateText;
}

function getCalendar() {
    let date = null;
    if (calendar.year == 0) {
        date = new Date();
        calendar.year = date.getFullYear();
        calendar.month = date.getMonth();
        calendar.date = date.getDate();
    }

    getLastDayOfTheMonth();
    getNumberOfWeeks();
}
function getLastDayOfTheMonth() {
    let lastDay = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    if (
        (calendar.year % 4 == 0 && calendar.year % 100 != 0) ||
        calendar.year % 400 == 0
    ) {
        lastDay[1] = 29;
    }
    calendar.lastDay = lastDay[calendar.month];
}
function getNumberOfWeeks() {
    calendar.theDayOfTheWeek = new Date(
        calendar.year,
        calendar.month,
        1
    ).getDay();
    calendar.numOfWeeks = Math.ceil(
        (calendar.theDayOfTheWeek + calendar.lastDay) / 7
    );
}
function nextMonth(num) {
    calendar.month += num;
    if (calendar.month == -1) {
        calendar.month = 11;
        calendar.year--;
    } else if (calendar.month == 12) {
        calendar.month = 0;
        calendar.year++;
    }
    showCalendar();
}
function selectDate(day, clickedElement) {
    $("#calendar table td").removeClass("active");
    const WEEKDAY = ["일", "월", "화", "수", "목", "금", "토"];
    let chooseDate = calendar.year + "-" + (calendar.month + 1) + "-" + day;
    $(".dateTime-btn span:first").text(
        calendar.month +
            1 +
            "월" +
            " " +
            day +
            "일" +
            " " +
            WEEKDAY[new Date(chooseDate).getDay()]
    );
    $(clickedElement).addClass("active");
    memberNum();
}
//모달창 인원수 구현 부분
function memberNum() {
    if (document.querySelector(".member-number-btn").hasChildNodes()) {
        document.querySelector(".member-number-btn").innerHTML = "";
    }
    for (let i = 1; i <= 20; i++) {
        let pTag = document.createElement("div");
        pTag.innerText = `${i}명`;
        console.log(pTag.innerText);
        document.querySelector(".member-number-btn").appendChild(pTag);
    }
    $(".member-number>div:first-child").css("display", "block");
}

//모달 드래그부분  험수
const memberNumberBtn = document.querySelector(".member-number-btn");
let isDragging = false;
let initialX;
let xOffset = 0;
const container = document.querySelector(".member-number");
// const containerWidth = container.clientWidth;

function dragStart(e) {
    isDragging = true;
    initialX = e.clientX - xOffset;
}

function dragEnd() {
    isDragging = false;
}

function drag(e) {
    if (isDragging) {
        e.preventDefault();
        xOffset = e.clientX - initialX;
        setTranslate(xOffset, memberNumberBtn);
    }
}
function drag1(e) {
    if (isDragging) {
        e.preventDefault();
        xOffset = e.clientX - initialX;
        setTranslate1(xOffset, memberNumberBtn);
    }
}

function setTranslate(xPos, el) {
    $(".member-number-btn").css("transform", `translateX(${xPos}px)`);
}
function setTranslate1(xPos, el) {
    $(".choose-time .choose-time-btn div").css(
        "transform",
        `translateX(${xPos}px)`
    );
}
