<%@ Page Title="" Async="true" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="UpdateMember.aspx.cs" Inherits="MovieStore.Web.UpdateMember" %>

<asp:Content ID="cUpdateMember" ContentPlaceHolderID="cphMain" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Update Member</h1>

                <p>Please review all of the information below and click save.</p>

                <asp:ValidationSummary ID="vsError" HeaderText="The following error(s) occurred:" runat="server"
                    DisplayMode="BulletList" CssClass="alert alert-danger" />

                <div class="card">
                    <div class="card-header">
                        Member Information
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
                                <asp:TextBox ID="tboxFirstName" runat="server" MaxLength="30" CssClass="form-control" />
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
                                <asp:TextBox ID="tboxMiddleName" runat="server" MaxLength="30" CssClass="form-control" />
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
                                <asp:TextBox ID="tboxLastName" runat="server" MaxLength="50" CssClass="form-control" />
                                <ajaxToolkit:FilteredTextBoxExtender ID="ftboxeLastName" runat="server" FilterMode="ValidChars"
                                    ValidChars=" " FilterType="LowercaseLetters, UppercaseLetters, Custom"
                                    TargetControlID="tboxLastName" />
                            </div>
                            <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="tboxLastName"
                                ErrorMessage="Last name is required." SetFocusOnError="true" EnableClientScript="true"
                                Display="None" />
                        </div>


                        <div class="form-group">
                            <asp:Label ID="lblProfilePicture" runat="server"
                                AssociatedControlID="fupProfilePicture" Text="Profile Picture" />
                            <div class="input-group mb-3">
                                <asp:Image ID="imgProfilePicture" runat="server" CssClass="img-thumbnail" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <span class="fa fa-image"></span>
                                    </span>
                                </div>
                                <asp:FileUpload ID="fupProfilePicture" runat="server" AllowMultiple="false" CssClass="form-control" style="height:auto;" />
                            </div>
                            <asp:CustomValidator ID="cvProfilePicture" runat="server" ControlToValidate="fupProfilePicture"
                                ErrorMessage="Invalid picture selection." Display="None" SetFocusOnError="true"
                                OnServerValidate="cvProfilePicture_ServerValidate" />
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
