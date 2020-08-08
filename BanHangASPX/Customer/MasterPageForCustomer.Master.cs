using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BanHangASPX.Customer
{
    public partial class MasterPageForCustomer : System.Web.UI.MasterPage
    {
        //XuLyDuLieu xl = new XuLyDuLieu();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CART"] != null)
            {
                repeater_CartMasterPage.DataSource = (DataTable)Session["CART"];
                repeater_CartMasterPage.DataBind();
                DataTable dt = (DataTable)Session["CART"];
                lbl_countIdProduct.Text = dt.Rows[0]["COUNT_ID_PRODUCT"].ToString();
                lbl_TotalAmount.Text ="$ "+ dt.Rows[0]["SUM_AMOUNT"].ToString();
            }
            else
            {
                lbl_TotalAmount.Text = "$0.00";
            }
            if (Session["CUSTOMERLOGIN"] != null)
            {
                lbl_CustomerName.Text = Session["CUSTOMERLOGIN"].ToString();
            }
        }
        protected void btn_Logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.RemoveAll();
            if (Request.Cookies["login"] != null)
            {
                Response.Cookies["login"].Expires = DateTime.Now;
            }
            Response.Redirect("LoginUser.aspx");
        }
    }
}