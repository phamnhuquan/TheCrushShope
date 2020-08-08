<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/MasterPageForCustomer.Master" AutoEventWireup="true" CodeBehind="productdetail.aspx.cs" Inherits="BanHangASPX.Customer.productdetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentProduct" runat="server">

    <%--<form id="form1" runat="server">--%>
        <asp:Repeater ID="repeater_ProductDetail" runat="server"  OnItemCommand="repeater_ProductDetail_ItemCommand" OnItemCreated="repeater_ProductDetail_ItemCreated">
            <ItemTemplate>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <!-- BSTORE-BREADCRUMB START -->
                        <div class="bstore-breadcrumb">
                            <a href="home.aspx">Home<span><i class="fa fa-caret-right"></i></span></a>
                            <asp:Label ID="lbl_NameProductTitle" runat="server" Text='<%#Eval("NAME_PRODUCT")%>'></asp:Label>
                        </div>
                        <!-- BSTORE-BREADCRUMB END -->
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                        <!-- SINGLE-PRODUCT-DESCRIPTION START -->
                        <div class="row">
                            <div class="col-lg-5 col-md-5 col-sm-4 col-xs-12">
                                <div class="single-product-view">
                                    <!-- Tab panes -->
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="thumbnail_1">
                                            <div class="single-product-image">
                                                <asp:Image ID="img_Product" runat="server" alt="product-image" ImageUrl='<%#"./img/product/sale/"+Eval("IMG") %>'/>
                                                <a class="new-mark-box" href="#">new</a>
                                                <a class="fancybox" href="<%#"./img/product/sale/"+Eval("IMG") %>" data-fancybox-group="gallery"><span class="btn large-btn">View larger <i class="fa fa-search-plus"></i></span></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-8 col-xs-12">
                                <div class="single-product-descirption">
                                    <h2>
                                        <asp:Label ID="lbl_NameProductDetail" runat="server" Text='<%#Eval("NAME_PRODUCT")%>'></asp:Label></h2>
                                    <div class="single-product-social-share">
                                        <ul>
                                            <li><a href="#" class="twi-link"><i class="fa fa-twitter"></i>Tweet</a></li>
                                            <li><a href="#" class="fb-link"><i class="fa fa-facebook"></i>Share</a></li>
                                            <li><a href="#" class="g-plus-link"><i class="fa fa-google-plus"></i>Google+</a></li>
                                            <li><a href="#" class="pin-link"><i class="fa fa-pinterest"></i>Pinterest</a></li>
                                        </ul>
                                    </div>
                                    <div class="single-product-review-box">
                                        <div class="rating-box">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-empty"></i>
                                        </div>
                                        <div class="read-reviews">
                                            <a href="#">Read reviews (1)</a>
                                        </div>
                                        <div class="write-review">
                                            <a href="#">Write a review</a>
                                        </div>
                                    </div>
                                    <div class="single-product-condition">
                                        <p>
                                            Reference: <span>
                                                <asp:Label ID="lbl_Description" runat="server" Text='<%#Eval("DESCRIPTION")%>'></asp:Label></span>
                                        </p>
                                        <p>Condition: <span>New product</span></p>
                                    </div>
                                    <div class="single-product-price">
                                        <h2>$<asp:Label ID="lbl_PriceOut" runat="server" Text='<%#Eval("PRICE_OUT")%>'></asp:Label></h2>
                                    </div>
                                    <div class="single-product-desc">
                                        <p>
                                            <asp:Label ID="lbl_Description1" runat="server" Text='<%#Eval("DESCRIPTION")%>'></asp:Label>
                                        </p>
                                        <div class="product-in-stock">
                                            <p>
                                                <asp:Label ID="lbl_inStock" runat="server" Text='<%#Eval("QUANTITY_PRODUCT")%>'></asp:Label><strong style="margin-left: 4px;">Items In stock</strong>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="single-product-info">
                                        <a href="#"><i class="fa fa-envelope"></i></a>
                                        <a href="#"><i class="fa fa-print"></i></a>
                                        <a href="#"><i class="fa fa-heart"></i></a>
                                    </div>
                                    
                                    <div class="single-product-quantity">
                                        <p class="small-title">Quantity</p>
                                        <div class="cart-quantity">
                                            <div class="cart-plus-minus-button single-qty-btn">
                                                <asp:TextBox ID="txt_Quantity" runat="server" class="cart-plus-minus sing-pro-qty" type="number" Text="1" CommandName="cmd_Quantity"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="single-product-color">
                                        <p class="small-title">Color </p>
                                        <a href="#"><span></span></a>
                                        <a class="color-blue" href="#"><span></span></a>
                                    </div>
                                    <div class="single-product-add-cart">
                                        <asp:Button ID="btn_AddToCart" runat="server" Text="Add to cart" class="add-cart-text" OnCommandName="btn_addToCartClick" CommandName="addToCartClick"/>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- SINGLE-PRODUCT-DESCRIPTION END -->
                        <!-- SINGLE-PRODUCT INFO TAB START -->
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="product-more-info-tab">
                                    <!-- Nav tabs -->
                                    <ul class="nav nav-tabs more-info-tab">
                                        <li class="active"><a href="#moreinfo" data-toggle="tab">more info</a></li>
                                        <li><a href="#datasheet" data-toggle="tab">data sheet</a></li>
                                        <li><a href="#review" data-toggle="tab">reviews</a></li>
                                    </ul>
                                    <!-- Tab panes -->
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="moreinfo">
                                            <div class="tab-description">
                                                <p>Fashion has been creating well-designed collections since 2010. The brand offers feminine designs delivering stylish separates and statement dresses which have since evolved into a full ready-to-wear collection in which every item is a vital part of a woman's wardrobe. The result? Cool, easy, chic looks with youthful elegance and unmistakable signature style. All the beautiful pieces are made in Italy and manufactured with the greatest attention. Now Fashion extends to a range of accessories including shoes, hats, belts and more!</p>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="datasheet">
                                            <div class="deta-sheet">
                                                <table class="table-data-sheet">
                                                    <tbody>
                                                        <tr class="odd">
                                                            <td>Compositions</td>
                                                            <td>Cotton</td>
                                                        </tr>
                                                        <tr class="even">
                                                            <td class="td-bg">Styles</td>
                                                            <td class="td-bg">Casual</td>
                                                        </tr>
                                                        <tr class="odd">
                                                            <td>Properties</td>
                                                            <td>Short Sleeve</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="review">
                                            <div class="row tab-review-row">
                                                <div class="col-xs-5 col-sm-4 col-md-4 col-lg-3 padding-5">
                                                    <div class="tab-rating-box">
                                                        <span>Grade</span>
                                                        <div class="rating-box">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-half-empty"></i>
                                                        </div>
                                                        <div class="review-author-info">
                                                            <strong>write A REVIEW</strong>
                                                            <span>06/22/2015</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xs-7 col-sm-8 col-md-8 col-lg-9 padding-5">
                                                    <div class="write-your-review">
                                                        <p><strong>write A REVIEW</strong></p>
                                                        <p>write A REVIEW</p>
                                                        <span class="usefull-comment">Was this comment useful to you? <span>Yes</span><span>No</span></span>
                                                        <a href="#">Report abuse </a>
                                                    </div>
                                                </div>
                                                <a href="#" class="write-review-btn">Write your review!</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- SINGLE-PRODUCT INFO TAB END -->
                        <!-- RELATED-PRODUCTS-AREA START -->
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="left-title-area">
                                    <h2 class="left-title">related products</h2>
                                </div>
                            </div>
                            <div class="related-product-area featured-products-area">
                                <div class="col-sm-12">
                                    <div class=" row">
                                        <!-- RELATED-CAROUSEL START -->
                                        <div class="related-product">
                                            <!-- SINGLE-PRODUCT-ITEM START -->
                                            <div class="item">
                                                <div class="single-product-item">
                                                    <div class="product-image">
                                                        <a href="#">
                                                            <img src="img/product/sale/3.jpg" alt="product-image" /></a>
                                                    </div>
                                                    <div class="product-info">
                                                        <div class="customar-comments-box">
                                                            <div class="rating-box">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star-half-empty"></i>
                                                            </div>
                                                            <div class="review-box">
                                                                <span>1 Review(s)</span>
                                                            </div>
                                                        </div>
                                                        <a href="#">Faded Short T-sh...</a>
                                                        <div class="price-box">
                                                            <span class="price">$16.51</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- SINGLE-PRODUCT-ITEM END -->
                                            <!-- SINGLE-PRODUCT-ITEM START -->
                                            <div class="item">
                                                <div class="single-product-item">
                                                    <div class="product-image">
                                                        <a href="#">
                                                            <img src="img/product/sale/1.jpg" alt="product-image" /></a>
                                                    </div>
                                                    <div class="product-info">
                                                        <div class="customar-comments-box">
                                                            <div class="rating-box">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </div>
                                                            <div class="review-box">
                                                                <span>1 Review(s)</span>
                                                            </div>
                                                        </div>
                                                        <a href="#">Blouse</a>
                                                        <div class="price-box">
                                                            <span class="price">$22.95</span>
                                                            <span class="old-price">$27.00</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- SINGLE-PRODUCT-ITEM END -->
                                            <!-- SINGLE-PRODUCT-ITEM START -->
                                            <div class="item">
                                                <div class="single-product-item">
                                                    <div class="product-image">
                                                        <a href="#">
                                                            <img src="img/product/sale/9.jpg" alt="product-image" /></a>
                                                    </div>
                                                    <div class="product-info">
                                                        <div class="customar-comments-box">
                                                            <div class="rating-box">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star-half-empty"></i>
                                                                <i class="fa fa-star-half-empty"></i>
                                                            </div>
                                                            <div class="review-box">
                                                                <span>1 Review(s)</span>
                                                            </div>
                                                        </div>
                                                        <a href="#">Printed Dress</a>
                                                        <div class="price-box">
                                                            <span class="price">$23.40</span>
                                                            <span class="old-price">$26.00</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- SINGLE-PRODUCT-ITEM END -->
                                            <!-- SINGLE-PRODUCT-ITEM START -->
                                            <div class="item">
                                                <div class="single-product-item">
                                                    <div class="product-image">
                                                        <a href="#">
                                                            <img src="img/product/sale/5.jpg" alt="product-image" /></a>
                                                        <div class="overlay-content">
                                                        </div>
                                                    </div>
                                                    <div class="product-info">
                                                        <div class="customar-comments-box">
                                                            <div class="rating-box">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star-half-empty"></i>
                                                            </div>
                                                            <div class="review-box">
                                                                <span>1 Review(s)</span>
                                                            </div>
                                                        </div>
                                                        <a href="#">Printed Dress</a>
                                                        <div class="price-box">
                                                            <span class="price">$50.99</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- SINGLE-PRODUCT-ITEM END -->
                                            <!-- SINGLE-PRODUCT-ITEM START -->
                                            <div class="item">
                                                <div class="single-product-item">
                                                    <div class="product-image">
                                                        <a href="#">
                                                            <img src="img/product/sale/12.jpg" alt="product-image" /></a>
                                                    </div>
                                                    <div class="product-info">
                                                        <div class="customar-comments-box">
                                                            <div class="rating-box">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star-half-empty"></i>
                                                                <i class="fa fa-star-half-empty"></i>
                                                            </div>
                                                            <div class="review-box">
                                                                <span>1 Review(s)</span>
                                                            </div>
                                                        </div>
                                                        <a href="#">Printed Summer Dr...</a>
                                                        <div class="price-box">
                                                            <span class="price">$28.98</span>
                                                            <span class="old-price">$30.51</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- SINGLE-PRODUCT-ITEM END -->
                                            <!-- SINGLE-PRODUCT-ITEM START -->
                                            <div class="item">
                                                <div class="single-product-item">
                                                    <div class="product-image">
                                                        <a href="#">
                                                            <img src="img/product/sale/13.jpg" alt="product-image" /></a>
                                                    </div>
                                                    <div class="product-info">
                                                        <div class="customar-comments-box">
                                                            <div class="rating-box">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </div>
                                                            <div class="review-box">
                                                                <span>1 Review(s)</span>
                                                            </div>
                                                        </div>
                                                        <a href="#">Printed Summer</a>
                                                        <div class="price-box">
                                                            <span class="price">$30.50</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- SINGLE-PRODUCT-ITEM END -->
                                            <!-- SINGLE-PRODUCT-ITEM START -->
                                            <div class="item">
                                                <div class="single-product-item">
                                                    <div class="product-image">
                                                        <a href="#">
                                                            <img src="img/product/sale/7.jpg" alt="product-image" /></a>
                                                    </div>
                                                    <div class="product-info">
                                                        <div class="customar-comments-box">
                                                            <div class="rating-box">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star-half-empty"></i>
                                                                <i class="fa fa-star-half-empty"></i>
                                                            </div>
                                                            <div class="review-box">
                                                                <span>1 Review(s)</span>
                                                            </div>
                                                        </div>
                                                        <a href="#">Printed Chiffon Dr...</a>
                                                        <div class="price-box">
                                                            <span class="price">$16.40</span>
                                                            <span class="old-price">$20.50</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- SINGLE-PRODUCT-ITEM END -->
                                            <!-- SINGLE-PRODUCT-ITEM START -->
                                            <div class="item">
                                                <div class="single-product-item">
                                                    <div class="product-image">
                                                        <a href="#">
                                                            <img src="img/product/sale/11.jpg" alt="product-image" /></a>
                                                    </div>
                                                    <div class="product-info">
                                                        <div class="customar-comments-box">
                                                            <div class="rating-box">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </div>
                                                            <div class="review-box">
                                                                <span>1 Review(s)</span>
                                                            </div>
                                                        </div>
                                                        <a href="#">Printed Dress</a>
                                                        <div class="price-box">
                                                            <span class="price">$26.00</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- SINGLE-PRODUCT-ITEM END -->
                                            <!-- SINGLE-PRODUCT-ITEM START -->
                                            <div class="item">
                                                <div class="single-product-item">
                                                    <div class="product-image">
                                                        <a href="#">
                                                            <img src="img/product/sale/10.jpg" alt="product-image" /></a>
                                                    </div>
                                                    <div class="product-info">
                                                        <div class="customar-comments-box">
                                                            <div class="rating-box">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star-half-empty"></i>
                                                                <i class="fa fa-star-half-empty"></i>
                                                            </div>
                                                            <div class="review-box">
                                                                <span>1 Review(s)</span>
                                                            </div>
                                                        </div>
                                                        <a href="#">Printed Dress</a>
                                                        <div class="price-box">
                                                            <span class="price">$26.00</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- SINGLE-PRODUCT-ITEM END -->
                                            <!-- SINGLE-PRODUCT-ITEM START -->
                                            <div class="item">
                                                <div class="single-product-item">
                                                    <div class="product-image">
                                                        <a href="#">
                                                            <img src="img/product/sale/2.jpg" alt="product-image" /></a>
                                                    </div>
                                                    <div class="product-info">
                                                        <div class="customar-comments-box">
                                                            <div class="rating-box">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </div>
                                                            <div class="review-box">
                                                                <span>1 Review(s)</span>
                                                            </div>
                                                        </div>
                                                        <a href="#">Blouse</a>
                                                        <div class="price-box">
                                                            <span class="price">$27.00</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- SINGLE-PRODUCT-ITEM END -->
                                            <!-- SINGLE-PRODUCT-ITEM START -->
                                            <div class="item">
                                                <div class="single-product-item">
                                                    <div class="product-image">
                                                        <a href="#">
                                                            <img src="img/product/sale/4.jpg" alt="product-image" /></a>
                                                    </div>
                                                    <div class="product-info">
                                                        <div class="customar-comments-box">
                                                            <div class="rating-box">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star-half-empty"></i>
                                                            </div>
                                                            <div class="review-box">
                                                                <span>1 Review(s)</span>
                                                            </div>
                                                        </div>
                                                        <a href="#">Faded Short Sle...</a>
                                                        <div class="price-box">
                                                            <span class="price">$16.51</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- SINGLE-PRODUCT-ITEM END -->
                                            <!-- SINGLE-PRODUCT-ITEM START -->
                                            <div class="item">
                                                <div class="single-product-item">
                                                    <div class="product-image">
                                                        <a href="#">
                                                            <img src="img/product/sale/6.jpg" alt="product-image" /></a>
                                                    </div>
                                                    <div class="product-info">
                                                        <div class="customar-comments-box">
                                                            <div class="rating-box">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </div>
                                                            <div class="review-box">
                                                                <span>1 Review(s)</span>
                                                            </div>
                                                        </div>
                                                        <a href="#">Printed Chiffon Dr...</a>
                                                        <div class="price-box">
                                                            <span class="price">$16.40</span>
                                                            <span class="old-price">$20.50</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- SINGLE-PRODUCT-ITEM END -->
                                            <!-- SINGLE-PRODUCT-ITEM START -->
                                            <div class="item">
                                                <div class="single-product-item">
                                                    <div class="product-image">
                                                        <a href="#">
                                                            <img src="img/product/sale/8.jpg" alt="product-image" /></a>
                                                    </div>
                                                    <div class="product-info">
                                                        <div class="customar-comments-box">
                                                            <div class="rating-box">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star-half-empty"></i>
                                                            </div>
                                                            <div class="review-box">
                                                                <span>1 Review(s)</span>
                                                            </div>
                                                        </div>
                                                        <a href="#">Printed Dress</a>
                                                        <div class="price-box">
                                                            <span class="price">$26.00</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- SINGLE-PRODUCT-ITEM END -->
                                            <!-- SINGLE-PRODUCT-ITEM START -->
                                        </div>
                                        <!-- RELATED-CAROUSEL END -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- RELATED-PRODUCTS-AREA END -->
                    </div>
                    <!-- RIGHT SIDE BAR START -->
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                        <!-- SINGLE SIDE BAR START -->
                        <div class="single-product-right-sidebar">
                            <h2 class="left-title">Viewed products</h2>
                            <ul>
                                <li>
                                    <a href="#">
                                        <img src="img/product/sidebar_product/2.jpg" alt="" /></a>
                                    <div class="r-sidebar-pro-content">
                                        <h5><a href="#">Faded Short ...</a></h5>
                                        <p>Faded short sleeves t-shirt with high...</p>
                                    </div>
                                </li>
                                <li>
                                    <a href="#">
                                        <img src="img/product/sidebar_product/4.jpg" alt="" /></a>
                                    <div class="r-sidebar-pro-content">
                                        <h5><a href="#">Printed Chif ..</a></h5>
                                        <p>Printed chiffon knee length dress...</p>
                                    </div>
                                </li>
                                <li>
                                    <a href="#">
                                        <img src="img/product/sidebar_product/6.jpg" alt="" /></a>
                                    <div class="r-sidebar-pro-content">
                                        <h5><a href="#">Printed Sum ...</a></h5>
                                        <p>Long printed dress with thin...</p>
                                    </div>
                                </li>
                                <li>
                                    <a href="#">
                                        <img src="img/product/sidebar_product/1.jpg" alt="" /></a>
                                    <div class="r-sidebar-pro-content">
                                        <h5><a href="#">Printed Dress </a></h5>
                                        <p>100% cotton double printed dress....</p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <!-- SINGLE SIDE BAR END -->
                        <!-- SINGLE SIDE BAR START -->
                        <div class="single-product-right-sidebar clearfix">
                            <h2 class="left-title">Tags </h2>
                            <div class="category-tag">
                                <a href="#">fashion</a>
                                <a href="#">handbags</a>
                                <a href="#">women</a>
                                <a href="#">men</a>
                                <a href="#">kids</a>
                                <a href="#">New</a>
                                <a href="#">Accessories</a>
                                <a href="#">clothing</a>
                                <a href="#">New</a>
                            </div>
                        </div>
                        <!-- SINGLE SIDE BAR END -->
                        <!-- SINGLE SIDE BAR START -->
                        <div class="single-product-right-sidebar">
                            <div class="slider-right zoom-img">
                                <a href="#">
                                    <img class="img-responsive" src="img/product/cms11.jpg" alt="sidebar left" /></a>
                            </div>
                        </div>
                    </div>
                    <!-- SINGLE SIDE BAR END -->
                </div>
            </ItemTemplate>
        </asp:Repeater>
    <%--</form>--%>
</asp:Content>
