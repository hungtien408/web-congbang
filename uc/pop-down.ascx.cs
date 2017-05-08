using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class uc_pop_down : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    private void sendEmail()
    {
        string msg = "<h3>CÔNG BẰNG: CONTACT</h3><br/>";
        msg += "<b>Name: </b>" + txtName.Text.Trim().ToString() + "<br />";
        msg += "<b>Email: </b>" + txtEmail.Text.Trim().ToString() + "<br />";
        msg += "<b>Phone: </b>" + txtPhone.Text.Trim().ToString() + "<br />";
        msg += "<b>Address: </b>" + txtAddress.Text.Trim().ToString();

        TLLib.Common.SendMail("smtp.gmail.com", 587, "webmastersendmail0401@gmail.com", "web123master", "hungtien408@gmail.com", "", "Contact CÔNG BẰNG", msg, true);
    }
    protected void btGui_Click(object sender, EventArgs e)
    {

        if (Page.IsValid)
        {
            if (RadCaptcha1.IsValid)
            {      
                sendEmail();

                downloadFile.InnerHtml = "<a id='downloadlink' download href='/res/projectcategory/download/" + hdnFile.Value + "'></a>";

                txtName.Text = "";
                txtAddress.Text = "";
                txtEmail.Text = "";
                txtPhone.Text = "";
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "runtime", " $(document).ready(function () { showPopup(); });", true);
        }
    }
}