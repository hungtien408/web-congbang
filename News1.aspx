<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="News1.aspx.cs" Inherits="Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="Server">
    <div id="carousel-example-generic" class="carousel slide bg-ab-slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <asp:ListView ID="lstItem" runat="server"
                DataSourceID="odsBannerService" EnableModelValidation="True">
                <ItemTemplate>
                    <li data-target="#carousel-example-generic" data-slide-to='<%# Container.DataItemIndex %>' class='<%# (Container.DataItemIndex) == 0 ? "active" : "" %>'></li>
                </ItemTemplate>
                <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                </LayoutTemplate>
            </asp:ListView>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">

            <asp:Repeater ID="RepeaterBanner" runat="server" DataSourceID="odsBannerService">
                <ItemTemplate>
                    <div class="item">
                        <img alt="" src='<%# "~/res/projectcategory/album/" + Eval("ImageName") %>' runat="server"
                            visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>' />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:ObjectDataSource ID="odsBannerService" runat="server" SelectMethod="ProjectCategoryImageSelectAll" TypeName="TLLib.ProjectCategoryImage">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="ni" DefaultValue="7" Name="ProjectCategoryID" Type="String"></asp:QueryStringParameter>
                    <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Priority" Type="String"></asp:Parameter>
                    <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String"></asp:Parameter>
                    <asp:Parameter Name="IsBackground" Type="String"></asp:Parameter>
                </SelectParameters>
            </asp:ObjectDataSource>

        </div>
    </div>
    <div class="main-wrap">
        <div class="left">
            <div class="content-left">
                <asp:Repeater ID="RepeaterService" runat="server" DataSourceID="odsService">
                    <ItemTemplate>
                        <h1><%# Eval("ProjectCategoryNameEn") %></h1>
                        <p>
                            <%# Eval("ContentEn") %>
                        </p>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource ID="odsService" runat="server" SelectMethod="ProjectCategorySelectOne" TypeName="TLLib.ProjectCategory">
                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="ni" DefaultValue="7" Name="ProjectCategoryID" Type="String"></asp:QueryStringParameter>
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
        <div class="right">
            <div class="menu-news">
                <ul>
                    <asp:Repeater ID="RepeaterServiceCategory" runat="server" DataSourceID="odsServiceCategory">
                        <ItemTemplate>
                            <li><a href='<%# SiteCode.progressTitle(Eval("ProjectCategoryNameEn")) + "-"+(Eval("CountProject").ToString() == "0"?"ni":"nid")+"-" + Eval("ProjectCategoryID") + ".aspx" %>'><%# Eval("ProjectCategoryNameEn") %></a></li>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:ObjectDataSource ID="odsServiceCategory" runat="server" SelectMethod="ProjectCategorySelectAll" TypeName="TLLib.ProjectCategory">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="ni" DefaultValue="7" Name="parentID" Type="Int32"></asp:QueryStringParameter>
                            <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="IsShowOnMenu" Type="String"></asp:Parameter>
                            <asp:Parameter Name="IsShowOnHomePage" Type="String"></asp:Parameter>
                            <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String"></asp:Parameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </ul>

            </div>
        </div>
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

