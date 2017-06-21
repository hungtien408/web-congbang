<%@ Control Language="C#" AutoEventWireup="true" CodeFile="pop-down.ascx.cs" Inherits="uc_pop_down" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Register TagPrefix="asp" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<script type="text/javascript">
    $(document).ready(function () {
        var downloadLink = $('#downloadlink');
        if (downloadLink && downloadLink.length > 0) {
            downloadLink[0].click();
            setTimeout(function () {
                downloadLink[0].remove();
            }, 1000);
        }
    });
</script>
<div class="popup scroll-popup">
    <asp:HiddenField ID="hdnFile" runat="server" />
     <div class="popup-content">
        <div class="form-popup">
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="ឈ្មោះ"></asp:Label>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator3" runat="server"
                    Display="Dynamic" ValidationGroup="SendEmail" ControlToValidate="txtName"
                    ErrorMessage="ឈ្មោះ: Informaton required!" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" Text="អ៊ីម៉ែល"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator CssClass="lb-error" ID="RegularExpressionValidator1"
                    runat="server" ValidationGroup="SendEmail" ControlToValidate="txtEmail" ErrorMessage="Email: not match!"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"
                    ForeColor="Red"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator4" runat="server"
                    ValidationGroup="SendEmail" ControlToValidate="txtEmail" ErrorMessage="អ៊ីម៉ែល: Informaton required!"
                    Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:Label ID="Label3" runat="server" Text="ទូរស័ព្ទ"></asp:Label>
                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator1" runat="server"
                    Display="Dynamic" ValidationGroup="SendEmail" ControlToValidate="txtPhone"
                    ErrorMessage="ទូរស័ព្ទ: Informaton required!" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:Label ID="Label4" runat="server" Text="អាសយដ្ឋាន"></asp:Label>
                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator2" runat="server"
                    Display="Dynamic" ValidationGroup="SendEmail" ControlToValidate="txtAddress"
                    ErrorMessage="Informaton required!" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group capcha">
                <asp:Label ID="Label5" runat="server" Text="Capcha"></asp:Label>
                <asp:TextBox ID="txtVerifyCode" CssClass="contact-textbox" runat="server"></asp:TextBox>
                <%--<asp:RequiredFieldValidator CssClass="lb-error" ID="RequiredFieldValidator5" runat="server"
                    Display="Dynamic" ValidationGroup="SendEmail" ControlToValidate="txtVerifyCode"
                    ErrorMessage="Informaton required!" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                <asp:RadCaptcha ID="RadCaptcha1"  ValidatedTextBoxID="txtVerifyCode" ValidationGroup="SendEmail"
                    runat="server" Display="Dynamic" ErrorMessage="Code: not match."
                    CaptchaLinkButtonText="Refesh" CssClass="cap" EnableRefreshImage="True">
                    <CaptchaImage RenderImageOnly="True" Width="125" Height="35" BackgroundNoise="High"
                        BackgroundColor="White" TextColor="Black" FontFamily="Tohoma" TextLength="5" />
                </asp:RadCaptcha>

                <%--<span>m� captcha</span>--%>
            </div>
            <asp:Button ID="btnGui" runat="server" Text="ដាក់ស្នើ" ValidationGroup="SendEmail" OnClick="btGui_Click" />
    </div>
</div>
</div>
<div runat="server" id="downloadFile"></div>
