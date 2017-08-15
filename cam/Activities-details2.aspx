<%@ Page Title="" Language="C#" MasterPageFile="~/cam/site.master" AutoEventWireup="true" CodeFile="Activities-details2.aspx.cs" Inherits="News_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Công bằng</title>
    <meta name="description" content="Công bằng" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="Server">
    <div id="carousel-example-generic" class="carousel slide bg-ab-slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0"></li>
            <%--<li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>--%>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <asp:Repeater ID="RepeaterBanner" runat="server" DataSourceID="odsBanner" EnableViewState="false">
                <ItemTemplate>
                    <div class="item">
                        <img src="/res/project/album/<%# Eval("ImageName") %>" alt="" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:ObjectDataSource ID="odsBanner" runat="server" SelectMethod="ProjectImageSelectAll" TypeName="TLLib.ProjectImage">
                <SelectParameters>
                    <asp:ControlParameter ControlID="hdnProjectID" PropertyName="Value" Name="ProjectID" Type="String"></asp:ControlParameter>

                    <asp:Parameter DefaultValue="true" Name="IsBackground" Type="String"></asp:Parameter>
                    <asp:Parameter DefaultValue="true" Name="IsAvailable" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Priority" Type="String"></asp:Parameter>
                    <asp:Parameter DefaultValue="true" Name="SortByPriority" Type="String"></asp:Parameter>
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
    <div class="news-slide">
        <div class="swiper-container ">
            <div class="swiper-wrapper">
                <asp:Repeater ID="RepeaterSlider" runat="server" DataSourceID="odsSlider" EnableViewState="false">
                    <ItemTemplate>
                        <div class="swiper-slide">
                            <img src="/res/project/album/<%# Eval("ImageName") %>" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource ID="odsSlider" runat="server" SelectMethod="ProjectImageSelectAll" TypeName="TLLib.ProjectImage">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="hdnProjectID" PropertyName="Value" Name="ProjectID" Type="String"></asp:ControlParameter>

                        <asp:Parameter DefaultValue="false" Name="IsBackground" Type="String"></asp:Parameter>
                        <asp:Parameter DefaultValue="true" Name="IsAvailable" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Priority" Type="String"></asp:Parameter>
                        <asp:Parameter DefaultValue="true" Name="SortByPriority" Type="String"></asp:Parameter>
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>
    </div>
    <div class="main-wrap">
        <div class="left">
            <div class="content-left img-cont">
                <asp:Repeater ID="Repeater1" runat="server" EnableViewState="false" DataSourceID="odsContent">
                    <ItemTemplate>
                        <h1><%# Eval("ProjectTitleCam") %></h1>
                        <%# Eval("ContentCam") %>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource ID="odsContent" runat="server" SelectMethod="ProjectSelectOne" TypeName="TLLib.Project">
                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="acid" Name="ProjectID" Type="String"></asp:QueryStringParameter>
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
        <div class="right">
            <div class="menu-news">
                <ul>
                    <asp:Repeater ID="RepeaterSame" runat="server" DataSourceID="odsSame" EnableViewState="false">
                        <ItemTemplate>
                            <li><a href="<%# SiteCode.progressTitle(Eval("ProjectTitleCam")) + "-acid-" + Eval("ProjectID") + ".aspx" %>"><%# Eval("ProjectTitleCam") %></a></li>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:ObjectDataSource ID="odsSame" runat="server" SelectMethod="ProjectSameSelectAll" TypeName="TLLib.Project">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="10" Name="RerultCount" Type="String"></asp:Parameter>
                            <asp:QueryStringParameter QueryStringField="acid" Name="ProjectID" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </ul>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="hdnProjectID" runat="server" />
    <div class="news-video">
        <div class="wrapper-video">
            <asp:Repeater ID="RepeaterVideo" runat="server" DataSourceID="odsVideo" EnableViewState="false">
                <ItemTemplate>
                    <div class="video-details">
                        <div id="jwplayer1"></div>
                        <script type="text/javascript">
                            jwplayer.key = "yl/yqfTaFkHTZsvJEK6NtJYZZujiAxc3knwh";
                            $(document).ready(function () {
                                var w_height = $(window).height();
                                var w_width = $(window).width();
                                jwplayer('jwplayer1').setup({
                                    image: '/res/project/video/<%# Eval("ImagePath")%>',
                                    file: '<%# string.IsNullOrEmpty(Eval("ProjectVideoPath").ToString()) ? Eval("GLobalEmbedScript") :"/res/project/video/" + Eval("ProjectVideoPath")%>',
                                    flashplayer: "/cam/assets/js/jwplayer.flash.swf",
                                    height: 160,
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
                </ItemTemplate>
            </asp:Repeater>
            <asp:ObjectDataSource ID="odsVideo" runat="server" SelectMethod="ProjectVideoSelectAll" TypeName="TLLib.ProjectVideo">
                <SelectParameters>
                    <asp:Parameter Name="Keyword" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Title" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Description" Type="String"></asp:Parameter>
                    <asp:QueryStringParameter QueryStringField="acid" Name="ProjectID" Type="String"></asp:QueryStringParameter>
                    <asp:Parameter DefaultValue="" Name="IsAvailable" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Priority" Type="String"></asp:Parameter>
                    <asp:Parameter Name="SortByPriority" Type="String"></asp:Parameter>
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="copy_footer" runat="Server">
    <div class="df-footer">
        <div class="wrap-con">
            <div class="bor">
                <h4>មាន​សិទ្ធិ​អនុញ្ញាត​ពីចែកចាយ</h4>
                <a href="#">
                    <img src="/cam/assets/images/logo-2.png" alt="" /></a>
            </div>
        </div>
    </div>
</asp:Content>

