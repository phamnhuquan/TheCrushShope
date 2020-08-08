<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.Master" AutoEventWireup="true" CodeBehind="productmanagement.aspx.cs" Inherits="BanHangASPX.Admin.productmanagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <style>
        table > tbody > tr > th {
            border: none;
            border-top: none;
            border-color: rgba(255, 255, 255, 0.1);
            border-bottom: 0.0625rem solid #e3e3e3;
            color: white;
        }
        table {
            margin: 10px;
        }
        table > tbody > tr > td {
            max-width: 200px;
            border: none;
            border-top: none;
            border-color: rgba(255, 255, 255, 0.1);
            border-bottom: 0.0625rem solid #e3e3e3;
        }
        .form-group input[type=file],custom-file-input{
            opacity: unset;
        }
        .form-group input[type=file]{
            margin-top:5px;
            margin-left:3px;
        }
        table img{
            height:120px;
        }
        .form-group select option{
            color: black;
        }
    </style>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h5 class="title">Enter the product</h5>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-3 pr-md-1">
                            <div class="form-group">
                                <label>Product ID</label>
                                <asp:TextBox ID="txt_IDProduct" runat="server" type="text" class="form-control" placeholder="Product ID"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4 px-md-1">
                            <div class="form-group">
                                <label>Product Name</label>
                                <asp:TextBox ID="txt_NameProduct" runat="server" type="text" class="form-control" placeholder="Product Name"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-5 pl-md-1">
                            <div class="form-group">
                                <label for="dropList_ItemType">Item Type</label>
                                <asp:DropDownList ID="dropList_ItemType" runat="server" class="form-control" DataTextField="NAME_ITEM_TYPE" DataValueField="ID_ITEM_TYPE"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 pr-md-1">
                            <div class="form-group">
                                <label for="dropList_Producer">Producer</label>
                                <asp:DropDownList ID="dropList_Producer" runat="server" class="form-control" DataTextField="NAME_PRODUCER" DataValueField="ID_PRODUCER"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-4 pl-md-1">
                            <div class="form-group">
                                <label>Supplier</label>
                                <asp:DropDownList ID="dropList_Supplier" runat="server" class="form-control" DataTextField="NAME_SUPPLIER" DataValueField="ID_SUPPLIER"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-4 pl-md-1">
                            <div class="form-group">
                                <label>Object</label>
                                <asp:DropDownList ID="dropList_Object" runat="server" class="form-control" DataTextField="NAME_OBJECT" DataValueField="ID_OBJECT"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Country of manufacture</label>
                                <asp:DropDownList ID="dropList_CountryManufacture" runat="server" class="form-control" DataTextField="NAME_NATION" DataValueField="ID_NATION" ></asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Country of sale</label>
                                <asp:DropDownList ID="dropList_CountrySale" runat="server" class="form-control" DataTextField="NAME_NATION" DataValueField="ID_NATION"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Size</label>
                                <asp:DropDownList ID="dropList_Size" runat="server" class="form-control" DataTextField="NAME_SIZE" DataValueField="ID_SIZE"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Unit</label>
                                <asp:DropDownList ID="dropList_Unit" runat="server" class="form-control" DataTextField="NAME_UNIT" DataValueField="ID_UNIT"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Sale</label>
                                <asp:DropDownList ID="dropList_Sale" runat="server" class="form-control" DataTextField="NAME_SALE" DataValueField="ID_SALE"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Product quantity</label>
                                <asp:TextBox ID="txt_QuantityProduct" runat="server" type="text" class="form-control" placeholder="Quantity Product"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Purchase price</label>
                                <asp:TextBox ID="txt_PriceGet" runat="server" type="text" class="form-control" placeholder="Purchase price*"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Sale price</label>
                                <asp:TextBox ID="txt_PriceOut" runat="server" type="text" class="form-control" placeholder="Sale price*"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Old price</label>
                                <asp:TextBox ID="txt_PriceOld" runat="server" type="text" class="form-control" placeholder="Old price"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Upload image</label>
                                <div class="custom-file">
                                    <asp:FileUpload ID="fileUpload_ImgProduct" runat="server" class="custom-file-input"/>
                                    <asp:Label ID="lbl_Upload" runat="server" class="custom-file-label" for="fileUpload_ImgProduct" Text=""></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-9">
                            <div class="form-group">
                                <label>Description</label>
                                <asp:TextBox Rows="4" cols="80" ID="txt_description" runat="server" type="text" class="form-control" placeholder="Here can be your description" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <asp:Button ID="btn_InserProduct" runat="server" Text="Add" class="btn btn-fill btn-primary" Style="margin-right: 20px" OnClick="btn_InserProduct_Click" />
                    <asp:Button ID="btn_UpdateProduct" runat="server" Text="Update" class="btn btn-fill btn-primary" Style="margin-right: 20px" OnClick="btn_UpdateProduct_Click" />
                    <asp:Button ID="btn_Reset" runat="server" Text="Reset" class="btn btn-fill btn-primary" OnClick="btn_Reset_Click" />
                </div>
                <div class="table-responsive">
                    <asp:GridView BorderStyle="None" class="table tablesorter" ID="gridView_Product" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:TemplateField HeaderText="Select">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btn_Select" runat="server" Text="" OnClick="btn_Select_Click" CommandName='<%#Eval("ID_PRODUCT")%>'><i class="tim-icons icon-pencil"></i></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="NAME_PRODUCT" HeaderText="Product Name"></asp:BoundField>
                            <asp:BoundField DataField="NAME_ITEM_TYPE" HeaderText="Item type"></asp:BoundField>
                            <asp:ImageField DataImageUrlField="IMG" DataImageUrlFormatString ="../Customer/img/product/sale/{0}" HeaderText="Image">
                            </asp:ImageField>
                            <asp:BoundField DataField="DESCRIPTION" HeaderText="Description"></asp:BoundField>
                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btn_Delete" runat="server" Text="" OnClick="btn_Delete_Click" CommandName='<%#Eval("ID_PRODUCT")%>'><i class="tim-icons icon-trash-simple"></i></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
