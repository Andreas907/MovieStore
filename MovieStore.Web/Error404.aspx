<%@ Page Title="" Async="true" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Error404.aspx.cs" Inherits="MovieStore.Web.Error404" %>

<asp:Content ID="cError404" ContentPlaceHolderID="cphMain" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>ERROR 404</h1>
                <p>This page does not exist. Please click continue! If you still experience the problem, please contact your support!</p>

                <div class="form-group">
                    <asp:Button ID="btnContinue" runat="server" CssClass="btn btn-warning btn-sm" Text="Continue" ToolTip="Continue" OnClick="btnContinue_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
