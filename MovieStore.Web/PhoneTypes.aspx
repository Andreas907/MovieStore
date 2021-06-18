<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="PhoneTypes.aspx.cs" Inherits="MovieStore.Web.PhoneTypes" Async="true" %>

<asp:Content ID="cPhoneTypes" ContentPlaceHolderID="cphMain" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Phone Types</h1>

                <p>Please review information below.</p>

                <asp:ListView runat="server" ID="lvPhoneTypes" ClientIDMode="AutoID" OnItemCommand="lvPhoneTypes_ItemCommand" 
                    ItemPlaceholderID="ItemContainer" ItemType="MovieStore.Business.PhoneType">
                    <LayoutTemplate>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:PlaceHolder ID="ItemContainer" runat="server" />
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="2">
                                        <asp:LinkButton ID="lbtnAddPhoneType" runat="server" 
                                            Text="Add Phone Type" ToolTip="Add Phone Type" OnClick="lbtnAddPhoneType_Click" />
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><asp:Label ID="lblName" runat="server" Text='<%#: Item.Name %>' /></td>
                            <td><asp:LinkButton ID="lbtnEdit" runat="server" Text="Edit" 
                                ToolTip="Edit" CausesValidation="false" CommandName="EditPhoneType" CommandArgument='<%#: Item.Id %>' /></td>
                        </tr>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <p>No record has been added yet.</p>
                        <asp:LinkButton ID="lbtnAddPhoneType" runat="server" 
                                Text="Add Phone Type" ToolTip="Add Phone Type" OnClick="lbtnAddPhoneType_Click" />
                    </EmptyDataTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>
</asp:Content>
