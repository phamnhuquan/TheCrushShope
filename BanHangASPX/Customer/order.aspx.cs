using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BanHangASPX.Customer
{
    public partial class order : System.Web.UI.Page
    {
        XuLyDuLieu xl = new XuLyDuLieu();
        protected void Page_Load(object sender, EventArgs e)
        {

            loadCart();
            if (Session["CUSTOMERLOGIN"] != null)
            {
                lbl_NameCustomer.Text = Session["FULLNAME"].ToString();
                lbl_AddressCustomer.Text = Session["ADDRESS"].ToString();
                lbl_NumberPhone.Text = Session["PHONENUMBER"].ToString();
            }
        }
        private void loadCart()
        {
            if (Session["CART"] != null)
            {
                repeater_Order.DataSource = (DataTable)Session["CART"];
                repeater_Order.DataBind();
                DataTable dt = (DataTable)Session["CART"];
                lbl_TotalAmount.Text = "$" + dt.Rows[0]["SUM_AMOUNT"].ToString();
            }
            else
            {
                Response.Redirect("./home.aspx");
            }
        }

        protected void btn_Order_Click(object sender, EventArgs e)
        {
            string[] pars = new string[] {
            "@ID_CUSTOMER",
            };
            string[] vals = new string[] {
             Session["ID_CUSTOMER"].ToString()
            };

            string id = xl.readOnlyStore("insertBill", pars, vals);
            Response.Write(id);
            if (Session["CART"] != null)
            {
                DataTable dt = (DataTable)Session["CART"];
                foreach (DataRow dr in dt.Rows)
                {
                    string[] pars1 = new string[] {
                    "@ID_BILL",
                    "@ID_PRODUCT",
                    "@QUANTITY_PRODUCT",
                    "@PRICE",
                    "@AMOUNT"
                };
                    string[] vals1 = new string[] {
                    id,
                    dr["ID_PRODUCT"].ToString(),
                    dr["QUANTITY_PRODUCT"].ToString(),
                    dr["PRICE_OUT"].ToString(),
                    dr["AMOUNT"].ToString(),
                };
                    xl.readOnlyStore("insertBillDetail", pars1, vals1);

                    string[] pars2 = new string[] {
                    "@ID_PRODUCT",
                    "@QUANTITY_PRODUCT"
                };
                    string[] vals2 = new string[] {
                    dr["ID_PRODUCT"].ToString(),
                    dr["QUANTITY_PRODUCT"].ToString()
                };
                    xl.readOnlyStore("updateProductQuantity", pars2, vals2);
                }
                Response.Write("<script>alert('Purchase successful');</script>");
                Session["CART"] = null;
            }
        }
    }
}