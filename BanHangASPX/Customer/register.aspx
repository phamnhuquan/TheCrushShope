<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="BanHangASPX.Customer.register" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>TheCrush Registration</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<!-- MATERIAL DESIGN ICONIC FONT -->
		<link rel="stylesheet" href="./fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">

		<!-- STYLE CSS -->
		<link rel="stylesheet" href="./css/styleRegister.css">
	</head>

	<body>

		<div class="wrapper" style="background-image: url('./img/latest-news/4.jpg');">
			<div class="inner">
				<div class="image-holder">
					<img src="./img/logoShop.png" alt="">
				</div>
				<form id="form_Register" runat="server">
					<h3>Registration Form</h3>
					<div class="form-group">
                        <asp:RequiredFieldValidator ID="reqFirstName" runat="server" controltovalidate="txt_FirstName"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txt_FirstName" runat="server" class="form-control" placeholder="First Name*" type="text" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqLastName" runat="server" controltovalidate="txt_LastName"></asp:RequiredFieldValidator>
						<asp:TextBox ID="txt_LastName" runat="server" class="form-control" placeholder="Last Name*" type="text"></asp:TextBox>
					</div>
                    
					<div class="form-wrapper">
                        <asp:RequiredFieldValidator ID="req_UserName" runat="server" controltovalidate="txt_UserName"></asp:RequiredFieldValidator>
						<asp:TextBox ID="txt_UserName" runat="server" class="form-control" placeholder="User Name*" type="text" ></asp:TextBox>
						<i class="zmdi zmdi-account"></i>
					</div>
                    <div class="form-wrapper">
                        <asp:RequiredFieldValidator ID="req_Password" runat="server" controltovalidate="txt_Password" ></asp:RequiredFieldValidator>
						<asp:TextBox ID="txt_Password" runat="server" class="form-control" placeholder="Password*" type="password" ></asp:TextBox>
						<i class="zmdi zmdi-lock"></i>
					</div>
					<div class="form-wrapper">
						<asp:RequiredFieldValidator ID="req_ConfirmPassword" runat="server" controltovalidate="txt_ConfirmPassword"></asp:RequiredFieldValidator>
						<asp:TextBox ID="txt_ConfirmPassword" runat="server" class="form-control" placeholder="Confirm Password*" type="password" ></asp:TextBox>
						<i class="zmdi zmdi-lock"></i>
					</div>
                    <div class="form-wrapper">
						<asp:TextBox ID="txt_PhoneNumber" runat="server" class="form-control" placeholder="Phone number*" type="text"></asp:TextBox>
						<i class="zmdi zmdi-phone"></i>
					</div>
					<div class="form-wrapper">
						<asp:TextBox ID="txt_Email" runat="server" class="form-control" placeholder="Email" type="text"></asp:TextBox>
						<i class="zmdi zmdi-email"></i>
					</div>
                    
                    <div class="form-wrapper">
						<asp:TextBox ID="txt_Address" runat="server" class="form-control" placeholder="Address" type="text"></asp:TextBox>
					</div>
					
					<div class="button">
                        <asp:Button ID="btn_Register" runat="server" Text="Register" CssClass="btnnone" OnClick="Btn_Register_Click"/>
						<i class="zmdi zmdi-arrow-right"></i>
					</div>
                    <p style="text-align:right"><a href="LoginUser.aspx">Login</a></p>
                    <asp:Label ID="lbl_Susses" runat="server" Text=""></asp:Label>
				</form>
			</div>
		</div>
		
	</body>
</html>
