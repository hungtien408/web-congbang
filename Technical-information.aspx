<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Technical-information.aspx.cs" Inherits="Technical_information" %>

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
                <img src="assets/images/banner-14.png" alt="" />
            </div>
        </div>
    </div>
    <div class="main-wrap">
        <div class="left">
            <div class="content-left">
                <h1>TECHNICAL INFORMATION</h1>
                <p>
                    Tiêu chuẩn an toàn chống cháy: Australia: AS1530.3 (1999) <br />
                    Tiêu chuẩn an toàn môi trường và con người: Certified ZERO VOC ( Certified "Green Star" Product) <br />
                    Lắp đặt dễ dàng, do có lớp keo đặc biệt G60 dán sẳn tiết kiệm tối đa chi phí và thời gian thi công, không cần vật tư phụ... <br />
                </p>
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

