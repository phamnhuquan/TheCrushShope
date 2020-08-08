using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace BanHangASPX.Customer
{
    public partial class cart : System.Web.UI.Page
    {
        XuLyDuLieu xl = new XuLyDuLieu();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["CART"] != null)
                {
                    repeater_Cart.DataSource = (DataTable)Session["CART"];
                    repeater_Cart.DataBind();
                    DataTable dt = (DataTable)Session["CART"];
                    lbl_TotalAmount.Text = "$" + dt.Rows[0]["SUM_AMOUNT"].ToString();                   
                }
                else
                {
                    lbl_TotalAmount.Text = "$0.00";
                }
            }
            
        }
        protected void btn_ProceedToCheckout_Click(object sender, EventArgs e)
        {
            if (Session["CUSTOMERLOGIN"] != null)
            {
                Response.Redirect("./order.aspx");
            }
            else
            {
                Response.Redirect("./LoginUser.aspx");
            }
        }
        protected void linkbtn_Remove_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "linkbtn_Remove")
            {
                //e.CommandArgument --> contain the erid value
                //Do something
                string id = e.CommandArgument.ToString();
                Response.Write(id);
                DataTable cart = Session["CART"] as DataTable;
                foreach (DataRow dr in cart.Rows)
                {
                    if (dr["ID_PRODUCT"].ToString() == id)
                    {
                        dr.Delete();
                        break;
                    }
                }
                Session["CART"] = cart;
                repeater_Cart.DataSource = cart;
                repeater_Cart.DataBind();
            }
        }
        //protected void repeater_Cart_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    if (e.CommandName == "linkbtn_Remove")
        //    {
        //        RepeaterItem item = (source as LinkButton).Parent as RepeaterItem;
        //        HiddenField hdnId = item.FindControl("hdnId_product") as HiddenField;
        //        string id = hdnId.Value.ToString();// incase  your id  is  string  
        //        Response.Write(id);
        //        DataTable cart = Session["CART"] as DataTable;
        //        foreach (DataRow dr in cart.Rows)
        //        {
        //            if (dr["ID_PRODUCT"].ToString() == id)
        //            {
        //                dr.Delete();
        //                break;
        //            }
        //        }
        //        Session["CART"] = cart;
        //        repeater_Cart.DataSource = cart;
        //        repeater_Cart.DataBind();
        //    }
        //}
        //protected void btn_removeCartClick(object sender, EventArgs e)
        //{
        //    //string id = Request.QueryString["id"];
        //    RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
        //    HiddenField hdnId = item.FindControl("hdnId_product") as HiddenField;
        //    string id = hdnId.Value.ToString();// incase  your id  is  string  
        //    DataTable cart = Session["CART"] as DataTable;
        //    foreach (DataRow dr in cart.Rows)
        //    {
        //        if (dr["ID_PRODUCT"].ToString() == id)
        //        {
        //            dr.Delete();
        //            break;
        //        }
        //    }
        //    Session["CART"] = cart;
        //    repeater_Cart.DataSource = cart;
        //    repeater_Cart.DataBind();
        //}


    }
}