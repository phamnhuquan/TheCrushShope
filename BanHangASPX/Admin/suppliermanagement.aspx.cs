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
    public partial class suppliermanagement : System.Web.UI.Page
    {
        XuLyDuLieu xl = new XuLyDuLieu();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadGridView_Supplier();
            }
        }

        private void loadGridView_Supplier()
        {
            gridView_Supplier.DataSource = xl.readDataStored("selectSupplierManagement", null, null);
            gridView_Supplier.DataBind();
        }


        protected void btn_Select_Click(object sender, EventArgs e)
        {

            LinkButton linkbtn = (LinkButton)sender;
            string[] vals = new string[] { linkbtn.CommandName };
            string[] pars = new string[] { "@ID_SUPPLIER" };
            DataTable dt = xl.readDataStored("selectSupplierById", pars, vals);
            if (dt.Rows.Count == 1)
            {
                txt_IDSupplier.Text = dt.Rows[0]["ID_SUPPLIER"] + "";
                txt_SupplierName.Text = dt.Rows[0]["NAME_SUPPLIER"] + "";
                fileUpload_ImgSupplier.ID = dt.Rows[0]["IMG"] + "";
                txt_Description.Text = dt.Rows[0]["DESCRIPTION"] + "";
            }
        }
        protected void btn_Delete_Click(object sender, EventArgs e)
        {
            LinkButton linlbtn = (LinkButton)sender;
            string[] vals = new string[] { linlbtn.CommandName };
            string[] pars = new string[] { "@ID_SUPPLIER" };

            try
            {
                if (xl.updateDataStored("deleteSupplier", pars, vals) > 0)
                {
                    Response.Write("<Script>alert('Delete sucess')</Script>");
                    loadGridView_Supplier();
                }
            }
            catch (SqlException)
            {
                Response.Write("<Script>alert('Delete failed')</Script>");
            }
        }

        protected void btn_InserProduct_Click(object sender, EventArgs e)
        {
            string fileName = Guid.NewGuid() + System.IO.Path.GetExtension(fileUpload_ImgSupplier.FileName);
            fileUpload_ImgSupplier.SaveAs(Server.MapPath("img/supplier/") + fileName);

            string[] pars = new string[] {
                "@NAME_SUPPLIER",
                "@IMG",
                "@DESCRIPTION"};
            string[] vals = new string[] {
                txt_SupplierName.Text,
                fileName,
                txt_Description.Text
            };
            try
            {
                if (xl.updateDataStored("insertSupplier", pars, vals) > 0)
                {
                    Response.Write("<Script>alert('Insert sucess')</Script>");
                    loadGridView_Supplier();
                }
            }
            catch (SqlException)
            {
                Response.Write("<Script>alert('Insert failed')</Script>");
            }
        }

        protected void btn_UpdateProduct_Click(object sender, EventArgs e)
        {

            string fileName = Guid.NewGuid() + System.IO.Path.GetExtension(fileUpload_ImgSupplier.FileName);
            fileUpload_ImgSupplier.SaveAs(Server.MapPath("img/supplier/") + fileName);
            string[] pars = new string[] {
                "@ID_SUPPLIER",
                "@NAME_SUPPLIER",
                "@IMG",
                "@DESCRIPTION"};
            string[] vals = new string[] {
                txt_IDSupplier.Text,
                txt_SupplierName.Text,
                fileName,
                txt_Description.Text
            };
            try
            {
                if (xl.updateDataStored("updateSupplier", pars, vals) > 0)
                {
                    Response.Write("<Script>alert('Update sucess')</Script>");
                    loadGridView_Supplier();
                }
            }
            catch (SqlException)
            {
                Response.Write("<Script>alert('Update failed')</Script>");
            }

        }

        protected void btn_Reset_Click(object sender, EventArgs e)
        {
            txt_IDSupplier.Text = "";
            txt_SupplierName.Text = "";
            txt_Description.Text = "";
        }

    }
}