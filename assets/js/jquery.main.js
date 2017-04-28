(function ($) {
    $(window).load(function () {
    });
    $(window).resize(function () {
        height_win();
    });
    $(function () {
        myfunload();
        height_win();
        respon_intro();
        bg_ab();
    });
})(jQuery);
function height_win() {
    n = $(window).height();
    if ($(window).width() >= 992) {
        $('#main-content').height(n);
    }
    else {
        $('#main-content').height('auto');
    }

    $('.menu-mobile').css('min-height', n);
}
function bg_ab() {
    n = $('.absolute-bg img').attr('src');
    $('.absolute-bg').css('background-image', 'url("' + n + '")');
    $('.absolute-bg').children('img').hide();

    $('.bg-ab-slide .carousel-inner .item').each(function () {
        $item = $(this).children('img');
        $src = $item.attr('src');
        $item.hide();
        $(this).css('background-image', 'url("' + $src + '")');
    });
}
//function===============================================================================================
/*=============================fun=========================================*/
function myfunload() {
    $(".panel-a").mobilepanel();
    $("#menu > li").not(".home").clone().appendTo($("#menuMobiles"));
    $("#menuMobiles input").remove();
    $("#menuMobiles > li > a").append('<span class="fa fa-chevron-circle-right iconar"></span>');
    $("#menuMobiles li li a").append('<span class="fa fa-angle-right iconl"></span>');
    //$("#menu > li:last-child").addClass("last");
    //$("#menu > li:first-child").addClass("fisrt");
    $('#menu li').hover(function () {
        $(this).children('ul').stop(true, false, true).slideToggle(300);
    });

    $('.carousel-indicators').find('li').first().addClass('active');
    $('.carousel-inner').find('.item').first().addClass('active');

    /* viet them menu */
    //$('.menu-level').parent().addClass('parent-li');
    //$('.parent-li').append('<i class="fa fa-chevron-right"></i>');
    //$('.parent-li').click(function (e) {
    //    e.preventDefault();
    //    $(this).children('ul').stop(true, false, true).slideToggle(300);
    //    $(this).find('i').toggleClass('fa-chevron-down');
    //});
    $('.main-wrap .left .content-left').mCustomScrollbar({
        theme: "dark-thick",
    });
    $('.bg-ab-slide .carousel-caption .right .wrap-right').mCustomScrollbar({
        theme: "dark-thick",
    });
    $('.main-wrap .right .menu-news').mCustomScrollbar({
        theme: "dark-thick",
    });
    $('.menu-mobile').mCustomScrollbar({
        theme: "dark-thick",
    });

    $('.hover-contact').click(function () {
        $(this).hide();
        $(this).prev().hide();
        $('.contact-box-hid').addClass('active');
    });
}
/*=========================================================================*/
//================== scroll top
$(window).scroll(function () {
    if ($(this).scrollTop() > 100) {
        $('.scroll-to-top').fadeIn();
    } else {
        $('.scroll-to-top').fadeOut();
    }
});

$('.scroll-to-top').on('click', function (e) {
    e.preventDefault();
    $('html, body').animate({ scrollTop: 0 }, 800);
    return false;
});

function mainHeight() {
    var win_height = $(window).height();
    $('.background-slide').height(win_height);
    $('.page-left').height(win_height);
    var height_main = $('.page-left').height();
    var height_logo = $('.page-left .logo').outerHeight();
    var height_foot = $('.page-left .foot-left').outerHeight();
    //console.log(height_main, height_logo, height_foot);
    $('.main-menu').outerHeight(height_main - (height_logo + (height_foot + 20)));
}

$('.wrap-pop-down li a').click(function (e) {
    e.preventDefault();
    $('#main-content').append('<div id="overlay-screen-active">');
    $('.popup .popup-content').css('top', '0');
});
$(document).on('click', ".popup-btn-close, #overlay-screen-active", function () {
    $('.popup-content').css('top', '-250%');
    $('#overlay-screen-active').fadeOut();
    $('#overlay-screen-active').remove();
    return false;
});
function respon_intro() {
    $('.wrap-intro').append('<div class="intro_hidden"></div>');
    $('.wrap-intro .carousel-inner').clone().appendTo('.intro_hidden');
}