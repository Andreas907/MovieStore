<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="MovieStore.Web.Error" Async="true" %>

<asp:Content ID="cError" ContentPlaceHolderID="cphMain" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>ERROR</h1>
                <p>System error occurred. Please click continue! If you still experience the problem, please contact your support!</p>

                <p><asp:Label ID="lblErrorMessages" runat="server" /></p>

                <div class="form-group">
                    <asp:Button ID="btnContinue" runat="server" CssClass="btn btn-warning btn-sm" Text="Continue" ToolTip="Continue" OnClick="btnContinue_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
