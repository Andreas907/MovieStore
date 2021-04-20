<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="MovieStore.Web.Categories" Async="true" %>

<asp:Content ID="cCategories" ContentPlaceHolderID="cphMain" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Categories</h1>

                <p>Please review information below.</p>

                <asp:ListView ID="lvCategories" runat="server" OnItemCommand="lvCategories_ItemCommand" ItemPlaceholderID="ItemContainer" ClientIDMode="AutoID" 
                    ItemType="MovieStore.Business.Category">
                    <LayoutTemplate>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Created On</th>
                                    <th>Updated On</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:PlaceHolder ID="ItemContainer" runat="server" />
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="4">
                                        <asp:LinkButton ID="lbtnAddCategory" runat="server" 
                                            Text="Add Category" ToolTip="Add Category" OnClick="lbtnAddCategory_Click" />
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><asp:Label ID="lblName" runat="server" Text='<%#: Item.Name %>' /></td>
                            <td><asp:Label ID="lblDateCreated" runat="server" Text='<%#: Item.DateCreated.ToString("MM/dd/yyyy") %>' /></td>
                            <td><asp:Label ID="lblDateUpdated" runat="server" Text='<%#: Item.DateUpdated.HasValue ? Item.DateUpdated.Value.ToString("MM/dd/yyyy") : "" %>' /></td>
                            <td>
                                <asp:LinkButton ID="lbtnEdit" runat="server" Text="Edit" ToolTip="Edit" CausesValidation="false" 
                                        CommandName="EditCategory" CommandArgument='<%#: Item.Id %>' />
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
