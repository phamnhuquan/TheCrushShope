<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/MasterPageForCustomer.Master" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="BanHangASPX.Customer.order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentProduct" runat="server">
    <%--<form id="form1" runat="server">--%>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <!-- BSTORE-BREADCRUMB START -->
                <div class="bstore-breadcrumb">
                    <a href="home.aspx">HOME</a>
                    <span><i class="fa fa-caret-right"></i></span>
                    <span>Your shopping cart</span>
                    <span><i class="fa fa-caret-right"></i></span>
                    <span>Process to checkout</span>
                </div>
                <!-- BSTORE-BREADCRUMB END -->
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <!-- SHOPPING-CART SUMMARY START -->
                <h2 class="page-title">Checkout</h2>
                <!-- SHOPPING-CART SUMMARY END -->
            </div>

            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="shoping-cart-menu">
                    <h2 style="color:orangered"><i class="fa fa-map-marker" style="font-size:30px;color:red; margin-right:3px"></i>Shipping address</h2>
                    <div style="display:flex; justify-content:space-between">
                        <p>
                            <asp:Label ID="lbl_NameCustomer" runat="server" Text="" Font-Bold="true"></asp:Label><br />
                            <asp:Label ID="lbl_NumberPhone" runat="server" Text="" Font-Bold="true"></asp:Label>
                        </p>
                        <p>
                            <asp:Label ID="lbl_AddressCustomer" runat="server" Text=""></asp:Label></p>
                    </div>
                </div>
                <!-- CART TABLE_BLOCK START -->
                <div class="table-responsive">

                    <!-- TABLE START -->
                    <table class="table table-bordered" id="cart-summary">

                        <!-- TABLE HEADER START -->
                        <thead>
                            <tr>
                                <th class="cart-product">Product</th>
                                <th class="cart-description">Description</th>
                                <th class="cart-avail text-center">Availability</th>
                                <th class="cart-unit text-right">Unit price</th>
                                <th class="cart_quantity text-center">Qty</th>
                                <th class="cart-delete">&nbsp;</th>
                                <th class="cart-total text-right">Total</th>
                            </tr>
                        </thead>
                        <!-- TABLE HEADER END -->
                        <!-- TABLE BODY START -->
                        <asp:Repeater ID="repeater_Order" runat="server">
                            <ItemTemplate>
                                <tbody>
                                    <!-- SINGLE CART_ITEM START -->
                                    <tr>
                                        <td class="cart-product">
                                            <a href="#">
                                                <asp:Image ID="img_Product" runat="server" alt="product-image" ImageUrl='<%#"./img/product/sale/"+Eval("IMG") %>' />
                                        </td>
                                        <td class="cart-description">
                                            <h1>
                                                <asp:Label class="product-name" ID="lbl_NameProduct" runat="server" Text='<%#Eval("NAME_PRODUCT")%>'></asp:Label></h1>
                                            <small>Description :<asp:Label ID="lbl_Description" runat="server" Text='<%#Eval("DESCRIPTION")%>'></asp:Label></small>
                                            <small>Size :<asp:Label ID="lbl_Size" runat="server" Text='<%#Eval("NAME_SIZE")%>'></asp:Label>
                                            </small>
                                        </td>
                                        <td class="cart-avail"><span class="label label-success">In stock</span></td>
                                        <td class="cart-unit">
                                            <ul class="price text-right">
                                                <li class="price">$<asp:Label ID="lbl_PriceOut" runat="server" Text='<%#Eval("PRICE_OUT")%>'></asp:Label></li>
                                            </ul>
                                        </td>
                                        <td class="cart_quantity text-center">
                                            <asp:Label ID="lbl_Quantity" runat="server" Text='<%#Eval("QUANTITY_PRODUCT")%>'></asp:Label>
                                        </td>
                                        <td class="cart-delete text-center">
                                            <span>
                                                <a href="#" class="cart_quantity_delete" title="Delete"><i class="fa fa-trash-o" aria-disabled="true"></i></a>
                                            </span>
                                        </td>
                                        <td class="cart-total">
                                            <span class="price">$<asp:Label ID="lbl_TotalAmount" runat="server" Text='<%#Eval("AMOUNT")%>'></asp:Label></span>
                                        </td>
                                    </tr>
                                    <!-- SINGLE CART_ITEM END -->
                                </tbody>
                            </ItemTemplate>
                        </asp:Repeater>
                        <!-- TABLE BODY END -->
                        <!-- TABLE FOOTER START -->
                        <tfoot>
                            <tr class="cart-total-price">
                                <td class="cart_voucher" colspan="3" rowspan="4"></td>
                                <td class="text-right" colspan="3">Total products (tax excl.)</td>
                                <td id="total_product" class="price" colspan="1">$00.00</td>
                            </tr>
                            <tr>
                                <td class="text-right" colspan="3">Total shipping</td>
                                <td id="total_shipping" class="price" colspan="1">$0.00</td>
                            </tr>
                            <tr>
                                <td class="text-right" colspan="3">Total vouchers (tax excl.)</td>
                                <td class="price" colspan="1">$0.00</td>
                            </tr>
                            <tr>
                                <td class="total-price-container text-right" colspan="3">
                                    <span>Total</span>
                                </td>
                                <td id="total-price-container" class="price" colspan="1">
                                    <asp:Label ID="lbl_TotalAmount" runat="server" Text="" ForeColor="OrangeRed"></asp:Label>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <!-- RETURNE-CONTINUE-SHOP START -->
                <div class="returne-continue-shop">
                    <a href="home.aspx" class="continueshoping"><i class="fa fa-chevron-left"></i>Continue shopping</a>
                    <style>
                        .btn-procedtocheckout{
                            background: #ff4f4f none repeat scroll 0 0;
                            border-radius: 4px;
                            color: #fff;
                            border:none;
                            display: block;
                            float: right;
                            font-size: 20px;
                            line-height: 50px;
                            padding: 0 16px;
                            transition: all 500ms ease 0s;}
                    </style>
                    <asp:Button ID="btn_Order" class="btn-procedtocheckout" runat="server" Text="Order" OnClick="btn_Order_Click" />
                <!-- RETURNE-CONTINUE-SHOP END -->
            </div>
        </div>
    </div>

        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="first_item primari-box mycartaddress-info">
                <!-- SINGLE ADDRESS START -->
                <ul class="address">
                    <li>
                        <h3 class="page-subheading box-subheading">Delivery address (BootExperts Office)
                        </h3>
                    </li>
                    <li><span class="address_name">BootExperts</span></li>
                    <li><span class="address_company">Web development Company</span></li>
                    <li><span class="address_address1">Bonossri</span></li>
                    <li><span class="address_address2">D-Block</span></li>
                    <li><span class="">Rampura</span></li>
                    <li><span class="">Dhaka</span></li>
                    <li><span class="address_phone">+880 1735161598</span></li>
                    <li><span class="address_phone_mobile">+880 1975161598</span></li>
                </ul>
                <!-- SINGLE ADDRESS END -->
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="second_item primari-box mycartaddress-info">
                <!-- SINGLE ADDRESS START -->
                <ul class="address">
                    <li>
                        <h3 class="page-subheading box-subheading">Invoice address (BootExperts Home)
                        </h3>
                    </li>
                    <li><span class="address_name">BootExperts</span></li>
                    <li><span class="address_company">Web development Company</span></li>
                    <li><span class="address_address1">Dhaka</span></li>
                    <li><span class="address_address2">Bonossri</span></li>
                    <li><span class="">Dhaka-1205</span></li>
                    <li><span class="">Rampura</span></li>
                    <li><span class="address_phone">+880 1735161598</span></li>
                    <li><span class="address_phone_mobile">+880 1975161598</span></li>
                </ul>
                <!-- SINGLE ADDRESS END -->
            </div>
        </div>
   <%-- </form>--%>
</asp:Content>
