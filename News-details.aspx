<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="News-details.aspx.cs" Inherits="News_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Công bằng</title>
    <meta name="description" content="Công bằng" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" Runat="Server">
    <div id="carousel-example-generic" class="carousel slide bg-ab-slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0"></li>
            <%--<li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>--%>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item">
                <img src="assets/images/banner-18.png" alt="" />
            </div>
        </div>
    </div>
    <div class="news-slide">
        <div class="swiper-container ">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <img src="assets/images/img-project1.jpg" /></div>
                <div class="swiper-slide">
                    <img src="assets/images/img-project2.jpg" /></div>
                <div class="swiper-slide">
                    <img src="assets/images/img-project3.jpg" /></div>
            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>
    </div>
    <div class="main-wrap">
        <div class="left">
            <div class="content-left img-cont">
                <h1>Lectus tellus et dapbus ante fermentum ut</h1>
                <p>Appointed by Sekisui Foam International, Cong Bang Corporation is authorized distributor for Vietnam and Camobdia countries for all range of Thermobreak and Softlon products in Construction and Industry . <br />
                We have been supported large techical insulation and  offered  the best  solution for the most of projects to achieve saving engery, life span and comparetitive cost. Fusce eget tempor nunc. Mauris malesuada lectus tellus, et dapibus ante fermentum ut. Fusce posuere massa nisl, sit amet interdum nulla tristique in. <br />
                </p>
                <p>Appointed by Sekisui Foam International, Cong Bang Corporation is authorized distributor for Vietnam and Camobdia countries for all range of Thermobreak and Softlon products in Construction and Industry . <br />
                We have been supported large techical insulation and  offered  the best  solution for the most of projects to achieve saving engery, life span and comparetitive cost. Fusce eget tempor nunc. Mauris malesuada lectus tellus, et dapibus ante fermentum ut. Fusce posuere massa nisl, sit amet interdum nulla tristique in. <br />
                </p>
            </div>
        </div>
        <div class="right">
            <div class="menu-news">
                <ul>
                    <li><a href="News-details.aspx">Fusce eget tempor nunc mauris malesuada</a></li>
                    <li><a href="News-details.aspx">Lectus tellus et dapbus ante fermentum ut</a></li>
                    <li><a href="News-details.aspx">Fusce posuere massa nisit amet interdum nulla</a></li>
                    <li><a href="News-details.aspx">Duis lobtis fringilla magna non varius </a></li>
                    <li><a href="News-details.aspx">Vestibulum fermentum eu metus eu varius</a></li>
                    <li><a href="News-details.aspx">Praesent pulvinar velit at consequat rutrumodio </a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="news-video">
        <div class="wrapper-video">
            <div class="video-details">
                <div id="jwplayer1"></div>
                <script type="text/javascript">
                    jwplayer.key = "yl/yqfTaFkHTZsvJEK6NtJYZZujiAxc3knwh";
                    $(document).ready(function () {
                        var w_height = $(window).height();
                        var w_width = $(window).width();
                        jwplayer('jwplayer1').setup({
                            image: '',
                            file: 'https://www.youtube.com/watch?v=DydIus2xA3I',
                            flashplayer: "assets/js/jwplayer.flash.swf",
                            height: 160,
                            quality: false,
                            width: 240,
                            dock: true,
                            //autostart: true,
                            primary: "html5",
                            aspectratio: '16:9',
                            //stretching: "fill",
                        });
                    });
                </script>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="copy_footer" Runat="Server">
    <div class="df-footer">
        <div class="wrap-con">
            <div class="bor">
                <h4>Authorized distributor of</h4>
                <a href="#">
                    <img src="assets/images/logo-2.png" alt="" /></a>
            </div>
        </div>
    </div>
</asp:Content>

