<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Introduction.aspx.cs" Inherits="Introduction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Công bằng</title>
    <meta name="description" content="Công bằng" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="Server">
    <div class="wrap-intro">
        <div id="carousel-example-generic" class="carousel slide bg-ab-slide intro_show" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <asp:ListView ID="lstItem" runat="server"
                    DataSourceID="odsServiceCategory" EnableModelValidation="True">
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
                <asp:Repeater ID="RepeaterServiceCategory" runat="server" DataSourceID="odsServiceCategory">
                    <ItemTemplate>
                        <div class="item">
                            <img alt="" src='<%# "~/res/projectcategory/" + Eval("ImageName") %>' runat="server"
                                visible='<%# string.IsNullOrEmpty( Eval("ImageName").ToString()) ? false : true %>' />
                            <div class="carousel-caption">
                                <%# Eval("Content") %>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource ID="odsServiceCategory" runat="server" SelectMethod="ProjectCategorySelectAll" TypeName="TLLib.ProjectCategory">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="parentID" Type="Int32"></asp:Parameter>
                        <asp:Parameter DefaultValue="1" Name="increaseLevelCount" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="IsShowOnMenu" Type="String"></asp:Parameter>
                        <asp:Parameter Name="IsShowOnHomePage" Type="String"></asp:Parameter>
                        <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String"></asp:Parameter>
                    </SelectParameters>
                </asp:ObjectDataSource>
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

