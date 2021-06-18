<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="PaymentTypes.aspx.cs" Inherits="MovieStore.Web.PaymentTypes" Async="true" %>

<asp:Content ID="cPaymentType" ContentPlaceHolderID="cphMain" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Payment Types</h1>

                <p>Please review information below.</p>

                <asp:ListView runat="server" ID="lvPaymentTypes" ClientIDMode="AutoID" OnItemCommand="lvPaymentTypes_ItemCommand" 
                    ItemPlaceholderID="ItemContainer" ItemType="MovieStore.Business.PaymentType">
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
                                        <asp:LinkButton ID="lbtnAddPaymentType" runat="server" 
                                            Text="Add Payment Type" ToolTip="Add Payment Type" 
                                            OnClick="lbtnAddPaymentType_Click" />
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><asp:Label ID="lblName" runat="server" Text='<%#: Item.Name %>' /></td>
                            <td><asp:LinkButton ID="lbtnEdit" runat="server" Text="Edit" 
                                ToolTip="Edit" CausesValidation="false" CommandName="EditPaymentType" CommandArgument='<%#: Item.Id %>' /></td>
                        </tr>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <p>No record has been added yet.</p>
                        <asp:LinkButton ID="lbtnAddPaymentType" runat="server" 
                                Text="Add Payment Type" ToolTip="Add Payment Type" OnClick="lbtnAddPaymentType_Click" />
                    </EmptyDataTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>
</asp:Content>
