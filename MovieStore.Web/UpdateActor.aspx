<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="UpdateActor.aspx.cs" Inherits="MovieStore.Web.UpdateActor" Async="true" %>

<asp:Content ID="cUpdateActor" ContentPlaceHolderID="cphMain" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Update Actor</h1>

                <p>Please fill out all required fields and click update.</p>

                <asp:ValidationSummary ID="vsError" HeaderText="The following error(s) occurred:" runat="server"
                    DisplayMode="BulletList" CssClass="alert alert-danger" />

                <div class="card">
                    <div class="card-header">
                        Actor Information
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <asp:Label ID="lblFirstName" runat="server" AssociatedControlID="tboxFirstName" Text="* First Name" />
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <span class="fa fa-user"></span>
                                    </span>
                                </div>
                                <asp:TextBox ID="tboxFirstName" MaxLength="30" runat="server" CssClass="form-control" />
                                <ajaxToolkit:FilteredTextBoxExtender ID="ftboxeFirstName" runat="server" FilterMode="ValidChars"
                                    ValidChars=" " FilterType="LowercaseLetters, UppercaseLetters, Custom"
                                    TargetControlID="tboxFirstName" />
                            </div>
                            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="tboxFirstName"
                                ErrorMessage="First name is required." SetFocusOnError="true" EnableClientScript="true"
                                Display="None" />
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblMiddleName" runat="server" AssociatedControlID="tboxMiddleName" Text="Middle Name" />
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <span class="fa fa-user"></span>
                                    </span>
                                </div>
                                <asp:TextBox ID="tboxMiddleName" MaxLength="30" runat="server" CssClass="form-control" />
                                <ajaxToolkit:FilteredTextBoxExtender ID="ftboxeMiddleName" runat="server" FilterMode="ValidChars"
                                    ValidChars=" " FilterType="LowercaseLetters, UppercaseLetters, Custom"
                                    TargetControlID="tboxMiddleName" />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblLastName" runat="server" AssociatedControlID="tboxLastName" Text="* Last Name" />
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <span class="fa fa-user"></span>
                                    </span>
                                </div>
                                <asp:TextBox ID="tboxLastName" MaxLength="50" runat="server" CssClass="form-control" />
                                <ajaxToolkit:FilteredTextBoxExtender ID="ftboxeLastName" runat="server" FilterMode="ValidChars"
                                    ValidChars=" " FilterType="LowercaseLetters, UppercaseLetters, Custom"
                                    TargetControlID="tboxLastName" />
                            </div>
                            <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="tboxLastName"
                                Display="None" ErrorMessage="Last name is required." EnableClientScript="true" SetFocusOnError="true" />
                        </div>
                    </div>
                </div>

                <div class="clearfix">&nbsp;</div>

                <div class="form-group">
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" ToolTip="Cancel" CausesValidation="false"
                        CssClass="btn btn-dark btn-sm" OnClick="btnCancel_Click" />
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" ToolTip="Update" OnClick="btnUpdate_Click"
                        CssClass="btn btn-success btn-sm" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
