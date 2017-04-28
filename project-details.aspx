<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="project-details.aspx.cs" Inherits="project_details" %>

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
                <img src="assets/images/banner-16.png" alt="" />
            </div>
        </div>
    </div>
    <div class="main-wrap">
        <div class="left">
            <div class="main-img-project">
                <div class="swiper-container">
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
                <div class="content-left wrap-absolute">
                    <h1>PROJECTS DETAIL</h1>
                    <p>Appointed by Sekisui Foam International, Cong Bang Corporation is authorized distributor for Vietnam and Camobdia countries for all range of Thermobreak and Softlon products in Construction and Industry . <br /> <br />
                    We have been supported large techical insulation and  offered  the best  solution for the most of projects to achieve saving engery, life span and comparetitive cost.
                        Appointed by Sekisui Foam International, Cong Bang Corporation is authorized distributor for Vietnam and Camobdia countries for all range of Thermobreak and Softlon products in Construction and Industry . <br /> <br />
                    We have been supported large techical insulation and  offered  the best  solution for the most of projects to achieve saving engery, life span and comparetitive cost.
                    </p>
                </div>
            </div>
        </div>
        <div class="right">
            <div class="menu-right PJde-menu">
                <ul>
                    <li><a href="#">Industrial Projects</a></li>
                    <li><a href="#">Commercial Projects</a></li>
                    <li><a href="#">Healthcare</a></li>
                    <li><a href="#">Others</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="img-project owl-carousel">
        <div class="item">
            <a href="#"><img src="assets/images/img-r-1.jpg" alt="" />
            <p>content</p></a></div>
        <div class="item">
            <a href="#"><img src="assets/images/img-r-1.jpg" alt="" />
            <p>content</p></a></div>
        <div class="item">
            <a href="#"><img src="assets/images/img-r-1.jpg" alt="" />
            <p>content</p></a></div>
        <div class="item">
            <a href="#"><img src="assets/images/img-r-1.jpg" alt="" />
            <p>content</p></a></div>
        <div class="item">
            <a href="#"><img src="assets/images/img-r-1.jpg" alt="" />
            <p>content</p></a></div>
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

