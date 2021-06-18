<%@ Page Title="" Async="true" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Error403.aspx.cs" Inherits="MovieStore.Web.Error403" %>

<asp:Content ID="cError403" ContentPlaceHolderID="cphMain" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>ERROR 403</h1>
                <p>You are not authorized to access this page. Please click continue!</p>

                <div class="form-group">
                    <asp:Button ID="btnContinue" runat="server" CssClass="btn btn-warning btn-sm" Text="Continue" 
                        ToolTip="Continue" OnClick="btnContinue_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
