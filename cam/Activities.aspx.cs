using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TLLib;

public partial class Services : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string strTitle, strDescription, strMetaTitle, strMetaDescription;
            if (!string.IsNullOrEmpty(Request.QueryString["aci"]))
            {
                var oProjectCategory = new ProjectCategory();
                var dv = oProjectCategory.ProjectCategorySelectOne(Request.QueryString["aci"]).DefaultView;

                if (dv != null && dv.Count <= 0) return;
                var row = dv[0];
                strTitle = Server.HtmlDecode(row["ProjectCategoryNameCam"].ToString());
                strDescription = Server.HtmlDecode(row["DescriptionCam"].ToString());
                strMetaTitle = Server.HtmlDecode(row["MetaTitleCam"].ToString());
                strMetaDescription = Server.HtmlDecode(row["MetaDescriptionCam"].ToString());

                //hdnDesign.Value = progressTitle(dv[0]["ProductCategoryName"].ToString()) + "-dci-" + dv[0]["ProductCategoryID"].ToString() + ".aspx";
                Page.Title = !string.IsNullOrEmpty(strMetaTitle) ? strMetaTitle : strTitle;
                var meta = new HtmlMeta()
                {
                    Name = "description",
                    Content = !string.IsNullOrEmpty(strMetaDescription) ?
                        strMetaDescription : strDescription
                };
                Header.Controls.Add(meta);
                //lblTitle.Text = strTitle;
            }            
            
            
        }
    }
}