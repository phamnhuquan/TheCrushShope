<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/MasterPageForCustomer.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="BanHangASPX.Customer.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentProduct" runat="server">
    <%--<form id="form1" runat="server">--%>
    <div class="row">
            <!-- MAIN-SLIDER-AREA START -->
            <div class="main-slider-area">
                <!-- SLIDER-AREA START -->
                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                    <div class="slider-area">
                        <div id="wrapper">
                            <div class="slider-wrapper">
                                <div id="mainSlider" class="nivoSlider">
                                    <img src="img/slider/2.jpg" alt="main slider" title="#htmlcaption" />
                                    <img src="img/slider/1.jpg" alt="main slider" title="#htmlcaption2" />
                                </div>
                                <div id="htmlcaption" class="nivo-html-caption slider-caption">
                                    <div class="slider-progress"></div>
                                    <div class="slider-cap-text slider-text1">
                                        <div class="d-table-cell">
                                            <h2 class="animated bounceInDown">Welcome to TheCrush Shop</h2>
                                            <p class="animated bounceInUp">Wish you have happy shopping hours!!!</p>
                                            <a class="wow zoomInDown" data-wow-duration="1s" data-wow-delay="1s" href="#">Read More <i class="fa fa-caret-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div id="htmlcaption2" class="nivo-html-caption slider-caption">
                                    <div class="slider-progress"></div>
                                    <div class="slider-cap-text slider-text2">
                                        <div class="d-table-cell">
                                            <h2 class="animated bounceInDown">Welcome to TheCrush Shop</h2>
                                            <p class="animated bounceInUp">Wish you have happy shopping hours!!!</p>
                                            <a class="wow zoomInDown" data-wow-duration="1s" data-wow-delay="1s" href="#">Read More <i class="fa fa-caret-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- SLIDER-AREA END -->
                <!-- SLIDER-RIGHT START -->
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="slider-right zoom-img m-top">
                        <a href="#">
                            <img class="img-responsive" src="img/product/cms11.jpg" alt="sidebar left" /></a>
                    </div>
                </div>
                <!-- SLIDER-RIGHT END -->
            </div>
            <!-- MAIN-SLIDER-AREA END -->
        </div>
    <div class="row tow-column-product">
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <!-- NEW-PRODUCT-AREA START -->
                <div class="new-product-area">
                    <div class="left-title-area">
                        <h2 class="left-title">New Products</h2>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="row">
                                <!-- NEW-PRO-CAROUSEL START -->
                                <div class="new-pro-carousel">
                                    <!-- NEW-PRODUCT-SINGLE-ITEM START -->
                                    <asp:Repeater ID="repeater_Product" runat="server">
                                        <ItemTemplate>
                                            <div class="item">
                                                <div class="new-product">
                                                     <div class="single-product-item">
                                                        <div class="product-image">
                                                            <a href="#">
                                                                <a href="productdetail.aspx?id=<%#Eval("ID_PRODUCT") %>" title="view detail"><asp:Image ID="img_Product" runat="server" alt="product-image" ImageUrl='<%#"./img/product/sale/"+Eval("IMG") %>' /></a>
                                                                <a href="#" class="new-mark-box">new</a>
                                                                <div class="overlay-content">
                                                                    <ul>
                                                                        <li><a href="productdetail.aspx?id=<%#Eval("ID_PRODUCT") %>"" title="view detail"><i class="fa fa-search"></i></a></li>
                                                                        <li><a href="productdetail.aspx?id=<%#Eval("ID_PRODUCT") %>" title="add to cart"><i class="fa fa-shopping-cart"></i></a></li>
                                                                        <li><a href="#" title="Quick view"><i class="fa fa-retweet"></i></a></li>
                                                                        <li><a href="#" title="Quick view"><i class="fa fa-heart-o"></i></a></li>
                                                                    </ul>
                                                                </div>
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
                                                                    <span>1 Review (s)</span>
                                                                </div>
                                                            </div>
                                                            <a href="productdetail.aspx?id=<%#Eval("ID_PRODUCT") %>">
                                                                <asp:Label class="price" ID="lbl_NameProduct" runat="server" Text='<%#Eval("NAME_PRODUCT")%>'></asp:Label></a>
                                                            <div class="price-box">
                                                                <span class="price">$<asp:Label class="price" ID="lbl_PriceOut" runat="server" Text='<%#Eval("PRICE_OUT")%>'></asp:Label></span>
                                                                <span class="old-price">$<asp:Label class="old-price" ID="lbl_PriceOld" runat="server" Text='<%#Eval("PRICE_OLD")%>'></asp:Label></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                     </asp:Repeater>
                                  </div>
                                <!-- NEW-PRO-CAROUSEL END -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- NEW-PRODUCT-AREA END -->
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
						<!-- SALE-PRODUCTS START -->
						<div class="Sale-Products">
							<div class="left-title-area">
								<h2 class="left-title">Sale Products</h2>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<div class="row">
										<!-- SALE-CAROUSEL START -->
										<div class="sale-carousel">								
									        <asp:Repeater ID="repeater_ProductSale" runat="server">
                                                <ItemTemplate>
                                                    <div class="item">
                                                        <div class="new-product">
                                                             <div class="single-product-item">
                                                                <div class="product-image">
                                                                    <a href="#">
                                                                        <a href="productdetail.aspx?id=<%#Eval("ID_PRODUCT") %>" title="view detail"><asp:Image ID="img_Product" runat="server" alt="product-image" ImageUrl='<%#"./img/product/sale/"+Eval("IMG") %>' /></a>
                                                                        <a href="#" class="new-mark-box">Sale</a>
                                                                        <div class="overlay-content">
                                                                            <ul>
                                                                                <li><a href="productdetail.aspx?id=<%#Eval("ID_PRODUCT") %>"" title="view detail"><i class="fa fa-search"></i></a></li>
                                                                                <li><a href="productdetail.aspx?id=<%#Eval("ID_PRODUCT") %>" title="add to cart"><i class="fa fa-shopping-cart"></i></a></li>
                                                                                <li><a href="#" title="Quick view"><i class="fa fa-retweet"></i></a></li>
                                                                                <li><a href="#" title="Quick view"><i class="fa fa-heart-o"></i></a></li>
                                                                            </ul>
                                                                        </div>
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
                                                                            <span>1 Review (s)</span>
                                                                        </div>
                                                                    </div>
                                                                    <a href="productdetail.aspx?id=<%#Eval("ID_PRODUCT") %>">
                                                                        <asp:Label class="price" ID="lbl_NameProduct" runat="server" Text='<%#Eval("NAME_PRODUCT")%>'></asp:Label></a>
                                                                    <div class="price-box">
                                                                        <span class="price">$<asp:Label class="price" ID="lbl_PriceOut" runat="server" Text='<%#Eval("PRICE_OUT")%>'></asp:Label></span>
                                                                        <span class="old-price">$<asp:Label class="old-price" ID="lbl_PriceOld" runat="server" Text='<%#Eval("PRICE_OLD")%>'></asp:Label></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                             </asp:Repeater>									
										</div>
										<!-- SALE-CAROUSEL END -->
									</div>
								</div>
							</div>
						</div>
						<!-- SALE-PRODUCTS END -->
					</div>
        </div>
    <div class="row">
        <!-- ADD-TWO-BY-ONE-COLUMN START -->
        <div class="add-two-by-one-column">
            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                <div class="tow-column-add zoom-img">
                    <a href="#">
                        <img src="img/product/shope-add1.jpg" alt="shope-add" /></a>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <div class="one-column-add zoom-img">
                    <a href="#">
                        <img src="img/product/shope-add2.jpg" alt="shope-add" /></a>
                </div>
            </div>
        </div>
        <!-- ADD-TWO-BY-ONE-COLUMN END -->
    </div>
    <div class="row">
        <!-- FEATURED-PRODUCTS-AREA START -->
        <div class="featured-products-area">
            <div class="center-title-area">
                <h2 class="center-title">Woman Products</h2>
            </div>
            <div class="col-xs-12">
                <div class="row">
                    <!-- FEARTURED-CAROUSEL START -->
                    <div class="feartured-carousel">
                        <!-- SINGLE-PRODUCT-ITEM START -->
                        <asp:Repeater ID="repeater_forWoman" runat="server">
                             <ItemTemplate>
                                                    <div class="item">
                                                        <div class="new-product">
                                                             <div class="single-product-item">
                                                                <div class="product-image">
                                                                    <a href="#">
                                                                        <a href="productdetail.aspx?id=<%#Eval("ID_PRODUCT") %>" title="view detail"><asp:Image ID="img_Product" runat="server" alt="product-image" ImageUrl='<%#"./img/product/sale/"+Eval("IMG") %>' /></a>
                                                                        <a href="#" class="new-mark-box">New</a>
                                                                        <div class="overlay-content">
                                                                            <ul>
                                                                                <li><a href="productdetail.aspx?id=<%#Eval("ID_PRODUCT") %>" title="view detail"><i class="fa fa-search"></i></a></li>
                                                                                <li><a href="productdetail.aspx?id=<%#Eval("ID_PRODUCT") %>" title="add to cart"><i class="fa fa-shopping-cart"></i></a></li>
                                                                                <li><a href="#" title="Quick view"><i class="fa fa-retweet"></i></a></li>
                                                                                <li><a href="#" title="Quick view"><i class="fa fa-heart-o"></i></a></li>
                                                                            </ul>
                                                                        </div>
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
                                                                            <span>1 Review (s)</span>
                                                                        </div>
                                                                    </div>
                                                                    <a href="productdetail.aspx?id=<%#Eval("ID_PRODUCT") %>">
                                                                        <asp:Label class="price" ID="lbl_NameProduct" runat="server" Text='<%#Eval("NAME_PRODUCT")%>'></asp:Label></a>
                                                                    <div class="price-box">
                                                                        <span class="price">$<asp:Label class="price" ID="lbl_PriceOut" runat="server" Text='<%#Eval("PRICE_OUT")%>'></asp:Label></span>
                                                                        <span class="old-price">$<asp:Label class="old-price" ID="lbl_PriceOld" runat="server" Text='<%#Eval("PRICE_OLD")%>'></asp:Label></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                         </asp:Repeater>
                        <!-- SINGLE-PRODUCT-ITEM END -->
                    </div>
                    <!-- FEARTURED-CAROUSEL END -->
                </div>
            </div>
        </div>
        <!-- FEATURED-PRODUCTS-AREA END -->
    </div>
    <div class="row">
        <!-- FEATURED-PRODUCTS-AREA START -->
        <div class="featured-products-area">
            <div class="center-title-area">
                <h2 class="center-title">Men Products</h2>
            </div>
            <div class="col-xs-12">
                <div class="row">
                    <!-- FEARTURED-CAROUSEL START -->
                    <div class="feartured-carousel">
                        <!-- SINGLE-PRODUCT-ITEM START -->
                        <asp:Repeater ID="repeater_forMen" runat="server">
                             <ItemTemplate>
                                                    <div class="item">
                                                        <div class="new-product">
                                                             <div class="single-product-item">
                                                                <div class="product-image">
                                                                    <a href="#">
                                                                        <a href="productdetail.aspx?id=<%#Eval("ID_PRODUCT") %>" title="view detail"><asp:Image ID="img_Product" runat="server" alt="product-image" ImageUrl='<%#"./img/product/sale/"+Eval("IMG") %>' /></a>
                                                                        <a href="#" class="new-mark-box">New</a>
                                                                        <div class="overlay-content">
                                                                            <ul>
                                                                                <li><a href="productdetail.aspx?id=<%#Eval("ID_PRODUCT") %>"" title="view detail"><i class="fa fa-search"></i></a></li>
                                                                                <li><a href="#" title="add to cart"><i class="fa fa-shopping-cart"></i></a></li>
                                                                                <li><a href="#" title="Quick view"><i class="fa fa-retweet"></i></a></li>
                                                                                <li><a href="#" title="Quick view"><i class="fa fa-heart-o"></i></a></li>
                                                                            </ul>
                                                                        </div>
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
                                                                            <span>1 Review (s)</span>
                                                                        </div>
                                                                    </div>
                                                                    <a href="#">
                                                                        <asp:Label class="price" ID="lbl_NameProduct" runat="server" Text='<%#Eval("NAME_PRODUCT")%>'></asp:Label></a>
                                                                    <div class="price-box">
                                                                        <span class="price">$<asp:Label class="price" ID="lbl_PriceOut" runat="server" Text='<%#Eval("PRICE_OUT")%>'></asp:Label></span>
                                                                        <span class="old-price">$<asp:Label class="old-price" ID="lbl_PriceOld" runat="server" Text='<%#Eval("PRICE_OLD")%>'></asp:Label></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                         </asp:Repeater>
                        <!-- SINGLE-PRODUCT-ITEM END -->
                    </div>
                    <!-- FEARTURED-CAROUSEL END -->
                </div>
            </div>
        </div>
        <!-- FEATURED-PRODUCTS-AREA END -->
    </div>

    <%--</form>--%>
</asp:Content>
