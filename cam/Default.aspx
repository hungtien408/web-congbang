<%@ Page Title="" Language="C#" MasterPageFile="~/cam/site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Công bằng</title>
    <meta name="description" content="Công bằng" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_content" runat="Server">
    <div class="absolute-bg">
        <asp:Repeater ID="RepeaterBanner" runat="server" DataSourceID="odsBannerHome">
            <ItemTemplate>
                <img alt="" src='<%# "~/res/advertisement/" + Eval("FileName") %>' runat="server"
                    visible='<%# string.IsNullOrEmpty( Eval("FileName").ToString()) ? false : true %>' />
            </ItemTemplate>
        </asp:Repeater>
        <asp:ObjectDataSource ID="odsBannerHome" runat="server"
            SelectMethod="AdsBannerSelectAll" TypeName="TLLib.AdsBanner">
            <SelectParameters>
                <asp:Parameter Name="StartRowIndex" Type="String" />
                <asp:Parameter Name="EndRowIndex" Type="String" />
                <asp:Parameter DefaultValue="5" Name="AdsCategoryID" Type="String" />
                <asp:Parameter Name="CompanyName" Type="String" />
                <asp:Parameter Name="Website" Type="String" />
                <asp:Parameter Name="FromDate" Type="String" />
                <asp:Parameter Name="ToDate" Type="String" />
                <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                <asp:Parameter Name="Priority" Type="String" />
                <asp:Parameter Name="SortByPriority" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="copy_footer" runat="Server">
    <div class="df-footer ft-trangchu">
        <div class="wrap-con">
            <div class="door">
                <a href="Introduction.aspx">
                    <img src="/cam/assets/images/bg-ft-df.png" alt="" /></a>
            </div>
            <div class="bor bg-df-ft">
                <h1>ស្វាគមន៍​មកកាន់</h1>
                <a href="/cam/">
                    <img src="/cam/assets/images/logo-1.jpg" alt="" /></a>
                <div class="lang">
                    <a href="/vi/">
                        <img src="/cam/assets/images/vi.png" alt="" /></a>
                    <a href="/">
                        <img src="/cam/assets/images/en.png" alt="" /></a>
                    <a href="/cam/">
                        <img src="/cam/assets/images/thai.png" alt="" /></a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

