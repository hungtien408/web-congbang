<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="project-details.aspx.cs" Inherits="project_details" %>

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
                        <img src="res/project/album/<%# Eval("ImageName") %>" alt="" />
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
    <div class="main-wrap">
        <div class="left">
            <div class="main-img-project">
                <div class="swiper-container">
                    <div class="swiper-wrapper">
                        <asp:Repeater ID="RepeaterSlider" runat="server" DataSourceID="odsSlider" EnableViewState="false">
                            <ItemTemplate>
                                <div class="swiper-slide">
                                    <img src="res/project/album/<%# Eval("ImageName") %>" />
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:ObjectDataSource ID="odsSlider" runat="server" SelectMethod="ProjectImageSelectAll" TypeName="TLLib.ProjectImage">
                            <SelectParameters>
                                <asp:QueryStringParameter QueryStringField="nid" Name="ProjectID" Type="String"></asp:QueryStringParameter>
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
                <div class="content-left wrap-absolute">
                    <asp:Repeater ID="Repeater1" runat="server" EnableViewState="false">
                        <ItemTemplate>
                            <h1><%# Eval("ProjectTitleEn") %></h1>
                            <p><%# Eval("ContentEn") %></p>
                            <span class="readmore">xem chi tiết</span>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:ObjectDataSource ID="odsContent" runat="server" SelectMethod="ProjectSelectOne" TypeName="TLLib.Project">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="prd" Name="ProjectID" Type="String"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="odsContent1" runat="server" SelectMethod="ProjectSelectAll" TypeName="TLLib.Project">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="StartRowIndex" Type="String"></asp:Parameter>
                            <asp:Parameter DefaultValue="1" Name="EndRowIndex" Type="String"></asp:Parameter>
                            <asp:Parameter Name="Keyword" Type="String"></asp:Parameter>
                            <asp:Parameter Name="ProjectTitle" Type="String"></asp:Parameter>
                            <asp:Parameter Name="Description" Type="String"></asp:Parameter>
                            <asp:QueryStringParameter QueryStringField="prid" DefaultValue="" Name="ProjectCategoryID" Type="String"></asp:QueryStringParameter>
                            <asp:Parameter Name="Tag" Type="String"></asp:Parameter>
                            <asp:Parameter Name="IsHot" Type="String"></asp:Parameter>
                            <asp:Parameter Name="IsNew" Type="String"></asp:Parameter>
                            <asp:Parameter Name="IsShowOnHomePage" Type="String"></asp:Parameter>
                            <asp:Parameter Name="FromDate" Type="String"></asp:Parameter>
                            <asp:Parameter Name="ToDate" Type="String"></asp:Parameter>
                            <asp:Parameter DefaultValue="true" Name="IsAvailable" Type="String"></asp:Parameter>
                            <asp:Parameter Name="Priority" Type="String"></asp:Parameter>
                            <asp:Parameter DefaultValue="true" Name="SortByPriority" Type="String"></asp:Parameter>


                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
            </div>
        </div>
        <div class="right">
            <div class="menu-right PJde-menu">
                <ul>
                    <asp:HiddenField ID="hdnProjectID" runat="server" />
                   
                    <asp:Repeater ID="RepeaterServiceCategory" runat="server" DataSourceID="odsServiceCategory">
                        <ItemTemplate>
                            <li><a href='<%# SiteCode.progressTitle(Eval("ProjectTitleEn")) + "-prd-" + Eval("ProjectID") + ".aspx" %>'><%# Eval("ProjectTitleEn") %></a></li>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:ObjectDataSource ID="odsServiceCategory" runat="server" SelectMethod="ProjectSelectAll" TypeName="TLLib.Project">
                        <SelectParameters>
                            <asp:Parameter Name="StartRowIndex" Type="String"></asp:Parameter>
                            <asp:Parameter Name="EndRowIndex" Type="String"></asp:Parameter>
                            <asp:Parameter Name="Keyword" Type="String"></asp:Parameter>
                            <asp:Parameter Name="ProjectTitle" Type="String"></asp:Parameter>
                            <asp:Parameter Name="Description" Type="String"></asp:Parameter>
                            <asp:ControlParameter ControlID="hdnProjectID" PropertyName="Value" Name="ProjectCategoryID" Type="String"></asp:ControlParameter>
                            <asp:Parameter Name="Tag" Type="String"></asp:Parameter>
                            <asp:Parameter Name="IsHot" Type="String"></asp:Parameter>
                            <asp:Parameter Name="IsNew" Type="String"></asp:Parameter>
                            <asp:Parameter Name="IsShowOnHomePage" Type="String"></asp:Parameter>
                            <asp:Parameter Name="FromDate" Type="String"></asp:Parameter>

                            <asp:Parameter Name="ToDate" Type="String"></asp:Parameter>
                            <asp:Parameter Name="IsAvailable" Type="String" DefaultValue="True"></asp:Parameter>
                            <asp:Parameter Name="Priority" Type="String"></asp:Parameter>
                            <asp:Parameter DefaultValue="" Name="SortByPriority" Type="String"></asp:Parameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </ul>
            </div>
        </div>
    </div>
    <div class="img-project owl-carousel">
        <asp:Repeater ID="RepeaterSame" runat="server" DataSourceID="odsProjectSame" EnableViewState="false">
            <ItemTemplate>
                <div class="item">
                    <a href="<%# SiteCode.progressTitle(Eval("ProjectTitleEn")) + "-prd-" + Eval("ProjectID") + ".aspx" %>">
                        <img src="res/project/album/<%# Eval("ImageName") %>" alt="" />
                        <p><%# Eval("ContentEn") %></p>
                    </a>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:ObjectDataSource ID="odsProjectSame" runat="server" SelectMethod="ProjectSameSelectAll" TypeName="TLLib.Project">
            <SelectParameters>
                <asp:Parameter Name="RerultCount" Type="String" DefaultValue="10"></asp:Parameter>
                <asp:ControlParameter ControlID="hdnProjectID" DefaultValue="" Name="ProjectID" PropertyName="Value" Type="String" />

            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="copy_footer" runat="Server">
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

