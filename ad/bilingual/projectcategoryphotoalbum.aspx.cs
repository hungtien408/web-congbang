using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.IO;
using TLLib;

public partial class ad_single_projectcategoryphotoalbum : System.Web.UI.Page
{
    #region Common Method

    void DeleteImage(string strOldImageName)
    {
        if (!string.IsNullOrEmpty(strOldImageName))
        {
            var strOldImagePath = Server.MapPath("~/res/projectcategory/album/" + strOldImageName);
            var strOldThumbImagePath = Server.MapPath("~/res/projectcategory/album/thumbs/" + strOldImageName);

            if (File.Exists(strOldImagePath))
                File.Delete(strOldImagePath);
            if (File.Exists(strOldThumbImagePath))
                File.Delete(strOldThumbImagePath);
        }
    }

    #endregion

    #region Event

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void RadSlider1_ValueChanged(object sender, EventArgs e)
    {
        var selectedValue = ((RadSlider)sender).Value;

        if (selectedValue == 1m)
        {
            ImageHeight = Unit.Pixel(150);
            ImageWidth = Unit.Pixel(150);
            RadListView1.PageSize = 20;
        }
        else if (selectedValue == 2m)
        {
            ImageHeight = Unit.Pixel(200);
            ImageWidth = Unit.Pixel(200);
            RadListView1.PageSize = 10;
        }
        else if (selectedValue == 3m)
        {
            ImageHeight = Unit.Pixel(350);
            ImageWidth = Unit.Pixel(350);
            RadListView1.PageSize = 6;
        }

        RadListView1.CurrentPageIndex = 0;
        RadListView1.Rebind();
    }

    protected Unit ImageWidth
    {
        get
        {
            object state = ViewState["ImageWidth"] ?? Unit.Pixel(150);
            return (Unit)state;
        }
        private set { ViewState["ImageWidth"] = value; }
    }

    protected Unit ImageHeight
    {
        get
        {
            object state = ViewState["ImageHeight"] ?? Unit.Pixel(150);
            return (Unit)state;
        }
        private set { ViewState["ImageHeight"] = value; }
    }

