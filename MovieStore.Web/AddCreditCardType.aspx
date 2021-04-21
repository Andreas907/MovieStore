<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddCreditCardType.aspx.cs" Inherits="MovieStore.Web.AddCreditCardType" Async="true" %>

<asp:Content ID="cAddCreditCardType" ContentPlaceHolderID="cphMain" runat="server">
     <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Add Credit Card Type</h1>

                <p>Please fill out all required fileds and click save.</p>

                <asp:ValidationSummary ID="vsError" HeaderText="The following error(s) occurred:"
                    runat="server" ShowSummary="true" DisplayMode="BulletList" CssClass="alert alert-danger" />

                <div class="card">
                    <div class="card-header">
                        Credit Card Type Information
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <asp:Label ID="lblCreditCardType" runat="server" Text="* Credit Card Type" AssociatedControlID="tboxCreditCardType" />
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <span class="fa fa-book"></span>
                                    </span>
                                </div>
                                <asp:TextBox ID="tboxCreditCardType" runat="server" CssClass="form-control" MaxLength="20" />
                                <ajaxToolkit:FilteredTextBoxExtender ID="ftbeCreditCardType" runat="server" FilterMode="ValidChars" ValidChars=" "
                                    FilterType="LowercaseLetters, UppercaseLetters, Numbers, Custom" TargetControlID="tboxCreditCardType" />
                            </div>
                            <asp:RequiredFieldValidator ID="rfvCreditCardType" runat="server" ControlToValidate="tboxCreditCardType"
                                ErrorMessage="Name is required." CssClass="text-danger" SetFocusOnError="true" EnableClientScript="true" Display="None" />
                        </div>
                    </div>
                </div>

                <div class="clearfix">&nbsp;</div>

                <div class="form-group">
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" ToolTip="Cancel" CausesValidation="false" OnClick="btnCancel_Click"
                        CssClass="btn btn-dark btn-sm" />
                    <asp:Button ID="btnSave" runat="server" Text="Save" ToolTip="Save" OnClick="btnSave_Click" CssClass="btn btn-success btn-sm" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
