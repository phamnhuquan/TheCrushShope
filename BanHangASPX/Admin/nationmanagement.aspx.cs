using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace BanHangASPX.Admin
{
    public partial class nationmanagement : System.Web.UI.Page
    {
        XuLyDuLieu xl = new XuLyDuLieu();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadGridView_Nation();
            }
        }

        private void loadGridView_Nation()
        {
            gridView_Nation.DataSource = xl.readDataStored("selectNationManagement", null, null);
            gridView_Nation.DataBind();
        }


        protected void btn_Select_Click(object sender, EventArgs e)
        {

            LinkButton linkbtn = (LinkButton)sender;
            string[] vals = new string[] { linkbtn.CommandName };
            string[] pars = new string[] { "@ID_NATION" };
            DataTable dt = xl.readDataStored("selectNationById", pars, vals);
            if (dt.Rows.Count == 1)
            {
                txt_IDNation.Text = dt.Rows[0]["ID_NATION"] + "";
                txt_NationName.Text = dt.Rows[0]["NAME_NATION"] + "";
                fileUpload_ImgNation.ID = dt.Rows[0]["IMG"] + "";
                txt_Description.Text = dt.Rows[0]["DESCRIPTION"] + "";
            }
        }
        protected void btn_Delete_Click(object sender, EventArgs e)
        {
            LinkButton linlbtn = (LinkButton)sender;
            string[] vals = new string[] { linlbtn.CommandName };
            string[] pars = new string[] { "@ID_NATION" };

            try
            {
                if (xl.updateDataStored("deleteNation", pars, vals) > 0)
                {
                    Response.Write("<Script>alert('Delete sucess')</Script>");
                    loadGridView_Nation();
                }
            }
            catch (SqlException)
            {
                Response.Write("<Script>alert('Delete failed')</Script>");
            }
        }

        protected void btn_InserProduct_Click(object sender, EventArgs e)
        {
            string fileName = Guid.NewGuid() + System.IO.Path.GetExtension(fileUpload_ImgNation.FileName);
            fileUpload_ImgNation.SaveAs(Server.MapPath("img/nation/") + fileName);

            string[] pars = new string[] {
                "@NAME_NATION",
                "@IMG",
                "@DESCRIPTION"};
            string[] vals = new string[] {
                txt_NationName.Text,
                fileName,
                txt_Description.Text
            };
            try
            {
                if (xl.updateDataStored("insertNation", pars, vals) > 0)
                {
                    Response.Write("<Script>alert('Insert sucess')</Script>");
                    loadGridView_Nation();
                }
            }
            catch (SqlException)
            {
                Response.Write("<Script>alert('Insert failed')</Script>");
            }
        }

        protected void btn_UpdateProduct_Click(object sender, EventArgs e)
        {

            string fileName = Guid.NewGuid() + System.IO.Path.GetExtension(fileUpload_ImgNation.FileName);
            fileUpload_ImgNation.SaveAs(Server.MapPath("img/nation/") + fileName);
            string[] pars = new string[] {
                "@ID_NATION",
                "@NAME_NATION",
                "@IMG",
                "@DESCRIPTION"};
            string[] vals = new string[] {
                txt_IDNation.Text,
                txt_NationName.Text,
                fileName,
                txt_Description.Text
            };
            try
            {
                if (xl.updateDataStored("updateNation", pars, vals) > 0)
                {
                    Response.Write("<Script>alert('Update sucess')</Script>");
                    loadGridView_Nation();
                }
            }
            catch (SqlException)
            {
                Response.Write("<Script>alert('Update failed')</Script>");
            }

        }

        protected void btn_Reset_Click(object sender, EventArgs e)
        {
            txt_IDNation.Text = "";
            txt_NationName.Text = "";
            txt_Description.Text = "";
        }

    }
}