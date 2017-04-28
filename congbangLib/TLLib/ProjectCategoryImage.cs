using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace TLLib
{
    public class ProjectCategoryImage
    {
        string connectionString = Common.ConnectionString;
        DBNull dbNULL = DBNull.Value;

        public string ProjectCategoryImageInsert(
            string ImageName,
            string ConvertedProjectCategoryName,
            string Title,
            string Descripttion,
            string TitleEn,
            string DescripttionEn,
            string TitleCam,
            string DescripttionCam,
            string ProjectCategoryID,
            string IsAvailable,
            string Priority,
            string IsBackground
        )
        {
            try
            {
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_ProjectCategoryImage_Insert", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ImageName", string.IsNullOrEmpty(ImageName) ? dbNULL : (object)ImageName);
                cmd.Parameters.AddWithValue("@ConvertedProjectCategoryName", string.IsNullOrEmpty(ConvertedProjectCategoryName) ? dbNULL : (object)ConvertedProjectCategoryName);
                cmd.Parameters.AddWithValue("@Title", string.IsNullOrEmpty(Title) ? dbNULL : (object)Title);
                cmd.Parameters.AddWithValue("@Descripttion", string.IsNullOrEmpty(Descripttion) ? dbNULL : (object)Descripttion);
                cmd.Parameters.AddWithValue("@TitleEn", string.IsNullOrEmpty(TitleEn) ? dbNULL : (object)TitleEn);
                cmd.Parameters.AddWithValue("@DescripttionEn", string.IsNullOrEmpty(DescripttionEn) ? dbNULL : (object)DescripttionEn);
                cmd.Parameters.AddWithValue("@TitleCam", string.IsNullOrEmpty(TitleCam) ? dbNULL : (object)TitleCam);
                cmd.Parameters.AddWithValue("@DescripttionCam", string.IsNullOrEmpty(DescripttionCam) ? dbNULL : (object)DescripttionCam);
                cmd.Parameters.AddWithValue("@ProjectCategoryID", string.IsNullOrEmpty(ProjectCategoryID) ? dbNULL : (object)ProjectCategoryID);
                cmd.Parameters.AddWithValue("@IsAvailable", string.IsNullOrEmpty(IsAvailable) ? dbNULL : (object)IsAvailable);
                cmd.Parameters.AddWithValue("@Priority", string.IsNullOrEmpty(Priority) ? dbNULL : (object)Priority);
                cmd.Parameters.AddWithValue("@IsBackground", string.IsNullOrEmpty(IsBackground) ? dbNULL : (object)IsBackground);

                SqlParameter imageNameParam = new SqlParameter("@OutImageName", null);
                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                imageNameParam.Size = 100;
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = imageNameParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(imageNameParam);
                cmd.Parameters.Add(errorCodeParam);
                scon.Open();
                int success = cmd.ExecuteNonQuery();
                scon.Close();

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_ProjectCategoryImage_Insert' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return imageNameParam.Value.ToString();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int ProjectCategoryImageUpdate(
            string ProjectCategoryImageID,
            string ImageName,
            string ConvertedProjectCategoryName,
            string Title,
            string Descripttion,
            string TitleEn,
            string DescripttionEn,
            string TitleCam,
            string DescripttionCam,
            string ProjectCategoryID,
            string IsAvailable,
            string Priority,
            string IsBackground
        )
        {
            try
            {
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_ProjectCategoryImage_Update", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProjectCategoryImageID", string.IsNullOrEmpty(ProjectCategoryImageID) ? dbNULL : (object)ProjectCategoryImageID);
                cmd.Parameters.AddWithValue("@ImageName", string.IsNullOrEmpty(ImageName) ? dbNULL : (object)ImageName);
                cmd.Parameters.AddWithValue("@ConvertedProjectCategoryName", string.IsNullOrEmpty(ConvertedProjectCategoryName) ? dbNULL : (object)ConvertedProjectCategoryName);
                cmd.Parameters.AddWithValue("@Title", string.IsNullOrEmpty(Title) ? dbNULL : (object)Title);
                cmd.Parameters.AddWithValue("@Descripttion", string.IsNullOrEmpty(Descripttion) ? dbNULL : (object)Descripttion);
                cmd.Parameters.AddWithValue("@TitleEn", string.IsNullOrEmpty(TitleEn) ? dbNULL : (object)TitleEn);
                cmd.Parameters.AddWithValue("@DescripttionEn", string.IsNullOrEmpty(DescripttionEn) ? dbNULL : (object)DescripttionEn);
                cmd.Parameters.AddWithValue("@TitleCam", string.IsNullOrEmpty(TitleCam) ? dbNULL : (object)TitleCam);
                cmd.Parameters.AddWithValue("@DescripttionCam", string.IsNullOrEmpty(DescripttionCam) ? dbNULL : (object)DescripttionCam);
                cmd.Parameters.AddWithValue("@ProjectCategoryID", string.IsNullOrEmpty(ProjectCategoryID) ? dbNULL : (object)ProjectCategoryID);
                cmd.Parameters.AddWithValue("@IsAvailable", string.IsNullOrEmpty(IsAvailable) ? dbNULL : (object)IsAvailable);
                cmd.Parameters.AddWithValue("@Priority", string.IsNullOrEmpty(Priority) ? dbNULL : (object)Priority);
                cmd.Parameters.AddWithValue("@IsBackground", string.IsNullOrEmpty(IsBackground) ? dbNULL : (object)IsBackground);

                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                scon.Open();
                int success = cmd.ExecuteNonQuery();
                scon.Close();

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_ProjectCategoryImage_Update' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return success;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int ProjectCategoryImageQuickUpdate(
            string ProjectCategoryImageID,
            string IsAvailable,
            string Priority,
            string IsBackground
        )
        {
            try
            {
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_ProjectCategoryImage_QuickUpdate", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProjectCategoryImageID", string.IsNullOrEmpty(ProjectCategoryImageID) ? dbNULL : (object)ProjectCategoryImageID);
                cmd.Parameters.AddWithValue("@IsAvailable", string.IsNullOrEmpty(IsAvailable) ? dbNULL : (object)IsAvailable);
                cmd.Parameters.AddWithValue("@Priority", string.IsNullOrEmpty(Priority) ? dbNULL : (object)Priority);
                cmd.Parameters.AddWithValue("@IsBackground", string.IsNullOrEmpty(IsBackground) ? dbNULL : (object)IsBackground);

                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                scon.Open();
                int success = cmd.ExecuteNonQuery();
                scon.Close();

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_ProjectCategoryImage_QuickUpdate' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return success;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int ProjectCategoryImageDelete(
            string ProjectCategoryImageID
        )
        {
            try
            {
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_ProjectCategoryImages_Delete", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProjectCategoryImageID", string.IsNullOrEmpty(ProjectCategoryImageID) ? dbNULL : (object)ProjectCategoryImageID);
                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                scon.Open();
                int success = cmd.ExecuteNonQuery();
                scon.Close();

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_ProjectCategoryImages_Delete' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return success;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public DataTable ProjectCategoryImageSelectAll(
            string ProjectCategoryID,
            string IsAvailable,
            string Priority,
            string SortByPriority,
            string IsBackground
        )
        {
            try
            {
                var dt = new DataTable();
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_ProjectCategoryImage_SelectAll", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProjectCategoryID", string.IsNullOrEmpty(ProjectCategoryID) ? dbNULL : (object)ProjectCategoryID);
                cmd.Parameters.AddWithValue("@IsAvailable", string.IsNullOrEmpty(IsAvailable) ? dbNULL : (object)IsAvailable);
                cmd.Parameters.AddWithValue("@Priority", string.IsNullOrEmpty(Priority) ? dbNULL : (object)Priority);
                cmd.Parameters.AddWithValue("@SortByPriority", string.IsNullOrEmpty(SortByPriority) ? dbNULL : (object)SortByPriority);
                cmd.Parameters.AddWithValue("@IsBackground", string.IsNullOrEmpty(IsBackground) ? dbNULL : (object)IsBackground);

                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                var sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_ProjectCategoryImage_SelectAll' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return dt;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public DataTable ProjectCategoryImageSelectOne(
            string ProjectCategoryImageID
        )
        {
            try
            {
                var dt = new DataTable();
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_ProjectCategoryImage_SelectOne", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProjectCategoryImageID", string.IsNullOrEmpty(ProjectCategoryImageID) ? dbNULL : (object)ProjectCategoryImageID);
                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                var sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_ProjectCategoryImage_SelectOne' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return dt;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}

