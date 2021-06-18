<%@ Page Title="" Async="true" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Movies.aspx.cs" Inherits="MovieStore.Web.Movies" %>

<asp:Content ID="cMovies" ContentPlaceHolderID="cphMain" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Movies</h1>

                <p>Please review information below.</p>

                <div class="card">
                    <div class="card-header">
                        Movie Information
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <asp:Label ID="lblTitle" runat="server" AssociatedControlID="tboxTitle" Text="Title" />
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <span class="fa fa-briefcase"></span>
                                    </span>
                                </div>
                                <asp:TextBox ID="tboxTitle" MaxLength="200" runat="server" CssClass="form-control" />
                                <ajaxToolkit:FilteredTextBoxExtender ID="ftboxeTitle" runat="server" FilterMode="ValidChars"
                                    ValidChars=" ,.!?:[]{}<>_-" FilterType="LowercaseLetters, UppercaseLetters, Custom"
                                    TargetControlID="tboxTitle" />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblRating" runat="server" AssociatedControlID="ddlRating" Text="Rating" />
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <span class="fa fa-star"></span>
                                    </span>
                                </div>
                                <asp:DropDownList ID="ddlRating" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="0" Text="" />
                                    <asp:ListItem Value="1" Text="1" />
                                    <asp:ListItem Value="2" Text="2" />
                                    <asp:ListItem Value="3" Text="3" />
                                    <asp:ListItem Value="4" Text="4" />
                                    <asp:ListItem Value="5" Text="5" />
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblReleaseYear" runat="server" AssociatedControlID="tboxReleaseYear" Text="Release Year" />
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <span class="fa fa-calendar"></span>
                                    </span>
                                </div>
                                <asp:TextBox ID="tboxReleaseYear" MaxLength="4" runat="server" CssClass="form-control" />
                                <ajaxToolkit:FilteredTextBoxExtender ID="ftboxeReleaseYear" runat="server" FilterMode="ValidChars"
                                         FilterType="Numbers"
                                    TargetControlID="tboxReleaseYear" />
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

                <asp:ListView ID="lvMovies" runat="server" ItemPlaceholderID="ItemContainer" OnItemCommand="lvMovies_ItemCommand" OnItemDataBound="lvMovies_ItemDataBound"
                    ClientIDMode="AutoID" ItemType="MovieStore.Business.Movie">
                    <LayoutTemplate>
                        <div id="data" class="bootstrap-replace-table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Cover</th>
                                        <th>Title</th>
                                        <th>Description</th>
                                        <th>Rating</th>
                                        <th>Release Year</th>
                                        <th>Number of Copies</th>
                                        <th>Is Removed</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:PlaceHolder ID="ItemContainer" runat="server" />
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="8">
                                            <asp:LinkButton ID="lbtnAddMovie" runat="server" Text="Add Movie"
                                                ToolTip="Add Movie" OnClick="lbtnAddMovie_Click" />
                                        </td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td data-label="Cover">
                                <asp:Image ID="imgCover" runat="server" AlternateText='<%#: Item.Title %>' ImageUrl='<%#: Item.Cover != null ? "data:image;base64," + Convert.ToBase64String(Item.Cover) : "#" %>' CssClass="img-thumbnail" />
                            </td>
                            <td data-label="Title">
                                <asp:Label ID="lblTitle" runat="server" Text='<%#: Item.Title %>' />
                            </td>
                            <td data-label="Description">
                                <asp:Label ID="lblDescription" runat="server" Text='<%#: Item.Description %>' />
                            </td>
                            <td data-label="Rating">
                                <asp:Label ID="lblRating" runat="server" Text='<%#: Item.Rating %>' />
                            </td>
                             <td data-label="Release Year">
                                <asp:Label ID="lblReleaseYear" runat="server" Text='<%#: Item.ReleaseYear %>' />
                            </td>
                            <td data-label="Number of Copies">
                                <asp:Label ID="lblNumberOfCopies" runat="server" Text='<%#: Item.NumberOfCopies %>' />
                            </td>
                            <td data-label="Is Removed">
                                <asp:Label ID="lblIsRemoved" runat="server" Text='<%#: Item.IsRemoved == true ? "Yes" : "No" %>' />
                            </td>
                            <td data-label="Actions">
                                <asp:LinkButton ID="lbtnEdit" runat="server" Text="Edit" ToolTip="Edit"
                                    CausesValidation="false" CommandName="EditMovie" CommandArgument='<%#: Item.Id %>' />
                                |
                                <asp:LinkButton ID="lbtnRemoveAdd" runat="server" Text="Remove" ToolTip="Remove"
                                     CausesValidation="false" CommandName="RemoveAddMovie" CommandArgument='<%#: Item.Id %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <p>No record has been added yet.</p>
                         <asp:LinkButton ID="lbtnAddMovie" runat="server" Text="Add Movie"
                                    ToolTip="Add Movie" OnClick="lbtnAddMovie_Click" />
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
