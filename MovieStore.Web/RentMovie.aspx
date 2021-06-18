<%@ Page Title="" Async="true" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="RentMovie.aspx.cs" Inherits="MovieStore.Web.RentMovie" %>

<asp:Content ID="cRentMovie" ContentPlaceHolderID="cphMain" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Rent Movie</h1>

                <p>Please review information below and click rent.</p>

                <asp:ValidationSummary ID="vsError" HeaderText="The following error(s) occurred:" runat="server"
                    DisplayMode="BulletList" CssClass="alert alert-danger" />

                <div class="card">
                    <div class="card-header">
                        Movie Information
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <strong>Title</strong>:
                            <asp:Label ID="lblTitle" runat="server" />
                        </div>
                        <div class="form-group">
                            <strong>Rating</strong>:
                            <asp:Label ID="lblRating" runat="server" />&nbsp;star(s)
                        </div>
                        <div class="form-group">
                            <strong>Release Year</strong>:
                            <asp:Label ID="lblReleaseYear" runat="server" />
                        </div>
                        <div class="form-group">
                            <strong>Cover</strong>
                            <div class="input-group mb-3">
                                <asp:Image ID="imgCover" runat="server" CssClass="img-thumbnail" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="clearfix">&nbsp;</div>

                <div class="card">
                    <div class="card-header">
                        Payment Information
                    </div>
                    <div class="card-body">
                        <span class="text-danger">IT IS NOT REQUIRED FOR FINAL BUT SOMETIMES IN YOUR SPARE TIME TRY TO APPLY WHAT YOU LEARNED AND FINISH THIS SECTION</span>
                    </div>
                </div>
                                
                <div class="clearfix">&nbsp;</div>

                <div class="form-group">
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" ToolTip="Cancel" CausesValidation="false"
                        CssClass="btn btn-dark btn-sm" OnClick="btnCancel_Click" />
                    <asp:Button ID="btnRent" runat="server" Text="Rent" ToolTip="Rent" OnClick="btnRent_Click"
                        CssClass="btn btn-success btn-sm" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
