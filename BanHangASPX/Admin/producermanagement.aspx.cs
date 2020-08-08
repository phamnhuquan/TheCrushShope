using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace BanHangASPX.Admin
{
    public partial class producermanagement : System.Web.UI.Page
    {
        XuLyDuLieu xl = new XuLyDuLieu();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadGridView_Producer();
            }
        }

        private void loadGridView_Producer()
        {
            gridView_Producer.DataSource = xl.readDataStored("selectProducerManagement", null, null);
            gridView_Producer.DataBind();
        }


        protected void btn_Select_Click(object sender, EventArgs e)
        {

            LinkButton linkbtn = (LinkButton)sender;
            string[] vals = new string[] { linkbtn.CommandName };
            string[] pars = new string[] { "@ID_PRODUCER" };
            DataTable dt = xl.readDataStored("selectProducerById", pars, vals);
            if (dt.Rows.Count == 1)
            {
                txt_IDProducer.Text = dt.Rows[0]["ID_PRODUCER"] + "";
                txt_ProducerName.Text = dt.Rows[0]["NAME_PRODUCER"] + "";
                fileUpload_ImgProducer.ID = dt.Rows[0]["IMG"] + "";
                txt_Description.Text = dt.Rows[0]["DESCRIPTION"] + "";
            }
        }
        protected void btn_Delete_Click(object sender, EventArgs e)
        {
            LinkButton linlbtn = (LinkButton)sender;
            string[] vals = new string[] { linlbtn.CommandName };
            string[] pars = new string[] { "@ID_PRODUCER" };

            try
            {
                if (xl.updateDataStored("deleteProducer", pars, vals) > 0)
                {
                    Response.Write("<Script>alert('Delete sucess')</Script>");
                    loadGridView_Producer();
                }
            }
            catch (SqlException)
            {
                Response.Write("<Script>alert('Delete failed')</Script>");
            }
        }

        protected void btn_InserProduct_Click(object sender, EventArgs e)
        {
            string fileName = Guid.NewGuid() + System.IO.Path.GetExtension(fileUpload_ImgProducer.FileName);
            fileUpload_ImgProducer.SaveAs(Server.MapPath("img/producer/") + fileName);

            string[] pars = new string[] {
                "@NAME_PRODUCER",
                "@IMG",
                "@DESCRIPTION"};
            string[] vals = new string[] {
                txt_ProducerName.Text,
                fileName,
                txt_Description.Text
            };
            try
            {
                if (xl.updateDataStored("insertProducer", pars, vals) > 0)
                {
                    Response.Write("<Script>alert('Insert sucess')</Script>");
                    loadGridView_Producer();
                }
            }
            catch (SqlException)
            {
                Response.Write("<Script>alert('Insert failed')</Script>");
            }
        }

        protected void btn_UpdateProduct_Click(object sender, EventArgs e)
        {

            string fileName = Guid.NewGuid() + System.IO.Path.GetExtension(fileUpload_ImgProducer.FileName);
            fileUpload_ImgProducer.SaveAs(Server.MapPath("img/producer/") + fileName);
            string[] pars = new string[] {
                "@ID_PRODUCER",
                "@NAME_PRODUCER",
                "@IMG",
                "@DESCRIPTION"};
            string[] vals = new string[] {
                txt_IDProducer.Text,
                txt_ProducerName.Text,
                fileName,
                txt_Description.Text
            };
            try
            {
                if (xl.updateDataStored("updateProducer", pars, vals) > 0)
                {
                    Response.Write("<Script>alert('Update sucess')</Script>");
                    loadGridView_Producer();
                }
            }
            catch (SqlException)
            {
                Response.Write("<Script>alert('Update failed')</Script>");
            }

        }

        protected void btn_Reset_Click(object sender, EventArgs e)
        {
            txt_IDProducer.Text = "";
            txt_ProducerName.Text = "";
            txt_Description.Text = "";
        }

    }
}