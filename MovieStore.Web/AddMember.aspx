<%@ Page Title="" Async="true" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddMember.aspx.cs" Inherits="MovieStore.Web.AddMember" %>

<asp:Content ID="cAddMember" ContentPlaceHolderID="cphMain" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Add Member</h1>

                <p>Please fill out all required fields and click save.</p>

                <asp:ValidationSummary ID="vsError" HeaderText="The following error(s) occurred:" runat="server"
                    DisplayMode="BulletList" CssClass="alert alert-danger" />

                <div class="card">
                    <div class="card-header">
                        Member Information
                    </div>
                    <div class="card-body">
                        <!-- First Name -->
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

                        <!-- Middle Name -->
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

                        <!-- Last Name -->
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

                        <!-- Address 1 -->
                        <div class="form-group">
                            <asp:Label ID="lblAddress1" runat="server" AssociatedControlID="tboxAddress1" Text="* Address 1" />
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <span class="fa fa-address-book"></span>
                                    </span>
                                </div>
                                <asp:TextBox ID="tboxAddress1" runat="server" MaxLength="600" CssClass="form-control" />
                                <ajaxToolkit:FilteredTextBoxExtender ID="ftboxeAddress1" runat="server" FilterMode="ValidChars"
                                    ValidChars=" -#,." FilterType="LowercaseLetters, UppercaseLetters, Numbers, Custom"
                                    TargetControlID="tboxAddress1" />
                            </div>
                            <asp:RequiredFieldValidator ID="rfvAddress1" runat="server" ControlToValidate="tboxAddress1"
                                ErrorMessage="Address 1 is required." SetFocusOnError="true" EnableClientScript="true"
                                Display="None" />
                        </div>

                        <!-- Address 2 -->
                        <div class="form-group">
                            <asp:Label ID="lblAddress2" runat="server" AssociatedControlID="tboxAddress2" Text="Address 2" />
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <span class="fa fa-address-book"></span>
                                    </span>
                                </div>
                                <asp:TextBox ID="tboxAddress2" runat="server" MaxLength="100" CssClass="form-control" />
                                <ajaxToolkit:FilteredTextBoxExtender ID="ftboxeAddress2" runat="server" FilterMode="ValidChars"
                                    ValidChars=" -#,." FilterType="LowercaseLetters, UppercaseLetters, Numbers, Custom"
                                    TargetControlID="tboxAddress2" />
                            </div>
                        </div>

                        <!-- City -->
                        <div class="form-group">
                            <asp:Label ID="lblCity" runat="server"
                                AssociatedControlID="tboxCity" Text="* City" />
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <span class="fa fa-address-book"></span>
                                    </span>
                                </div>
                                <asp:TextBox ID="tboxCity" runat="server" MaxLength="150" CssClass="form-control" />
                                <ajaxToolkit:FilteredTextBoxExtender ID="ftboxeCity" runat="server" FilterMode="ValidChars"
                                    ValidChars=" " FilterType="LowercaseLetters, UppercaseLetters, Custom"
                                    TargetControlID="tboxCity" />
                            </div>
                            <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="tboxCity"
                                ErrorMessage="City is required." SetFocusOnError="true" EnableClientScript="true" Display="None" />
                        </div>

                        <!-- Zip Code -->
                        <div class="form-group">
                            <asp:Label ID="lblZipCode" runat="server"
                                AssociatedControlID="tboxZipCode" Text="* Zip Code" />
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <span class="fa fa-address-book"></span>
                                    </span>
                                </div>
                                <asp:TextBox ID="tboxZipCode" runat="server" MaxLength="5" CssClass="form-control" />
                                <ajaxToolkit:FilteredTextBoxExtender ID="ftboxZipCode" runat="server" FilterMode="ValidChars"
                                    ValidChars="0123456789" FilterType="Custom, Numbers"
                                    TargetControlID="tboxZipCode" />
                            </div>
                            <asp:RequiredFieldValidator ID="rfvZipCode" runat="server" ControlToValidate="tboxZipCode"
                                ErrorMessage="Zip code is required." SetFocusOnError="true" EnableClientScript="true" Display="None" />
                        </div>

                        <!-- State -->
                        <div class="form-group">
                            <asp:Label ID="lblState" runat="server" AssociatedControlID="ddlStates" Text="* State" />
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <span class="fa fa-address-book"></span>
                                    </span>
                                </div>
                                <asp:DropDownList ID="ddlStates" runat="server" CssClass="form-control">
                                    <asp:ListItem Value=""></asp:ListItem>
                                    <asp:ListItem Value="AL">Alabama</asp:ListItem>
                                    <asp:ListItem Value="AK">Alaska</asp:ListItem>
                                    <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                                    <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                                    <asp:ListItem Value="CA">California</asp:ListItem>
                                    <asp:ListItem Value="CO">Colorado</asp:ListItem>
                                    <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                                    <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
                                    <asp:ListItem Value="DE">Delaware</asp:ListItem>
                                    <asp:ListItem Value="FL">Florida</asp:ListItem>
                                    <asp:ListItem Value="GA">Georgia</asp:ListItem>
                                    <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                                    <asp:ListItem Value="ID">Idaho</asp:ListItem>
                                    <asp:ListItem Value="IL">Illinois</asp:ListItem>
                                    <asp:ListItem Value="IN">Indiana</asp:ListItem>
                                    <asp:ListItem Value="IA">Iowa</asp:ListItem>
                                    <asp:ListItem Value="KS">Kansas</asp:ListItem>
                                    <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                                    <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                                    <asp:ListItem Value="ME">Maine</asp:ListItem>
                                    <asp:ListItem Value="MD">Maryland</asp:ListItem>
                                    <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                                    <asp:ListItem Value="MI">Michigan</asp:ListItem>
                                    <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                                    <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                                    <asp:ListItem Value="MO">Missouri</asp:ListItem>
                                    <asp:ListItem Value="MT">Montana</asp:ListItem>
                                    <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                                    <asp:ListItem Value="NV">Nevada</asp:ListItem>
                                    <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                                    <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                                    <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                                    <asp:ListItem Value="NY">New York</asp:ListItem>
                                    <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                                    <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                                    <asp:ListItem Value="OH">Ohio</asp:ListItem>
                                    <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                                    <asp:ListItem Value="OR">Oregon</asp:ListItem>
                                    <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                                    <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                                    <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                                    <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                                    <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                                    <asp:ListItem Value="TX">Texas</asp:ListItem>
                                    <asp:ListItem Value="UT">Utah</asp:ListItem>
                                    <asp:ListItem Value="VT">Vermont</asp:ListItem>
                                    <asp:ListItem Value="VA">Virginia</asp:ListItem>
                                    <asp:ListItem Value="WA">Washington</asp:ListItem>
                                    <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                                    <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                                    <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvState" runat="server" ControlToValidate="ddlStates"
                                ErrorMessage="State is required." InitialValue="" SetFocusOnError="true"
                                EnableClientScript="true" Display="None" />
                        </div>

                        <!-- Phone Type -->
                        <div class="form-group">
                            <asp:Label ID="lblPhoneType" runat="server" AssociatedControlID="ddlPhoneTypes" Text="* Phone Type" />
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <span class="fa fa-phone"></span>
                                    </span>
                                </div>
                                <asp:DropDownList ID="ddlPhoneTypes" runat="server" DataTextField="Name" DataValueField="Id"
                                    CssClass="form-control" />
                            </div>
                            <asp:RequiredFieldValidator ID="rfvPhoneType" runat="server" ControlToValidate="ddlPhoneTypes"
                                ErrorMessage="Phone type is required." InitialValue="" SetFocusOnError="true"
                                EnableClientScript="true" Display="None" />
                        </div>

                        <!-- Phone Number -->
                        <div class="form-group">
                            <asp:Label ID="lblPhoneNumber" runat="server"
                                AssociatedControlID="tboxPhoneNumber" Text="* Phone Number" />
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <span class="fa fa-phone"></span>
                                    </span>
                                </div>
                                <asp:TextBox ID="tboxPhoneNumber" runat="server" MaxLength="12" CssClass="form-control" />
                                <ajaxToolkit:MaskedEditExtender ID="meePhoneNumber" runat="server" TargetControlID="tboxPhoneNumber"
                                    AcceptNegative="None" MaskType="Number"
                                    InputDirection="LeftToRight" ClearMaskOnLostFocus="false" Mask="999-999-9999" />
                                <ajaxToolkit:FilteredTextBoxExtender ID="ftboxePhoneNumber" runat="server" FilterMode="ValidChars"
                                    ValidChars="0123456789-_" FilterType="Custom, Numbers"
                                    TargetControlID="tboxPhoneNumber" />
                            </div>
                            <asp:RequiredFieldValidator ID="rfvPhoneNumber" InitialValue="___-___-____" runat="server"
                                ControlToValidate="tboxPhoneNumber"
                                ErrorMessage="Phone is required." SetFocusOnError="true"
                                EnableClientScript="true" Display="None" />
                        </div>

                        <!-- Role -->
                        <div class="form-group">
                            <asp:Label ID="lblRole" runat="server" AssociatedControlID="ddlRoles" Text="* Role" />
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <span class="fa fa-key"></span>
                                    </span>
                                </div>
                                <asp:DropDownList ID="ddlRoles" runat="server" DataTextField="Name" DataValueField="Id"
                                    CssClass="form-control" />
                            </div>
                            <asp:RequiredFieldValidator ID="rfvRoles" runat="server" ControlToValidate="ddlRoles"
                                ErrorMessage="Role is required." InitialValue="" SetFocusOnError="true"
                                EnableClientScript="true" Display="None" />
                        </div>

                        <!-- Profile Picture -->
                        <div class="form-group">
                            <asp:Label ID="lblProfilePicture" runat="server"
                                AssociatedControlID="fupProfilePicture" Text="* Profile Picture" />
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <span class="fa fa-image"></span>
                                    </span>
                                </div>
                                <asp:FileUpload ID="fupProfilePicture" runat="server" AllowMultiple="false" CssClass="form-control" style="height:auto;" />
                            </div>
                            <asp:RequiredFieldValidator ID="rfvProfilePicture" runat="server" ControlToValidate="fupProfilePicture"
                                ErrorMessage="Profile picture is required." SetFocusOnError="true"
                                EnableClientScript="true" Display="None" />
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
