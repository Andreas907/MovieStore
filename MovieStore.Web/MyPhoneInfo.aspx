<%@ Page Title="" Async="true" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="MyPhoneInfo.aspx.cs" Inherits="MovieStore.Web.MyPhoneInfo" %>

<asp:Content ID="cMyPhoneInfo" ContentPlaceHolderID="cphMain" runat="server">
    <asp:UpdatePanel ID="upnlPhoneInfo" runat="server">
        <ContentTemplate>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1>My Phone Information</h1>

                        <p>Please review information below.</p>

                        <asp:ListView ID="lvPhones" runat="server" ItemPlaceholderID="ItemContainer"
                            ClientIDMode="AutoID" OnItemCommand="lvPhones_ItemCommand" ItemType="MovieStore.Business.Phone">
                            <LayoutTemplate>
                                <div id="data" class="bootstrap-replace-table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Number</th>
                                                <th>Type</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:PlaceHolder ID="ItemContainer" runat="server" />
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <td colspan="3">
                                                    <asp:LinkButton ID="lbtnAddPhone" runat="server"
                                                        Text="Add Phone" ToolTip="Add Phone" OnClick="lbtnAddPhone_Click" />
                                                </td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td data-label="Number">
                                        <asp:Label ID="lblNumber" runat="server" Text='<%#: Item.PhoneNumber %>' />
                                    </td>
                                    <td data-label="Type">
                                        <asp:Label ID="lblType" runat="server" Text='<%#: Item.PhoneType %>' />
                                    </td>
                                    <td data-label="Actions">
                                        <asp:LinkButton ID="lbtnEditPhone" runat="server" Text="Edit" CausesValidation="false" ToolTip="Edit"
                                            CommandArgument='<%#: Item.Id %>' CommandName="EditPhone" />
                                        |
                                        <asp:LinkButton ID="lbtnDeletePhone" runat="server" CausesValidation="false" Text="Delete" ToolTip="Delete"
                                            CommandArgument='<%#: Item.Id %>' CommandName="DeletePhone" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <p>No record has been added yet.</p>
                                <asp:LinkButton ID="lbtnAddPhone" runat="server"
                                    Text="Add Phone" ToolTip="Add Phone" OnClick="lbtnAddPhone_Click" />
                            </EmptyDataTemplate>
                        </asp:ListView>

                        <asp:Panel ID="pnlAddEditPhone" runat="server" Visible="false" CssClass="card">
                            <div class="card-header">
                                Phone Information
                            </div>
                            <div class="card-body">
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

                                <div class="clearfix">&nbsp;</div>
                                <div class="form-group">
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" ToolTip="Cancel" CausesValidation="false"
                                        OnClick="btnCancel_Click" CssClass="btn btn-dark btn-sm" />
                                    <asp:Button ID="btnSave" runat="server" Text="Save" ToolTip="Save" OnClick="btnSave_Click"
                                        CssClass="btn btn-success btn-sm" />
                                </div>
                            </div>
                        </asp:Panel>

                        <div class="clearfix">&nbsp;</div>

                        <div class="form-group">
                            <asp:Button ID="btnReturn" runat="server" Text="Return" ToolTip="Return" CausesValidation="false"
                                OnClick="btnReturn_Click" CssClass="btn btn-primary btn-sm" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Panel CssClass="modal fade" runat="server" ID="pnlDeleteModal" TabIndex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <asp:UpdatePanel ID="upnlDeleteModal" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="modal-header">
                            <h4 class="modal-title" id="deleteModalLabel">Delete Phone
                            </h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <p>Are you sure you want to delete this phone?</p>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" ToolTip="Delete" CausesValidation="false"
                                OnClick="btnDelete_Click" CssClass="btn btn-danger btn-sm" />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
