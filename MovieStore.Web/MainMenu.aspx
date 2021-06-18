<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="MainMenu.aspx.cs" Inherits="MovieStore.Web.MainMenu" %>

<asp:Content ID="cMainMenu" ContentPlaceHolderID="cphMain" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Main Menu</h1>

                <p>Please choose one of the options below.</p>

                <asp:PlaceHolder ID="phAdminMenu" runat="server">
                    <ul class="list-group">
                        <li class="list-group-item"><a href="MyProfile.aspx" title="My Profile">My Profile</a></li>
                        <li class="list-group-item"><a href="MyAddressInfo.aspx" title="My Address Info">My Address Info</a></li>
                        <li class="list-group-item"><a href="MyPhoneInfo.aspx" title="My Phone Info">My Phone Info</a></li>
                        <li class="list-group-item"><a href="MySecurityInfo.aspx" title="My Security Info">My Security Info</a></li>
                    </ul>

                    <div class="clearfix">&nbsp;</div>

                    <ul class="list-group">
                        <li class="list-group-item"><a href="Categories.aspx" title="Categories">Manage Categories</a></li>
                        <li class="list-group-item"><a href="CreditCardTypes.aspx" title="Credit Card Type">Manage Credit Card Types</a></li>
                        <li class="list-group-item"><a href="PaymentTypes.aspx" title="Payment Types">Manage Payment Types</a></li>
                        <li class="list-group-item"><a href="PhoneTypes.aspx" title="Phone Types">Manage Phone Types</a></li>
                    </ul>

                    <div class="clearfix">&nbsp;</div>

                    <ul class="list-group">
                        <li class="list-group-item"><a href="Actors.aspx" title="Actors">Manage Actors</a></li>
                        <li class="list-group-item"><a href="Movies.aspx" title="Movies">Manage Movies</a></li>
                    </ul>

                    <div class="clearfix">&nbsp;</div>

                    <ul class="list-group">
                        <li class="list-group-item"><a href="Rentals.aspx" title="Rentals">Manage Rentals</a></li>
                    </ul>

                    <div class="clearfix">&nbsp;</div>

                    <ul class="list-group">
                        <li class="list-group-item"><a href="Members.aspx" title="Members">Manage Members</a></li>
                    </ul>
                </asp:PlaceHolder>

                <asp:PlaceHolder ID="phUserMenu" runat="server">
                    <ul class="list-group">
                        <li class="list-group-item"><a href="MyProfile.aspx" title="My Profile">My Profile</a></li>
                        <li class="list-group-item"><a href="MyAddressInfo.aspx" title="My Address Info">My Address Info</a></li>
                        <li class="list-group-item"><a href="MyPhoneInfo.aspx" title="My Phone Info">My Phone Info</a></li>
                        <li class="list-group-item"><a href="MySecurityInfo.aspx" title="My Security Info">My Security Info</a></li>
                    </ul>

                    <div class="clearfix">&nbsp;</div>

                    <ul class="list-group">
                        <li class="list-group-item"><a href="BrowseMovies.aspx" title="Browse Movies">Browse Movies</a></li>
                        <li class="list-group-item"><a href="MyRentals.aspx" title="My Rentals">My Rentals</a></li>
                    </ul>
                </asp:PlaceHolder>

                <div class="clearfix">&nbsp;</div>

                <div class="form-group">
                    <asp:Button ID="btnLogout" CssClass="btn btn-danger btn-sm" runat="server"
                        Text="Logout" ToolTip="Logout" OnClick="btnLogout_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
