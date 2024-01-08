$(function () {
    //메뉴 모달부분
    let locationMenu = $(".menuImg");
    $(locationMenu).each(function (a, b) {
        $(this).on("click", function () {
            location.href = `locationmenu${a + 1}.html`;
        });
    });
    //배너슬라이드 부분
    var slideIndex = 1;
    showSlides(slideIndex);

    $(".prev").click(function () {
        plusSlides(-1);
    });

    $(".next").click(function () {
        plusSlides(1);
    });

    $(".dot").click(function () {
        var index = $(this).index() + 1;
        currentSlide(index);
    });

    $("#slideShow .slide").hover(
        function () {
            clearInterval(slideInterval);
        },
        function () {
            slideInterval = setInterval(function () {
                plusSlides(1);
            }, 2000);
        }
    );

    function showSlides(n) {
        var i;
        var slides = $(".slide");
        var dots = $(".dot");
        if (n > slides.length) {
            slideIndex = 1;
        }
        if (n < 1) {
            slideIndex = slides.length;
        }
        slides.hide();
        dots.removeClass("active");
        $(slides[slideIndex - 1]).show();
        $(dots[slideIndex - 1]).addClass("active");
    }
    function plusSlides(n) {
        showSlides((slideIndex += n));
    }

    function currentSlide(n) {
        showSlides((slideIndex = n));
    }

    var slideInterval = setInterval(function () {
        plusSlides(1);
    }, 2000);

    let roller = document.querySelector(".rolling-list");
    roller.id = 'roller1';
    let clone = roller.cloneNode(true)
    clone.id = 'roller2'
    document.querySelector(".recommand-main").appendChild(clone)
    document.querySelector('#roller1').style.left = '0px'
    document.querySelector("#roller2").style.left = document.querySelector('.rolling-list ul').offsetWidth + 'px';
    roller.classList.add('original');
    clone.classList.add('clone');   

    $("#profile>img").on("click",function(){
        $("#loginModal").css("display","block")
    })
    let modal = $("#loginModal");
    $(window).click(function (event) {
        if (event.target === modal[0]) {
            modal.css("display", "none");
        }
    });
});
