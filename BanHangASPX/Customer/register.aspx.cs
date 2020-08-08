using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
namespace BanHangASPX.Customer
{
    public partial class register : System.Web.UI.Page
    {
        XuLyDuLieu xl = new XuLyDuLieu();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btn_Register_Click(object sender, EventArgs e)
        {
            string[] pars = new string[] {
                "@FNAME_CUSTOMER",
                "@LNAME_CUSTOMER",
                "@USER_NAME",
                "@PASSWORD",
                "@DATEOFBIRTH",
                "@EMAIL",
                "@ADDRESS",
                "@PHONENUMBER",
                "@IMG"
                };
            string[] vals = new string[] {
                txt_FirstName.Text,
                txt_LastName.Text,
                txt_UserName.Text,
                MD5Class.MD5Hash(txt_Password.Text),
                "",
                txt_Email.Text,
                txt_Address.Text,
                txt_PhoneNumber.Text,
                ""
            };

            try
            {
                if (xl.updateDataStored("insertCustomerr", pars, vals) > 0 && string.Compare(txt_Password.Text, txt_ConfirmPassword.Text) == 0)
                {
                    lbl_Susses.Text = "Register success";
                    lbl_Susses.ForeColor = System.Drawing.Color.Green;
                }
            }
            catch (SqlException)
            {
                lbl_Susses.Text = "Register faile";
                lbl_Susses.ForeColor = System.Drawing.Color.Red;
            }
        }

    }
}