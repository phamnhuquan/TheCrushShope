using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanHangASPX.Admin
{
    public partial class dashboard : System.Web.UI.Page
    {

        XuLyDuLieu xl = new XuLyDuLieu();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadGridView_Dashboard();
                loadGridView_Dashboard2();
            }
        }

        private void loadGridView_Dashboard()
        {
            GridView_Dashboard.DataSource = xl.readDataStored("billInDay", null, null);
            GridView_Dashboard.DataBind();
        }

        protected void GridView_Dashboard_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView_Dashboard.PageIndex = e.NewPageIndex;
            loadGridView_Dashboard();
        }
        private void loadGridView_Dashboard2()
        {
            GridView_Dashboard2.DataSource = xl.readDataStored("statisticsProductSold", null, null);
            GridView_Dashboard2.DataBind();
        }

        protected void GridView_Dashboard_PageIndexChanging2(object sender, GridViewPageEventArgs e)
        {
            GridView_Dashboard2.PageIndex = e.NewPageIndex;
            loadGridView_Dashboard2();
        }
    }
} 