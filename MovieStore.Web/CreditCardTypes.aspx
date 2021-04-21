<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="CreditCardTypes.aspx.cs" Inherits="MovieStore.Web.CreditCardTypes" Async="true" %>

<asp:Content ID="cCreditCardTypes" ContentPlaceHolderID="cphMain" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Credit Card Types</h1>

                <p>Please review information below.</p>

                <asp:ListView ID="lvCreditCardTypes" runat="server" OnItemCommand="lvCreditCardTypes_ItemCommand" ItemPlaceholderID="ItemContainer" ClientIDMode="AutoID"
                    ItemType="MovieStore.Business.CreditCardType">
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
                                    <td colspan="4">
                                        <asp:LinkButton ID="lbtnAddCreditCardType" runat="server"
                                            Text="Add Credit Card Type" ToolTip="Add Credit Card Type" OnClick="lbtnAddCreditCardType_Click" />
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:Label ID="lblName" runat="server" Text='<%#: Item.Name %>' /></td>
                            <td>
                                <asp:LinkButton ID="lbtnEdit" runat="server" Text="Edit" ToolTip="Edit" CausesValidation="false"
                                    CommandName="EditCreditCardType" CommandArgument='<%#: Item.Id %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <p>No record has been added yet.</p>
                    </EmptyDataTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>
</asp:Content>
 