    protected void RadListView1_ItemCreated(object sender, RadListViewItemEventArgs e)
    {
        if (e.Item.ItemType == RadListViewItemType.InsertItem || e.Item.ItemType == RadListViewItemType.EditItem)
        {
            var item = e.Item;
            var FileImageName = (RadUpload)item.FindControl("FileImageName");
            RadAjaxPanel1.ResponseScripts.Add(string.Format("window['UploadId'] = '{0}';", FileImageName.ClientID));
        }
    }
    protected void RadListView1_ItemCommand(object sender, RadListViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "PerformInsert")
            {
                var item = e.ListViewItem;
                var FileImageName = (RadUpload)item.FindControl("FileImageName");

                var strProjectCategoryTitle = ((Label)FormView1.FindControl("lblProjectCategoryTitle")).Text.Trim();
                var strConvertedProjectCategoryName = Common.ConvertTitle(strProjectCategoryTitle);
                var strImageName = FileImageName.UploadedFiles.Count > 0 ? FileImageName.UploadedFiles[0].GetName() : "";
                var strTitle = ((TextBox)item.FindControl("txtTitle")).Text.Trim();
                var strDescription = ((TextBox)item.FindControl("txtDescription")).Text.Trim();
                var strTitleEn = ((TextBox)item.FindControl("txtTitleEn")).Text.Trim();
                var strDescriptionEn = ((TextBox)item.FindControl("txtDescriptionEn")).Text.Trim();
                var strTitleCam = ((TextBox)item.FindControl("txtTitleCam")).Text.Trim();
                var strDescriptionCam = ((TextBox)item.FindControl("txtDescriptionCam")).Text.Trim();
                var IsAvailable = ((CheckBox)item.FindControl("chkAddIsAvailable")).Checked.ToString();
                var IsBackground = ((CheckBox)item.FindControl("chkIsBackground")).Checked.ToString();
                var Priority = ((RadNumericTextBox)item.FindControl("txtPriority")).Text.Trim();
                var oProjectCategoryImage = new ProjectCategoryImage();

                strImageName = oProjectCategoryImage.ProjectCategoryImageInsert(
                    strImageName,
                    strConvertedProjectCategoryName,
                    strTitle,
                    strDescription,
                    strTitleEn,
                    strDescriptionEn,
                    strTitleCam,
                    strDescriptionCam,
                    Request.QueryString["PI"],
                    IsAvailable,
                    Priority,
                    IsBackground);

                string strFullPath = "~/res/projectcategory/album/" + strImageName;

                if (!string.IsNullOrEmpty(strImageName))
                {
                    FileImageName.UploadedFiles[0].SaveAs(Server.MapPath(strFullPath));
                    //ResizeCropImage.ResizeByCondition(strFullPath, 600, 600);
                    //ResizeCropImage.CreateThumbNailByCondition("~/res/projectcategory/album/", "~/res/projectcategory/album/thumbs/", strImageName, 120, 120);
                }
                RadListView1.InsertItemPosition = RadListViewInsertItemPosition.None;
            }
            else if (e.CommandName == "Update")
            {
                var item = e.ListViewItem;
                var FileImageName = (RadUpload)item.FindControl("FileImageName");
                var dsUpdateParam = ObjectDataSource1.UpdateParameters;

                var strProjectCategoryImageID = ((HiddenField)e.ListViewItem.FindControl("hdnProjectCategoryImageID")).Value;
                var strProjectCategoryTitle = ((Label)FormView1.FindControl("lblProjectCategoryTitle")).Text.Trim();
                var strConvertedProjectCategoryName = Common.ConvertTitle(strProjectCategoryTitle);
                var strImageName = FileImageName.UploadedFiles.Count > 0 ? FileImageName.UploadedFiles[0].GetName() : "";
                var strOldImageName = ((HiddenField)e.ListViewItem.FindControl("hdnImageName")).Value;
                var strIsAvailable = ((CheckBox)item.FindControl("chkAddIsAvailable")).Checked.ToString();
                var strIsBackground = ((CheckBox)item.FindControl("chkIsBackground")).Checked.ToString();

                dsUpdateParam["ImageName"].DefaultValue = strImageName;
                dsUpdateParam["ConvertedProjectCategoryName"].DefaultValue = strConvertedProjectCategoryName;
                dsUpdateParam["IsAvailable"].DefaultValue = strIsAvailable;
                dsUpdateParam["IsBackground"].DefaultValue = strIsBackground;

                if (!string.IsNullOrEmpty(strImageName))
                {
                    var strOldImagePath = Server.MapPath("~/res/projectcategory/album/" + strOldImageName);
                    var strOldThumbImagePath = Server.MapPath("~/res/projectcategory/album/thumbs/" + strOldImageName);

                    if (File.Exists(strOldImagePath))
                        File.Delete(strOldImagePath);
                    if (File.Exists(strOldThumbImagePath))
                        File.Delete(strOldThumbImagePath);

                    strImageName = (string.IsNullOrEmpty(strConvertedProjectCategoryName) ? "" : strConvertedProjectCategoryName + "-") + strProjectCategoryImageID + strImageName.Substring(strImageName.LastIndexOf('.'));
                    string strFullPath = "~/res/projectcategory/album/" + strImageName;

                    FileImageName.UploadedFiles[0].SaveAs(Server.MapPath(strFullPath));
                    //ResizeCropImage.ResizeByCondition(strFullPath, 600, 600);
                    //ResizeCropImage.CreateThumbNailByCondition("~/res/projectcategory/album/", "~/res/projectcategory/album/thumbs/", strImageName, 120, 120);
                }
            }
            else if (e.CommandName == "Delete")
            {
                var strOldImageName = ((HiddenField)e.ListViewItem.FindControl("hdnImageName")).Value;
                DeleteImage(strOldImageName);
            }
            else if (e.CommandName == "QuickUpdate")
            {
                string ProjectCategoryImageID, Priority, IsAvailable, IsBackground;
                var oProjectCategoryImage = new ProjectCategoryImage();

                foreach (RadListViewDataItem item in RadListView1.Items)
                {
                    ProjectCategoryImageID = item.GetDataKeyValue("ProjectCategoryImageID").ToString();
                    Priority = ((RadNumericTextBox)item.FindControl("txtPriority")).Text.Trim();
                    IsAvailable = ((CheckBox)item.FindControl("chkIsAvailable")).Checked.ToString();
                    IsBackground = ((CheckBox)item.FindControl("chkIsBackground")).Checked.ToString();

                    oProjectCategoryImage.ProjectCategoryImageQuickUpdate(
                        ProjectCategoryImageID,
                        IsAvailable,
                        Priority,
                        IsBackground
                    );
                }
            }
            else if (e.CommandName == "DeleteSelected")
            {
                var oProjectCategoryImage = new ProjectCategoryImage();
                string ProjectCategoryImageID, OldImageName;

                foreach (RadListViewDataItem item in RadListView1.Items)
                {
                    var chkSelect = (CheckBox)item.FindControl("chkSelect");

                    if (chkSelect.Checked)
                    {
                        ProjectCategoryImageID = item.GetDataKeyValue("ProjectCategoryImageID").ToString();
                        OldImageName = ((HiddenField)item.FindControl("hdnImageName")).Value;

                        DeleteImage(OldImageName);
                        oProjectCategoryImage.ProjectCategoryImageDelete(ProjectCategoryImageID);
                    }
                }
            }
            RadListView1.Rebind();
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }
    protected void FileImageAlbum_FileUploaded(object sender, FileUploadedEventArgs e)
    {
        var FileImageAlbum = (RadAsyncUpload)sender;
        var Parent = FileImageAlbum.NamingContainer;
        var ProjectCategoryID = Request.QueryString["PI"];//((HiddenField)Parent.FindControl("hdnProductID")).Value;
        //var RadListView1 = (RadListView)Parent.FindControl("RadListView1");
        //var RadListView2 = (RadListView)Parent.FindControl("RadListView2");

        string targetFolder = "~/res/projectcategory/album/";
        string newName = Guid.NewGuid().GetHashCode().ToString("X") + e.File.GetExtension();
        e.File.SaveAs(Server.MapPath(targetFolder + newName));

        //ResizeCropImage.ResizeByCondition(targetFolder + newName, 800, 800);
        //ResizeCropImage.CreateThumbNailByCondition("~/res/projectcategory/album/", "~/res/projectcategory/album/thumbs/", newName, 120, 120);

        //if (string.IsNullOrEmpty(ProductID))
        //{
        //    TempImage.Rows.Add(new object[] { newName });

        //    RadListView2.DataSource = TempImage;
        //    RadListView2.DataBind();
        //}
        //else
        //{
            var oProjectCategoryImage = new ProjectCategoryImage();

            oProjectCategoryImage.ProjectCategoryImageInsert(newName, "", "", "", "", "","","", ProjectCategoryID, "True", "","");
            RadListView1.Rebind();
        //}
    }
    #endregion
}