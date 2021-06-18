<%@ Page Title="" Async="true" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddMovie.aspx.cs" Inherits="MovieStore.Web.AddMovie" %>

<asp:Content ID="cAddMovie" ContentPlaceHolderID="cphMain" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Add Movie</h1>

                <p>Please fill out all required fields and click save.</p>

                <asp:ValidationSummary ID="vsError" HeaderText="The following error(s) occurred:" runat="server"
                    DisplayMode="BulletList" CssClass="alert alert-danger" />

                <div class="card">
                    <div class="card-header">
                        Movie Information
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <asp:Label ID="lblTitle" runat="server" AssociatedControlID="tboxTitle" Text="* Title" />
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
                            <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="tboxTitle"
                                ErrorMessage="Title is required." SetFocusOnError="true" EnableClientScript="true"
                                Display="None" />
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblDescription" runat="server" AssociatedControlID="tboxDescription" Text="Description" />
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <span class="fa fa-briefcase"></span>
                                    </span>
                                </div>
                                <asp:TextBox ID="tboxDescription" TextMode="MultiLine" Rows="5" MaxLength="2000" runat="server" CssClass="form-control" />
                                <ajaxToolkit:FilteredTextBoxExtender ID="ftboxeDescription" runat="server" FilterMode="ValidChars"
                                    ValidChars=" " FilterType="LowercaseLetters, UppercaseLetters, Custom"
                                    TargetControlID="tboxDescription" />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblRating" runat="server" AssociatedControlID="ddlRating" Text="* Rating" />
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
                            <asp:RequiredFieldValidator ID="rfvRating" InitialValue="0" runat="server" ControlToValidate="ddlRating"
                                Display="None" ErrorMessage="Rating is required." EnableClientScript="true" SetFocusOnError="true" />
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblReleaseYear" runat="server" AssociatedControlID="tboxReleaseYear" Text="* Release Year" />
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
                            <asp:RequiredFieldValidator ID="rfvReleaseYear" runat="server" ControlToValidate="tboxReleaseYear"
                                Display="None" ErrorMessage="Release year is required." EnableClientScript="true" SetFocusOnError="true" />
                            <asp:RangeValidator ID="rvReleaseYear" runat="server" ControlToValidate="tboxReleaseYear" Display="None" MinimumValue="1889" MaximumValue="2022" ErrorMessage="Must be > 1888" EnableClientScript="true" SetFocusOnError="true" />
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblNumberOfCopies" runat="server" AssociatedControlID="tboxNumberOfCopies" Text="* Number of Copies" />
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <span class="fa fa-list"></span>
                                    </span>
                                </div>
                                <asp:TextBox ID="tboxNumberOfCopies" MaxLength="4" runat="server" CssClass="form-control" />
                                <ajaxToolkit:FilteredTextBoxExtender ID="ftboxeNumberOfCopies" runat="server" FilterMode="ValidChars"
                                         FilterType="Numbers"
                                    TargetControlID="tboxNumberOfCopies" />
                            </div>
                            <asp:RequiredFieldValidator ID="rfvNumberOfCopies" runat="server" ControlToValidate="tboxNumberOfCopies"
                                Display="None" ErrorMessage="Number of copies is required." EnableClientScript="true" SetFocusOnError="true" />
                            <asp:RangeValidator ID="rvNumberOfCopies" runat="server" ControlToValidate="tboxNumberOfCopies" Display="None" MinimumValue="1" MaximumValue="9999" ErrorMessage="Must be > 0" EnableClientScript="true" SetFocusOnError="true" />
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblActor" runat="server" AssociatedControlID="cboxlActors" Text="* Actors" />
                            <asp:CheckBoxList ID="cboxlActors" runat="server" RepeatDirection="Vertical" DataTextField="Name" DataValueField="Id" />
                            <asp:CustomValidator ID="cvActors" runat="server" Display="None" OnServerValidate="cvActors_ServerValidate" ErrorMessage="Select at least one actor." />
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblCover" runat="server"
                                AssociatedControlID="fupCover" Text="* Cover" />
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">
                                        <span class="fa fa-image"></span>
                                    </span>
                                </div>
                                <asp:FileUpload ID="fupCover" runat="server" AllowMultiple="false" CssClass="form-control" style="height:auto;" />
                            </div>
                            <asp:RequiredFieldValidator ID="rfvCover" runat="server" ControlToValidate="fupCover"
                                ErrorMessage="Cover is required." SetFocusOnError="true"
                                EnableClientScript="true" Display="None" />
                            <asp:CustomValidator ID="cvCover" runat="server" ControlToValidate="fupCover"
                                ErrorMessage="Invalid picture selection." Display="None" SetFocusOnError="true"
                                OnServerValidate="cvCover_ServerValidate" />
                        </div>
                    </div>
                </div>

                <div class="clearfix">&nbsp;</div>

                <div class="form-group">
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" ToolTip="Cancel" CausesValidation="false"
                        CssClass="btn btn-dark btn-sm" OnClick="btnCancel_Click" />
                    <asp:Button ID="btnSave" runat="server" Text="Save" ToolTip="Save" OnClick="btnSave_Click"
                        CssClass="btn btn-success btn-sm" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
