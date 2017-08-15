<%@ Page Title="" Language="C#" MasterPageFile="~/cam/site.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact_hcm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Công bằng</title>
    <meta name="description" content="Công bằng" />
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
                    <asp:QueryStringParameter QueryStringField="ci" DefaultValue="8" Name="ProjectCategoryID" Type="String"></asp:QueryStringParameter>
                    <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Priority" Type="String"></asp:Parameter>
                    <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String"></asp:Parameter>
                    <asp:Parameter Name="IsBackground" Type="String"></asp:Parameter>
                </SelectParameters>
            </asp:ObjectDataSource>

        </div>
    </div>
    <div class="main-wrap">
        <div class="left" style="width:35%;">
            <div class="content-left">
                <asp:Repeater ID="RepeaterService" runat="server" DataSourceID="odsService">
                    <ItemTemplate>
                        <h1><%# Eval("ProjectCategoryNameCam") %></h1>
                        <p>
                            <%# Eval("ContentCam") %>
                        </p>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:ObjectDataSource ID="odsService" runat="server" SelectMethod="ProjectCategorySelectOne" TypeName="TLLib.ProjectCategory">
                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="ci" DefaultValue="8" Name="ProjectCategoryID" Type="String"></asp:QueryStringParameter>
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
        <div class="right">
            <div class="menu-contact">
                <div class="follow-us item">
                    <span>តាមយើងនៅលើ</span>
                    <a href="#"><i class="fa fa-facebook"></i></a>
                    <a href="#"><i class="fa fa-twitter"></i></a>
                    <a href="#"><i class="fa fa-google-plus"></i></a>
                </div>
                <div class="hover-contact item">
                    <p>ទំនក់ទំនង</p>
                </div>
                <div class="contact-box-hid">
                    <div class="closeContact"><i class="fa fa-times" aria-hidden="true"></i></div>
                    <%--<ul>
                        <li class="local">90/27 Trần Văn Ơn, P. Tân Sơn Nhì, Quận Tân Phú, Tp.Hồ Chí Minh</li>
                        <li class="phone">(848) 6260 4120 – 6260 4131</li>
                        <li class="fax">Fax: (848) 6253 9039</li>
                        <li class="mail">info@congbang.com.vn</li>
                        
                    </ul>--%>
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="odsService">
                        <ItemTemplate>
                            <%# Eval("DescriptionCam") %>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
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

