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
            if (!string.IsNullOrEmpty(Request.QueryString["pi"]))
            {
                var oProjectCategory = new ProjectCategory();
                var dv = oProjectCategory.ProjectCategorySelectOne(Request.QueryString["pi"]).DefaultView;

                if (dv != null && dv.Count <= 0) return;
                var row = dv[0];
                if (row["CountProject"].ToString() != "0")
                {
                    hdnProjectCategoryID.Value = Request.QueryString["pi"];
                }
                else
                {
                    hdnProjectCategoryID.Value = row["ParentID"].ToString();
                }
                strTitle = Server.HtmlDecode(row["ProjectCategoryName"].ToString());
                strDescription = Server.HtmlDecode(row["Description"].ToString());
                strMetaTitle = Server.HtmlDecode(row["MetaTitle"].ToString());
                strMetaDescription = Server.HtmlDecode(row["MetaDescription"].ToString());

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