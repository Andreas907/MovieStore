<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddPhoneType.aspx.cs" Inherits="MovieStore.Web.AddPhoneType" Async="true" %>

<asp:Content ID="cAddPhoneType" ContentPlaceHolderID="cphMain" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Add Phone Type</h1>

                <p>Please fill out all required fields and click save.</p>

                <asp:ValidationSummary ID="vsError" HeaderText="The following error(s) occurred:" runat="server" ShowSummary="true"
                    CssClass="alert alert-danger" DisplayMode="BulletList" /> 

                <div class="card">
                    <div class="card-header">
                        Phone Type Information
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <asp:Label ID="lblPhoneType" runat="server" Text="* Phone Type:" AssociatedControlID="tboxPhoneType" />

                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <span class="fa fa-book"></span>
                                    </span>
                                </div>
                                <asp:TextBox ID="tboxPhoneType" runat="server" CssClass="form-control" MaxLength="10" />
                                <ajaxToolkit:FilteredTextBoxExtender ID="ftboxePhoneType" TargetControlID="tboxPhoneType" runat="server"
                                     FilterMode="ValidChars" FilterType="LowercaseLetters, UppercaseLetters, Numbers, Custom" ValidChars=" " />
                            </div>
                            <asp:RegularExpressionValidator ID="revPhoneType" runat="server" ControlToValidate="tboxPhoneType"
                                Display="None" EnableClientScript="true" ErrorMessage="Invalid phone type." ValidationExpression="^.{1,10}$" 
                                CssClass="text-danger" SetFocusOnError="true" />
                            <asp:RequiredFieldValidator ID="rfvPhoneType" runat="server" ControlToValidate="tboxPhoneType" 
                                Display="None" EnableClientScript="true" ErrorMessage="Phone type is required." 
                                CssClass="text-danger" SetFocusOnError="true" />
                        </div>
                    </div>
                </div>

                <div class="clearfix">&nbsp;</div>

                <div class="form-group">
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CausesValidation="false" 
                        ToolTip="Cancel" CssClass="btn btn-dark btn-sm" OnClick="btnCancel_Click" />
                    <asp:Button ID="btnSave" runat="server" Text="Save" ToolTip="Save"
                        CssClass="btn btn-success btn-sm" OnClick="btnSave_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
