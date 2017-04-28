<%@ Control Language="C#" AutoEventWireup="true" CodeFile="pop-down.ascx.cs" Inherits="uc_pop_down" %>
<div class="popup scroll-popup">
    <div class="popup-content">
        <div class="form-popup">
            <p>Lorem ipsum dolor sit amet, consectetur adipis cing elit donec at augue sit amet </p>
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label3" runat="server" Text="Phone"></asp:Label>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label4" runat="server" Text="Address"></asp:Label>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </div>
            <div class="form-group capcha">
                <asp:Label ID="Label5" runat="server" Text="capcha"></asp:Label>
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                <span>mã captcha</span>
            </div>
            <asp:Button ID="Button1" runat="server" Text="Submit" />
        </div>
        <div class="popup-btn-close">
            <img src="assets/images/btn-close.png" alt="" />
        </div>
    </div>
</div>