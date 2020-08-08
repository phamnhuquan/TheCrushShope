using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanHangASPX.Customer
{
    public partial class home : System.Web.UI.Page
    {
        XuLyDuLieu xl = new XuLyDuLieu();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadRepeater_ProductNewAndSale();
            }
        }
        private void loadRepeater_ProductNewAndSale()
        {
            repeater_Product.DataSource = xl.readDataStored("selectProductAll", null, null);
            repeater_Product.DataBind();
            repeater_ProductSale.DataSource = xl.readDataStored("selectProductSale", null, null);
            repeater_ProductSale.DataBind();
            repeater_forMen.DataSource = xl.readDataStored("selectProductForMen", null, null);
            repeater_forMen.DataBind();
            repeater_forWoman.DataSource = xl.readDataStored("selectProductForWoman", null, null);
            repeater_forWoman.DataBind();
        }
    }
}