<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginAdmin.aspx.cs" Inherits="BanHangASPX.LoginAdmin" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin TheCrush</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href='http://fonts.googleapis.com/css?family=Oswald:400,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Bitter:400,700,400italic&amp;subset=latin,latin-ext' rel='stylesheet' type='text/css'>
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="./images/icons/favicon.ico" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="./vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" href="./css/font-awesome.min.css" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="./css/utilLogin.css">
    <link rel="stylesheet" type="text/css" href="./css/mainLogin.css">
    <!--===============================================================================================-->
</head>
<body>
    <div class="limiter">
        <div class="container-login100" style="background-image: url('./img/product/shope-add22.jpg');">
            <div class="wrap-login100 p-t-70 p-b-30">
                <form class="login100-form validate-form" runat="server">
                    <div class="login100-form-avatar">
                        <img src="img/logoShop.png" alt="AVATAR">
                    </div>

                    <span class="login100-form-title p-t-20 p-b-45">Admin TheCrush Shop
                    </span>

                    <div class="wrap-input100 validate-input m-b-10" data-validate="Username is required">
                        <asp:TextBox ID="txt_Username" runat="server" class="input100" type="text" name="username" placeholder="Username"></asp:TextBox>
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                            <i class="fa fa-user"></i>
                        </span>
                    </div>

                    <div class="wrap-input100 validate-input m-b-10" data-validate="Password is required">
                        <asp:TextBox ID="txt_Password" runat="server" class="input100" type="password" name="pass" placeholder="Password"></asp:TextBox>
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                            <i class="fa fa-lock"></i>
                        </span>
                    </div>

                    <div class="custom-control custom-checkbox my-1 mr-sm-2" style="margin-left: 30px;">
                        <asp:CheckBox ID="cb_RememberMe" runat="server" class="custom-control-input" style="color: antiquewhite; font-size: 0.93rem;" Text="Remember me" />
                        <asp:Label ID="lbl_Wrong" runat="server" Text="" style="color:red" ></asp:Label>
                    </div>
                    <div class="container-login100-form-btn p-t-10">
                        <asp:Button ID="btn_login" runat="server" Text="Login" class="login100-form-btn" OnClick="btn_login_Click" />
                    </div>

                    <div class="text-center w-full p-t-25 p-b">
                        <a href="#" class="txt1">Forgot Username / Password?
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--===============================================================================================-->
    <script src="./js/mainLogin.js"></script>

</body>
</html>
