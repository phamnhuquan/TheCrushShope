using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace BanHangASPX.Admin
{
    public partial class itemtypemanagement : System.Web.UI.Page
    {
        XuLyDuLieu xl = new XuLyDuLieu();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadGridView_ItemType();
            }
        }

        private void loadGridView_ItemType()
        {
            gridView_ItemType.DataSource = xl.readDataStored("selectItemTypeManagement", null, null);
            gridView_ItemType.DataBind();
        }
        

        protected void btn_Select_Click(object sender, EventArgs e)
        {
            LinkButton linkbtn = (LinkButton)sender;
            string[] vals = new string[] { linkbtn.CommandName };
            string[] pars = new string[] { "@ID_ITEM_TYPE" };
            DataTable dt = xl.readDataStored("selectItemTypeById", pars, vals);
            if (dt.Rows.Count == 1)
            {
                txt_IDItemType.Text = dt.Rows[0]["ID_ITEM_TYPE"] + "";
                txt_IteamTypeName.Text = dt.Rows[0]["NAME_ITEM_TYPE"] + "";
                txt_Description.Text = dt.Rows[0]["DESCRIPTION"] + "";
            }
        }
        protected void btn_Delete_Click(object sender, EventArgs e)
        {
            LinkButton linlbtn = (LinkButton)sender;
            string[] vals = new string[] { linlbtn.CommandName };
            string[] pars = new string[] { "@ID_ITEM_TYPE" };

            try
            {
                if (xl.updateDataStored("deleteItemType", pars, vals) > 0)
                {
                    Response.Write("<Script>alert('Delete sucess')</Script>");
                    loadGridView_ItemType();
                }
            }
            catch (SqlException)
            {
                Response.Write("<Script>alert('Delete failed')</Script>");
            }
        }

        protected void btn_InserProduct_Click(object sender, EventArgs e)
        {

            string[] pars = new string[] {
                "@NAME_ITEM_TYPE",
                "@DESCRIPTION"};
            string[] vals = new string[] {
                txt_IteamTypeName.Text,
                txt_Description.Text
            };
            try
            {
                if (xl.updateDataStored("insertItemType", pars, vals) > 0)
                {
                    Response.Write("<Script>alert('Insert sucess')</Script>");
                    loadGridView_ItemType();
                }
            }
            catch (SqlException)
            {
                Response.Write("<Script>alert('Insert failed')</Script>");
            }
        }

        protected void btn_UpdateProduct_Click(object sender, EventArgs e)
        {


            string[] pars = new string[] {
                "@ID_ITEM_TYPE",
                "@NAME_ITEM_TYPE",
                "@DESCRIPTION"};
            string[] vals = new string[] {
                txt_IDItemType.Text,
                txt_IteamTypeName.Text,
                txt_Description.Text
            };
            try
            {
                if (xl.updateDataStored("updateItemType", pars, vals) > 0)
                {
                    Response.Write("<Script>alert('Update sucess')</Script>");
                    loadGridView_ItemType();
                }
            }
            catch (SqlException)
            {
                Response.Write("<Script>alert('Update failed')</Script>");
            }

        }

        protected void btn_Reset_Click(object sender, EventArgs e)
        {
            txt_IDItemType.Text = "";
            txt_IteamTypeName.Text = "";
            txt_Description.Text = "";
        }
    }
}