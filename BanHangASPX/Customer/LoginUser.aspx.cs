using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace BanHangASPX
{
    public partial class LoginUser : System.Web.UI.Page
    {
        XuLyDuLieu xl = new XuLyDuLieu();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void btn_login_Click(object sender, EventArgs e)
        {
            string[] vals = new string[] { txt_Username.Text, MD5Class.MD5Hash(txt_Password.Text)};
            string[] pars = new string[] { "@USER_NAME", "@PASSWORD" };
            string[] vals1 = new string[] { txt_Username.Text};
            string[] pars1 = new string[] { "@USER_NAME"};
            DataTable dt = xl.readDataStored("login_User", pars, vals);
            DataTable dt1 = xl.readDataStored("selectInfoCustomer", pars1, vals1);
            if (dt.Rows.Count == 1)
            {           
                Session["ID_CUSTOMER"] = dt1.Rows[0]["ID_CUSTOMER"].ToString();
                Session["FULLNAME"] = dt1.Rows[0]["FNAME_CUSTOMER"].ToString() +" "+ dt1.Rows[0]["LNAME_CUSTOMER"].ToString();
                Session["EMAIL"] = dt1.Rows[0]["EMAIL"].ToString();
                Session["ADDRESS"] = dt1.Rows[0]["ADDRESS"].ToString();
                Session["PHONENUMBER"] = dt1.Rows[0]["PHONENUMBER"].ToString();
                Session["CUSTOMERLOGIN"] = txt_Username.Text;
                if (cb_RememberMe.Checked)
                {
                    HttpCookie ck = new HttpCookie("login");
                    ck.Value = Session["CUSTOMERLOGIN"].ToString();
                    ck.Expires = DateTime.Today.AddDays(30);
                    Response.Cookies.Add(ck);
                }
                Response.Redirect("./home.aspx");

            }
            else
            {
                lbl_Wrong.Text = "Wrong username or password!";
            }
            
        }
    }
}