using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace BanHangASPX
{
    public partial class LoginAdmin : System.Web.UI.Page
    {
        XuLyDuLieu xl = new XuLyDuLieu();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void btn_login_Click(object sender, EventArgs e)
        {
            string[] vals = new string[] { txt_Username.Text, txt_Password.Text };
            string[] pars = new string[] { "@USER_NAME_AD", "@PASSWORD_AD" };
            DataTable dt = xl.readDataStored("login_Admin", pars, vals);
            if (dt.Rows.Count == 1)
            {
                Session["USERNAMEADMIN"] = txt_Username.Text;
                Response.Redirect("./dashboard.aspx");
            }
            else
            {
                lbl_Wrong.Text = "Wrong username or password!";
            }
        }
    }
}