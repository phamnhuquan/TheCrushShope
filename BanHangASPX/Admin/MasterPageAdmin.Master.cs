using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanHangASPX.Admin
{
    public partial class MasterPageAdmin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USERNAMEADMIN"] != null)
            {
                lbl_NameAdmin.Text = Session["USERNAMEADMIN"].ToString();
            }
            else
            {
                Response.Redirect("./LoginAdmin.aspx");
            }
        }
        protected void lbtn_Logout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("./LoginAdmin.aspx");
        }
    }
}