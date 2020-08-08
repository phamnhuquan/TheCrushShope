using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanHangASPX.Customer
{
    public partial class productdetail : System.Web.UI.Page
    {
        XuLyDuLieu xl = new XuLyDuLieu();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] == null)
                    Response.Redirect("home.aspx");
                loadRepeater();
            }
        }

        private void loadRepeater()
        {
            string[] pars = new string[]
            {
                "@ID_PRODUCT"
            };
            string[] vals = new string[] {
                Request.QueryString["id"]
            };
            repeater_ProductDetail.DataSource = xl.readDataStored("selectProductById", pars, vals);
            repeater_ProductDetail.DataBind();
        }
        private void addNewProduct(DataTable gh, string id)
        {
            DataRow dr = gh.NewRow();
            string[] pars = new string[]{
                "@ID_PRODUCT"
            };
            string[] vals = new string[]{
                id
            };
            TextBox txt_Quantity = Page.FindControl("ctl00$contentProduct$repeater_ProductDetail$ctl00$txt_Quantity") as TextBox;
            DataTable dataTemp = xl.readDataStored("selectProductById", pars, vals);
            //tạo bảng lấy số lượng mặt hàng trong giỏ
            //DataTable dataQuantityCart = xl.readDataStored("selectCountIdProduct", pars, vals);
            //lấy số lượng customer nhập
            int quantity;
            if (txt_Quantity.Text != null)
                quantity = int.Parse(txt_Quantity.Text);
            else
                quantity = 1;
            dr["ID_PRODUCT"] = id;
            dr["NAME_PRODUCT"] = dataTemp.Rows[0]["NAME_PRODUCT"];
            dr["QUANTITY_PRODUCT"] = quantity;
            dr["PRICE_OUT"] = dataTemp.Rows[0]["PRICE_OUT"];
            dr["DESCRIPTION"] = dataTemp.Rows[0]["DESCRIPTION"];
            dr["IMG"] = dataTemp.Rows[0]["IMG"];
            dr["NAME_SIZE"] = dataTemp.Rows[0]["NAME_SIZE"];
            gh.Rows.Add(dr);
        }

        private DataTable createCart()
        {
            DataTable gh = new DataTable();
            gh.Columns.Add("ID_PRODUCT", typeof(string));
            gh.Columns.Add("COUNT_ID_PRODUCT", typeof(int), "COUNT(ID_PRODUCT)");
            gh.Columns.Add("NAME_PRODUCT", typeof(string));
            gh.Columns.Add("IMG", typeof(string));
            gh.Columns.Add("QUANTITY_PRODUCT", typeof(int));
            gh.Columns.Add("PRICE_OUT", typeof(float));
            gh.Columns.Add("DESCRIPTION", typeof(string));
            gh.Columns.Add("NAME_SIZE", typeof(string));
            gh.Columns.Add("AMOUNT", typeof(float), "QUANTITY_PRODUCT*PRICE_OUT");
            gh.Columns.Add("SUM_AMOUNT", typeof(float), "SUM(AMOUNT)");
            return gh;
        }

        protected void repeater_ProductDetail_ItemCreated(object sender, RepeaterItemEventArgs e)
        {

        }

        protected void repeater_ProductDetail_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "addToCartClick")
            {
                string id = Request.QueryString["id"];
                DataTable cart;
                if (Session["CART"] == null)
                {
                    cart = createCart();
                }
                else
                {
                    cart = (DataTable)Session["CART"];
                }
                bool hasCart = false;
                //lấy số lượng trong kho
                Label lbl_inStock = (e.Item.FindControl("lbl_inStock") as Label);

                //lấy số lượng nhập vào
                TextBox txt_Quantity = (e.Item.FindControl("txt_Quantity") as TextBox);

                int inStock = int.Parse(lbl_inStock.Text);
                int quantity = int.Parse(txt_Quantity.Text);

                //nếu mua quá số lượng trong kho hoặc mua với sl 0 thì không mua đc
                if (quantity > inStock || quantity == 0)
                { 
                    //break;
                }
                else
                {
                    foreach (DataRow dr in cart.Rows)
                    {
                        if (dr["ID_PRODUCT"].ToString() == id)
                        {
                            dr["QUANTITY_PRODUCT"] = int.Parse(dr["QUANTITY_PRODUCT"].ToString()) + quantity;
                            hasCart = true;
                            break;
                        }
                    }
                }
                if (!hasCart)
                {
                    addNewProduct(cart, id);
                }
                Session["CART"] = cart;
                Repeater rpt_cart = Master.FindControl("repeater_CartMasterPage") as Repeater;
                rpt_cart.DataSource = Session["Cart"];
                rpt_cart.DataBind();
            }
        }
    }
}