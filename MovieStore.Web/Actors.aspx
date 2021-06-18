<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Actors.aspx.cs" Inherits="MovieStore.Web.Actors" Async="true" %>

<asp:Content ID="cActors" ContentPlaceHolderID="cphMain" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Actors</h1>

                <p>Please review information below.</p>

                <div class="card">
                    <div class="card-header">
                        Actor Information
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <asp:Label ID="lblFirstName" runat="server" AssociatedControlID="tboxFirstName" Text="First Name" />
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
                            <asp:Label ID="lblLastName" runat="server" AssociatedControlID="tboxLastName" Text="Last Name" />
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
                        </div>
                    </div>
                </div>

                <div class="clearfix">&nbsp;</div>

                <div class="form-group">
                    <asp:Button ID="btnClear" runat="server" Text="Clear" ToolTip="Clear"
                        CausesValidation="false" CssClass="btn btn-dark btn-sm" OnClick="btnClear_Click" />
                    <asp:Button ID="btnSearch" runat="server" Text="Search" ToolTip="Search" CausesValidation="false"
                        CssClass="btn btn-success btn-sm" OnClick="btnSearch_Click" />
                </div>

                <div class="clearfix">&nbsp;</div>

                <asp:ListView ID="lvActors" runat="server" ItemPlaceholderID="ItemContainer" OnItemCommand="lvActors_ItemCommand"
                    ClientIDMode="AutoID" ItemType="MovieStore.Business.Actor">
                    <LayoutTemplate>
                        <div id="data" class="bootstrap-replace-table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>First Name</th>
                                        <th>Middle Name</th>
                                        <th>Last Name</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:PlaceHolder ID="ItemContainer" runat="server" />
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="4">
                                            <asp:LinkButton ID="lbtnAddActor" runat="server" Text="Add Actor"
                                                ToolTip="Add Actor" OnClick="lbtnAddActor_Click" />
                                        </td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td data-label="First Name">
                                <asp:Label ID="lblFirstName" runat="server" Text='<%#: Item.FirstName %>' />
                            </td>
                            <td data-label="Middle Name">
                                <asp:Label ID="lblMiddleName" runat="server" Text='<%#: Item.MiddleName %>' />
                            </td>
                            <td data-label="Last Name">
                                <asp:Label ID="lblLastName" runat="server" Text='<%#: Item.LastName %>' />
                            </td>
                            <td data-label="Actions">
                                <asp:LinkButton ID="lbtnEdit" runat="server" Text="Edit" ToolTip="Edit"
                                    CausesValidation="false" CommandName="EditActor" CommandArgument='<%#: Item.Id %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <p>No record has been added yet.</p>
                        <asp:LinkButton ID="lbtnAddActor" runat="server" Text="Add Actor"
                            ToolTip="Add Actor" OnClick="lbtnAddActor_Click" />
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
