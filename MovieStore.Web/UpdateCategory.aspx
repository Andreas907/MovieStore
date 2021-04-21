<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="UpdateCategory.aspx.cs" Inherits="MovieStore.Web.UpdateCategory" Async="true" %>

<asp:Content ID="cUpdateCategory" ContentPlaceHolderID="cphMain" runat="server">
     <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Update Movie Category</h1>

                <p>Please fill out all required fileds and click save.</p>

                <asp:ValidationSummary ID="vsError" HeaderText="The following error(s) occurred:"
                    runat="server" ShowSummary="true" DisplayMode="BulletList" CssClass="alert alert-danger" />

                <div class="card">
                    <div class="card-header">
                        Category Information
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <asp:Label ID="lblCategoryName" runat="server" Text="* Category Name" AssociatedControlID="tboxCategoryName" />
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <span class="fa fa-book"></span>
                                    </span>
                                </div>
                                <asp:TextBox ID="tboxCategoryName" runat="server" CssClass="form-control" MaxLength="35" />
                                <ajaxToolkit:FilteredTextBoxExtender ID="ftbeCategoryName" runat="server" FilterMode="ValidChars" ValidChars=" "
                                    FilterType="LowercaseLetters, UppercaseLetters, Numbers, Custom" TargetControlID="tboxCategoryName" />
                            </div>
                            <asp:RequiredFieldValidator ID="rfvCategoryName" runat="server" ControlToValidate="tboxCategoryName"
                                ErrorMessage="Name is required." CssClass="text-danger" SetFocusOnError="true" EnableClientScript="true" Display="None" />
                        </div>
                    </div>
                </div>

                <div class="clearfix">&nbsp;</div>

                <div class="form-group">
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" ToolTip="Cancel" CausesValidation="false" OnClick="btnCancel_Click"
                        CssClass="btn btn-dark btn-sm" />
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" ToolTip="Update" OnClick="btnUpdate_Click" CssClass="btn btn-success btn-sm" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
