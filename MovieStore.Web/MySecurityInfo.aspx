<%@ Page Title="" Async="true" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="MySecurityInfo.aspx.cs" Inherits="MovieStore.Web.MySecurityInfo" %>

<asp:Content ID="cMySecurityInfo" ContentPlaceHolderID="cphMain" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>My Security Information</h1>

                <p>Please fill out all required fields and click save.</p>

                <asp:ValidationSummary ID="vsError" HeaderText="The following error(s) occurred:" runat="server"
                    DisplayMode="BulletList" CssClass="alert alert-danger" />

                <div class="card">
                    <div class="card-header">
                        Security Information
                    </div>
                    <div class="card-body">
                        <!-- Username -->
                        <div class="form-group">
                            <asp:Label ID="lblUsername" runat="server" AssociatedControlID="tboxUsername" Text="* Username" />
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <span class="fa fa-user"></span>
                                    </span>
                                </div>
                                <asp:TextBox ID="tboxUsername" runat="server" MaxLength="30" CssClass="form-control" />
                                <ajaxToolkit:FilteredTextBoxExtender ID="ftboxeUsername" runat="server" FilterMode="ValidChars"
                                    ValidChars=" _-!?#$%&<>()*" FilterType="LowercaseLetters, UppercaseLetters, Numbers, Custom"
                                    TargetControlID="tboxUsername" />
                            </div>
                            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="tboxUsername"
                                ErrorMessage="Username is required." SetFocusOnError="true" EnableClientScript="true"
                                Display="None" />
                        </div>

                        <!-- Password -->
                        <div class="form-group">
                            <asp:Label ID="lblPassword" runat="server" AssociatedControlID="tboxPassword" Text="* Password" />
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <span class="fa fa-lock"></span>
                                    </span>
                                </div>
                                <asp:TextBox ID="tboxPassword" TextMode="Password" runat="server" MaxLength="30" CssClass="form-control" />
                                <ajaxToolkit:FilteredTextBoxExtender ID="ftboxePassword" runat="server" FilterMode="ValidChars"
                                    ValidChars=" !#@$%&'*+-/=?^_`{|}~." FilterType="LowercaseLetters, UppercaseLetters, Numbers, Custom"
                                    TargetControlID="tboxPassword" />
                            </div>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="tboxPassword"
                                ErrorMessage="Password is required." SetFocusOnError="true" EnableClientScript="true"
                                Display="None" />
                        </div>
                    </div>
                </div>

                <div class="clearfix">&nbsp;</div>

                <div class="form-group">
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" ToolTip="Cancel" CausesValidation="false"
                        OnClick="btnCancel_Click" CssClass="btn btn-dark btn-sm" />
                    <asp:Button ID="btnSave" runat="server" Text="Save" ToolTip="Save"
                        OnClick="btnSave_Click" CssClass="btn btn-success btn-sm" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
