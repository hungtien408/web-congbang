<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" %>

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
                <img src="assets/images/banner-12.png" alt="" />
            </div>
        </div>
    </div>
    <div class="main-wrap">
        <div class="left">
            <div class="content-left">
                <h1>EXTERNAL & INTERNAL DUCT INSULATION</h1>
                <p>Appointed by Sekisui Foam International, Cong Bang Corporation is authorized distributor for Vietnam and Camobdia countries for all range of Thermobreak and Softlon products in Construction and Industry . <br /> <br />
                We have been supported large techical insulation and  offered  the best  solution for the most of projects to achieve saving engery, life span and comparetitive cost.</p>
            </div>
        </div>
        <div class="right">
            <div class="menu-right">
                <ul>
                    <li><a href="Thermobreak.aspx">Thermobreak</a></li>
                    <li><a href="Technical-information.aspx">Technical Information</a></li>
                    <li><a href="Certificates-test-report.aspx">Certificates & Test Report</a></li>
                    <li><a href="#">Catalog</a></li>
                    <li><a href="#">Recognization</a></li>
                </ul>
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

