<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="Members.aspx.cs" Inherits="MovieStore.Web.Members" Async="true" %>

<asp:Content ID="cMembers" ContentPlaceHolderID="cphMain" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Members</h1>

                <p>Please review information below.</p>

                <div class="card">
                    <div class="card-header">
                        Member Information
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <asp:Label ID="lblFirstName" runat="server" 
                                AssociatedControlID="tboxFirstName" Text="First Name" />
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
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblMiddleName" runat="server" 
                                AssociatedControlID="tboxMiddleName" Text="Middle Name" />
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
                            <asp:Label ID="lblLastName" runat="server" 
                                AssociatedControlID="tboxLastName" Text="Last Name" />
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
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblCity" runat="server" 
                                AssociatedControlID="tboxCity" Text="City" />
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
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblZipCode" runat="server" 
                                AssociatedControlID="tboxZipCode" Text="Zip Code" />
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
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblState" runat="server" AssociatedControlID="ddlStates" Text="State" />
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
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblActive" runat="server" AssociatedControlID="rbtnlActive" Text="Active" />
                            <asp:RadioButtonList ID="rbtnlActive" runat="server">
                                <asp:ListItem Value="No">&nbsp;No</asp:ListItem>
                                <asp:ListItem Value="Yes" Selected="true">&nbsp;Yes</asp:ListItem>
                            </asp:RadioButtonList>
                        </div> 
                        
                        <div class="form-group">
                            <asp:Label ID="lblRole" runat="server" AssociatedControlID="ddlRoles" Text="Role" />
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <span class="fa fa-lock"></span>
                                    </span>
                                </div>
                                <asp:DropDownList ID="ddlRoles" runat="server" 
                                    CssClass="form-control" DataTextField="Name" DataValueField="Id" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="clearfix">&nbsp;</div>

                <div class="form-group">
                    <asp:Button ID="btnClear" runat="server" Text="Clear" ToolTip="Clear" CausesValidation="false"
                        CssClass="btn btn-dark btn-sm" OnClick="btnClear_Click" />
                    <asp:Button ID="btnSearch" runat="server" Text="Search" ToolTip="Search" 
                        CssClass="btn btn-success btn-sm" OnClick="btnSearch_Click" />
                </div>

                <div class="clearfix">&nbsp;</div>

                <asp:ListView ID="lvMembers" runat="server" OnItemCommand="lvMembers_ItemCommand" ItemPlaceholderID="ItemContainer" ClientIDMode="AutoID"
                     ItemType="MovieStore.Business.Member">
                    <LayoutTemplate>
                        <div id="data" class="bootstrap-replace-table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Profile Picture</th>
                                        <th>Name</th>
                                        <th>Phone</th>
                                        <th>Address</th>
                                        <th>Active</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:PlaceHolder ID="ItemContainer" runat="server" />
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="6">
                                           <asp:LinkButton ID="lbtnAddMember" runat="server" Text="Add Member"
                                                 ToolTip="Add Member" OnClick="lbtnAddMember_Click" />
                                        </td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td data-label="Profile Picture">
                                <asp:Image ID="imgProfilePicture" CssClass="img-thumbnail" AlternateText='<%#: Item.FirstName +  
                                        (string.IsNullOrEmpty(Item.MiddleName) ? " " : " " + Item.MiddleName + " ") + Item.LastName %>' runat="server" ImageUrl='<%#: Item.ProfilePicture != null ? "data:image;base64," + Convert.ToBase64String(Item.ProfilePicture) : "#" %>' />
                            </td>
                            <td data-label="Name">
                                <asp:Label ID="lblName" runat="server" 
                                    Text='<%#: Item.FirstName +  
                                        (string.IsNullOrEmpty(Item.MiddleName) ? " " : " " + Item.MiddleName + " ") + Item.LastName %>' />
                            </td>
                            <td data-label="Phone">
                                <asp:Label ID="lblPhone" runat="server" Text='<%#: (Item.Phones != null && Item.Phones.Count > 0) ?
                                                             Item.Phones.FirstOrDefault().PhoneNumber : "" %>' />
                            </td>
                            <td data-label="Address">
                                <asp:Label ID="lblAddress" runat="server" Text='<%# Item.Address.AddressLine1 + "<br />" +
                                               (string.IsNullOrEmpty(Item.Address.AddressLine2) ? "" : Item.Address.AddressLine2 + "<br />") +
                                               Item.Address.City + ", " + Item.Address.State + "<br />" + Item.Address.ZipCode %>' />
                            </td>
                            <td data-label="Active">
                                <asp:Label ID="lblActive" runat="server" Text='<%#: (Item.IsActive == false ? "No" : "Yes") %>' />
                            </td>
                            <td data-label="Actions">
                                <asp:LinkButton ID="lbtnUpdateBasicInfo" runat="server" Text="Update Basic Info" ToolTip="Update Basic Info"
                                     CommandName="UpdateInfo" CausesValidation="false" CommandArgument='<%#: Item.Id %>' />
                                |
                                <asp:LinkButton ID="lbtnUpdatePhoneInfo" runat="server" Text="Phone Info" ToolTip="Update Phone Info"
                                     CommandName="UpdatePhoneInfo" CausesValidation="false" CommandArgument='<%#: Item.Id %>' />
                                |
                                <asp:LinkButton ID="lbtnUpdateSecurityInfo" runat="server" Text="Security Info" ToolTip="Update Security Info"
                                     CommandName="UpdateSecurityInfo" CausesValidation="false" CommandArgument='<%#: Item.Id %>' />
                                |
                                <asp:LinkButton ID="lbtnUpdateAddressInfo" runat="server" Text="Address Info" ToolTip="Update Address Info"
                                     CommandName="UpdateAddressInfo" CausesValidation="false" CommandArgument='<%#: Item.Id %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <p>No record has been added yet.</p>
                        <asp:LinkButton ID="lbtnAddMember" runat="server" Text="Add Member"
                                                 ToolTip="Add Member" OnClick="lbtnAddMember_Click" />
                    </EmptyDataTemplate>
                </asp:ListView>

                 <div class="clearfix">&nbsp;</div>

                <div class="form-group">
                    <asp:Button ID="btnReturn" runat="server" Text="Return" ToolTip="Return" CausesValidation="false"
                        CssClass="btn btn-primary btn-sm" OnClick="btnReturn_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
