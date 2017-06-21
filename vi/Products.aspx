<%@ Page Title="" Language="C#" MasterPageFile="~/vi/site.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Services" %>

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
                    <asp:QueryStringParameter QueryStringField="pi" DefaultValue="3" Name="ProjectCategoryID" Type="String"></asp:QueryStringParameter>
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
                        <h1><%# Eval("ProjectCategoryName") %></h1>
                        <p>
                            <%# Eval("Content") %>
                        </p>
                        <asp:ListView ID="lstDownload" runat="server"
                            DataSourceID="odsDownload" EnableModelValidation="True">
                            <ItemTemplate>
                                <li><a href="javascript:void(0);" data-link='<%# Eval("LinkDownload") %>'><%# Eval("FileNameEn") %></a></li>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <div class="wrap-pop-down">
                                    <ul>
                                        <li runat="server" id="itemPlaceholder"></li>
                                    </ul>
                                </div>
                            </LayoutTemplate>
                        </asp:ListView>
                        <asp:ObjectDataSource ID="odsDownload" runat="server" SelectMethod="ProjectCategoryDownloadSelectAll" TypeName="TLLib.ProjectCategoryDownload">
                            <SelectParameters>
                                <asp:QueryStringParameter QueryStringField="pi" Name="ProjectCategoryID" Type="String"></asp:QueryStringParameter>
                                <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Priority" Type="String"></asp:Parameter>
                                <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String"></asp:Parameter>
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource ID="odsService" runat="server" SelectMethod="ProjectCategorySelectOne" TypeName="TLLib.ProjectCategory">
                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="pi" DefaultValue="3" Name="ProjectCategoryID" Type="String"></asp:QueryStringParameter>
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
        <div class="right">
            <div class="menu-right">
                <asp:HiddenField ID="hdnProjectCategoryID" runat="server" />
                <ul>
                    <asp:Repeater ID="RepeaterServiceCategory" runat="server" DataSourceID="odsServiceCategory">
                        <ItemTemplate>
                            <li><a href='<%# SiteCode.progressTitle(Eval("ProjectCategoryName")) + "-pi-" + Eval("ProjectCategoryID") + ".aspx" %>'><%# Eval("ProjectCategoryName") %></a></li>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:ObjectDataSource ID="odsServiceCategory" runat="server" SelectMethod="ProjectCategorySelectAll" TypeName="TLLib.ProjectCategory">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hdnProjectCategoryID" DefaultValue="3" PropertyName="Value" Name="parentID" Type="Int32"></asp:ControlParameter>
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
                <h4>Nhà phân phối ủy quyền</h4>
                <a href="#">
                    <img src="/vi/assets/images/logo-2.png" alt="" /></a>
            </div>
        </div>
    </div>
</asp:Content>

