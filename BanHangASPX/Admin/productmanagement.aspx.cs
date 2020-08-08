using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace BanHangASPX.Admin
{
    public partial class productmanagement : System.Web.UI.Page
    {
        XuLyDuLieu xl = new XuLyDuLieu();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadGridView_Dashboard();
                loadDropListAll();
            }
        }

        private void loadGridView_Dashboard()
        {
            gridView_Product.DataSource = xl.readDataStored("selectProductManagement", null, null);
            gridView_Product.DataBind();
        }
        private void loadDropListAll()
        {
            dropList_ItemType.DataSource = xl.readDataStored("selectItemTypeAll", null, null);
            dropList_ItemType.Items.Insert(0, "---Select item type---");
            dropList_ItemType.SelectedIndex = 0;
            dropList_ItemType.DataBind();

            dropList_Producer.DataSource = xl.readDataStored("selectProducerAll", null, null);
            dropList_Producer.Items.Insert(0, "---Select producer---");
            dropList_Producer.DataBind();

            dropList_Supplier.DataSource = xl.readDataStored("selectSupplierAll", null, null);
            dropList_Supplier.Items.Insert(0, "---Select supplier---");
            dropList_Supplier.DataBind();

            dropList_CountryManufacture.DataSource = xl.readDataStored("selectNationAll", null, null);
            dropList_CountryManufacture.Items.Insert(0, "---Select country manufacture---");
            dropList_CountryManufacture.DataBind();

            dropList_CountrySale.DataSource = xl.readDataStored("selectNationAll", null, null);
            dropList_CountrySale.Items.Insert(0, "---Select country sale---");
            dropList_CountrySale.DataBind();

            dropList_Object.DataSource = xl.readDataStored("selectObjectAll", null, null);
            dropList_Object.Items.Insert(0, "---Select object---");
            dropList_Object.DataBind();

            dropList_Size.DataSource = xl.readDataStored("selectSizeAll", null, null);
            dropList_Size.Items.Insert(0, "---Select size---");
            dropList_Size.DataBind();

            dropList_Sale.DataSource = xl.readDataStored("selectSaleAll", null, null);
            dropList_Sale.Items.Insert(0, "---Select sale---");
            dropList_Sale.DataBind();

            dropList_Unit.DataSource = xl.readDataStored("selectUnitAll", null, null);
            dropList_Unit.Items.Insert(0, "---Select unit---");
            dropList_Unit.DataBind();
        }

        protected void btn_Select_Click(object sender, EventArgs e)
        {
            LinkButton linkbtn = (LinkButton)sender;
            string[] vals = new string[] { linkbtn.CommandName };
            string[] pars = new string[] { "@ID_PRODUCT" };
            DataTable dt = xl.readDataStored("selectProductById", pars, vals);
            if (dt.Rows.Count == 1)
            {
                txt_IDProduct.Text = dt.Rows[0]["ID_PRODUCT"] + "";
                txt_NameProduct.Text = dt.Rows[0]["NAME_PRODUCT"] + "";
                dropList_ItemType.SelectedValue = dt.Rows[0]["ID_ITEM_TYPE"] + "";
                dropList_Producer.SelectedValue = dt.Rows[0]["ID_PRODUCER"] + "";
                dropList_Supplier.SelectedValue = dt.Rows[0]["ID_SUPPLIER"] + "";
                dropList_CountryManufacture.SelectedValue = dt.Rows[0]["ID_NATION_MANUFAC"] + "";
                dropList_CountrySale.SelectedValue = dt.Rows[0]["ID_NATION_SELL"] + "";
                dropList_Object.SelectedValue = dt.Rows[0]["ID_OBJECT"] + "";
                dropList_Size.SelectedValue = dt.Rows[0]["ID_SIZE"] + "";
                fileUpload_ImgProduct.ID = dt.Rows[0]["IMG"] + "";
                dropList_Sale.SelectedValue = dt.Rows[0]["ID_SALE"] + "";
                txt_description.Text = dt.Rows[0]["DESCRIPTION"] + "";
                dropList_Unit.SelectedValue = dt.Rows[0]["ID_UNIT"] + "";
                txt_QuantityProduct.Text = dt.Rows[0]["QUANTITY_PRODUCT"] + "";
                txt_PriceGet.Text = dt.Rows[0]["PRICE_GET"] + "";
                txt_PriceOut.Text = dt.Rows[0]["PRICE_OUT"] + "";
                txt_PriceOld.Text = dt.Rows[0]["PRICE_OLD"] + "";
            }
        }
        protected void btn_Delete_Click(object sender, EventArgs e)
        {
            LinkButton linlbtn = (LinkButton)sender;
            string[] vals = new string[] { linlbtn.CommandName };
            string[] pars = new string[] { "@ID_PRODUCT" };

            try
            {
                if (xl.updateDataStored("deleteProduct", pars, vals) > 0)
                {
                    Response.Write("<Script>alert('Delete sucess')</Script>");
                    loadGridView_Dashboard();
                }
            }
            catch (SqlException)
            {
                Response.Write("<Script>alert('Delete failed')</Script>");
            }
        }

        protected void btn_InserProduct_Click(object sender, EventArgs e)
        {
            string fileName = Guid.NewGuid() + System.IO.Path.GetExtension(fileUpload_ImgProduct.FileName);
            fileUpload_ImgProduct.SaveAs(Server.MapPath("../Customer/img/product/sale/") + fileName);

            string[] pars = new string[] {
                "@ID_PRODUCT",
                "@NAME_PRODUCT",
                "@ID_ITEM_TYPE",
                "@ID_PRODUCER",
                "@ID_SUPPLIER",
                "@ID_NATION_MANUFAC",
                "@ID_NATION_SELL",
                "@ID_OBJECT",
                "@ID_SIZE",
                "@IMG",
                "@ID_SALE",
                "@DESCRIPTION",
                "@ID_UNIT",
                "@QUANTITY_PRODUCT",
                "@PRICE_GET",
                "@PRICE_OUT",
                "@PRICE_OLD"};
            string[] vals = new string[] {
                txt_IDProduct.Text,
                txt_NameProduct.Text,
                dropList_ItemType.SelectedValue,
                dropList_Producer.SelectedValue,
                dropList_Supplier.SelectedValue,
                dropList_CountryManufacture.SelectedValue,
                dropList_CountrySale.SelectedValue,
                dropList_Object.SelectedValue,
                dropList_Size.SelectedValue,
                fileName,
                dropList_Sale.SelectedValue,
                txt_description.Text,
                dropList_Unit.SelectedValue,
                txt_QuantityProduct.Text,
                txt_PriceGet.Text,
                txt_PriceOut.Text,
                txt_PriceOld.Text
            };
            try
            {
                if (xl.updateDataStored("insertProduct", pars, vals) > 0)
                {
                    Response.Write("<Script>alert('Insert sucess')</Script>");
                    loadGridView_Dashboard();
                }
            }
            catch (SqlException)
            {
                Response.Write("<Script>alert('Insert failed')</Script>");
            }
        }

        protected void btn_UpdateProduct_Click(object sender, EventArgs e)
        {
            string fileName = Guid.NewGuid() + System.IO.Path.GetExtension(fileUpload_ImgProduct.FileName);
            fileUpload_ImgProduct.SaveAs(Server.MapPath("../Customer/img/product/sale/") + fileName);

            string[] pars = new string[] {
                "@ID_PRODUCT",
                "@NAME_PRODUCT",
                "@ID_ITEM_TYPE",
                "@ID_PRODUCER",
                "@ID_SUPPLIER",
                "@ID_NATION_MANUFAC",
                "@ID_NATION_SELL",
                "@ID_OBJECT",
                "@ID_SIZE",
                "@IMG",
                "@ID_SALE",
                "@DESCRIPTION",
                "@ID_UNIT",
                "@QUANTITY_PRODUCT",
                "@PRICE_GET",
                "@PRICE_OUT",
                "@PRICE_OLD"};
            string[] vals = new string[] {
                txt_IDProduct.Text,
                txt_NameProduct.Text,
                dropList_ItemType.SelectedValue,
                dropList_Producer.SelectedValue,
                dropList_Supplier.SelectedValue,
                dropList_CountryManufacture.SelectedValue,
                dropList_CountrySale.SelectedValue,
                dropList_Object.SelectedValue,
                dropList_Size.SelectedValue,
                fileName,
                dropList_Sale.SelectedValue,
                txt_description.Text,
                dropList_Unit.SelectedValue,
                txt_QuantityProduct.Text,
                txt_PriceGet.Text,
                txt_PriceOut.Text,
                txt_PriceOld.Text
            };
            try
            {
                if (xl.updateDataStored("updateProduct", pars, vals) > 0)
                {
                    Response.Write("<Script>alert('Update sucess')</Script>");
                    loadGridView_Dashboard();
                }
            }
            catch (SqlException)
            {
                Response.Write("<Script>alert('Update failed')</Script>");
            }

        }

        protected void btn_Reset_Click(object sender, EventArgs e)
        {
            txt_IDProduct.Text = "";
            txt_NameProduct.Text = "";
            dropList_ItemType.SelectedIndex = 0;
            dropList_Producer.SelectedIndex = 0;
            dropList_Supplier.SelectedIndex = 0;
            dropList_CountryManufacture.SelectedIndex = 0;
            dropList_CountrySale.SelectedIndex = 0;
            dropList_Object.SelectedIndex = 0;
            dropList_Size.SelectedIndex = 0;
            fileUpload_ImgProduct.ID = null;
            dropList_Sale.SelectedIndex = 0;
            txt_description.Text = "";
            dropList_Unit.SelectedIndex = 0;
            txt_QuantityProduct.Text = "";
            txt_PriceGet.Text = "";
            txt_PriceOut.Text = "";
            txt_PriceOld.Text = "";
        }
    }
}