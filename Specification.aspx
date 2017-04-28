<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Specification.aspx.cs" Inherits="Specification" %>

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
                <img src="assets/images/banner-10.png" alt="" />
            </div>
        </div>
    </div>
    <div class="main-wrap">
        <div class="left">
            <div class="content-left">
                <h1>SPECIFICATION</h1>
                <ul>
                    <li>Tiêu chuẩn an toàn chống cháy: Australia: AS1530.3 (1999)</li>
                    <li>Tiêu chuẩn an toàn môi trường và con người: Certified ZERO VOC ( Certified "Green Star" Product)</li>
                    <li>Lắp đặt dễ dàng, do có lớp keo đặc biệt G60 dán sẳn tiết kiệm tối đa chi phí và thời gian thi công, không cần vật tư phụ...<a href="#">Xem thêm <i class="fa fa-caret-down"></i></a></li>
                </ul>
            </div>
        </div>
        <div class="right">
            <div class="menu-right">
                <ul>
                    <li><a href="#">Advantages</a></li>
                    <li><a href="Specification.aspx">Specification</a></li>
                    <li><a href="Photos.aspx">Photos Library</a></li>
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