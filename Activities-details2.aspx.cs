﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TLLib;

public partial class News_details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string strTitle, strMetaTitle, strMetaDescription;
            if (!string.IsNullOrEmpty(Request.QueryString["acid"]))
            {
                var dv = (DataView)odsContent.Select();
                if (dv.Count > 0)
                {
                    var row = dv[0];
                    
                    hdnProjectID.Value = row["ProjectID"].ToString();
                    strTitle = Server.HtmlDecode(row["ProjectTitleEn"].ToString());
                    strMetaTitle = Server.HtmlDecode(row["MetaTittleEn"].ToString());
                    strMetaDescription = Server.HtmlDecode(row["MetaDescriptionEn"].ToString());

                    //hdnDesign.Value = progressTitle(dv[0]["ProductCategoryName"].ToString()) + "-dci-" + dv[0]["ProductCategoryID"].ToString() + ".aspx";
                    Page.Title = !string.IsNullOrEmpty(strMetaTitle) ? strMetaTitle : strTitle;
                    var meta = new HtmlMeta()
                    {
                        Name = "description",
                        Content = strMetaDescription
                    };
                    Header.Controls.Add(meta);
                }
                //lblTitle.Text = strTitle;
            }

        }
    }
}