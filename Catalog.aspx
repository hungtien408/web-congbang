<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Catalog.aspx.cs" Inherits="Catalog" %>

<%@ Register Src="~/uc/pop-down.ascx" TagPrefix="uc1" TagName="popdown" %>


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
                <img src="assets/images/banner-15.png" alt="" />
            </div>
        </div>
    </div>
    <div class="main-wrap">
        <div class="left">
            <div class="content-left none-pad-left">
                <h1>CERTIFICATES & TEST REPORT</h1>
                <div class="wrap-pop-down">
                    <ul>
                        <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing elit</a></li>
                        <li><a href="#">Donec at augue sit amet tellus commodo luctus non ac massa</a></li>
                        <li><a href="#">Donec imperdiet convallis ante, eget hendrerit quam bibendum vel</a></li>
                        <li><a href="#">Praesent faucibus dictum urna et sagittis</a></li>
                        <li><a href="#">Morbi eget congue libero</a></li>
                        <li><a href="#">Praesent porttitor felis congue velit dictum pharetra</a></li>
                        <li><a href="#">Pellentesque sed nulla ante</a></li>
                        <li><a href="#">Morbi euismod accumsan malesuada</a></li>
                        <li><a href="#">Duis bibendum nec ligula quis convallis</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="right">
            <div class="menu-right">
                <ul>
                    <li><a href="Thermobreak.aspx">Thermobreak</a></li>
                    <li><a href="Technical-information.aspx">Technical Information</a></li>
                    <li><a href="Certificates-test-report.aspx">Certificates & Test Report</a></li>
                    <li><a href="Catalog.aspx">Catalog</a></li>
                    <li><a href="#">Recognization</a></li>
                </ul>
            </div>
        </div>
    </div>
    <uc1:popdown runat="server" ID="popdown" />
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

