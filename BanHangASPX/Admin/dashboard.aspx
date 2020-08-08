<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPageAdmin.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="BanHangASPX.Admin.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <style>
        table>tbody>tr>th{
            border: none;
            border-top:none;
            border-color: rgba(255, 255, 255, 0.1);
            border-bottom: 0.0625rem solid #e3e3e3;
            color:white;
        }
        table>tbody>tr>td{
            border: none;
            border-top: none;
            border-color: rgba(255, 255, 255, 0.1);
            border-bottom: 0.0625rem solid #e3e3e3;
        }
        table {
            margin: 10px;
        }
    </style>
    <div class="row">
        <div class="col-lg-12 col-md-12">
            <div class="card ">
                <div class="card-header">
                    <h4 class="card-title">Statistics of ordered invoices</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <asp:GridView BorderStyle="None" class="table tablesorter" ID="GridView_Dashboard" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView_Dashboard_PageIndexChanging" PageSize="7">
                            <Columns>
                                <asp:BoundField DataField="IDBILL" HeaderText="Bill ID" ></asp:BoundField> 
                                <asp:BoundField DataField="NAME_PRODUCT" HeaderText="Product name"></asp:BoundField>
                                <asp:BoundField DataField="QUNTITYPRODUCT" HeaderText="Quantity"></asp:BoundField>
                                <asp:BoundField DataField="PRICE" HeaderText="Unit price($)"></asp:BoundField>
                                <asp:BoundField DataField="AMOUNT" HeaderText="Into money($)"></asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 col-md-12">
            <div class="card ">
                <div class="card-header">
                    <h4 class="card-title">Statistics of the number of products sold</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <asp:GridView BorderStyle="None" class="table tablesorter" ID="GridView_Dashboard2" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView_Dashboard_PageIndexChanging2" PageSize="7">
                            <Columns>
                                <asp:BoundField DataField="NAME_PRODUCT" HeaderText="Product Name" ></asp:BoundField> 
                                <asp:BoundField DataField="QUANTITY" HeaderText="Total quantity"></asp:BoundField>
                                <asp:BoundField DataField="PRICE_OUT" HeaderText="Unit price($)"></asp:BoundField>
                                <asp:BoundField DataField="INTOMONEY" HeaderText="Into money($)"></asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

