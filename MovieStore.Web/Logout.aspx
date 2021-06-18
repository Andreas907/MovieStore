<%@ Page Title="" Async="true" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="MovieStore.Web.Logout" %>

<asp:Content ID="cLogout" ContentPlaceHolderID="cphMain" runat="server">
    <div class="container">
         <div class="row">
            <div class="col-md-12">
                <h1>YOU ARE SUCCESSFULLY LOGGED OUT!</h1>
                <p>Please click continue!</p>

                <div class="form-group">
                    <asp:Button ID="btnContinue" runat="server" CssClass="btn btn-warning btn-sm" Text="Continue" ToolTip="Continue" OnClick="btnContinue_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
