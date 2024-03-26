<%@ Page Title="Shopping Cart Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="MWM_Assignment.ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title" class="container">
        <h3>Your Cart</h3>

        <div class="row bg-white p-3 rounded border border-opacity-10 mb-3">
            <div class="align-items-center row">
                <asp:DataList ID="dlCart" runat="server" RepeatColumns="1" RepeatDirection="Vertical" Width="100%" OnItemCommand="dlCart_ItemCommand">
                    <HeaderTemplate>
                        <div class="row p-2">
                            <div class="col">
                                <p class="fw-bold">Image</p>
                            </div>
                            <div class="col">
                                <p class="fw-bold">Item</p>
                            </div>
                            <div class="col">
                                <p class="fw-bold">Price</p>
                            </div>
                            <div class="col">
                                <p class="fw-bold">Quantity</p>
                            </div>
                            <div class="col">
                                <p class="fw-bold">Sub-Total</p>
                            </div>
                            <div class="col">
                                <p class="fw-bold">Action</p>
                            </div>
                        </div>
                        <hr />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="row p-2 rounded">
                            <div class="row" style="display: none">
                                <asp:Label ID="pidLabel" runat="server" CssClass="fw-bold" Text='<%# Eval("pid") %>' />
                            </div>
                            <div class="col">
                                <asp:Image ID="Image1" runat="server" CssClass="rounded float-start" ImageUrl='<%# Eval("image") %>' Style="height: 10rem; width: 100%; object-fit: cover" />
                            </div>
                            <div class="col">
                                <asp:Label ID="nameLabel" runat="server" CssClass="fw-bold" Text='<%# Eval("name") %>' />
                                <br />
                                <asp:Label ID="descLabel" runat="server" CssClass="small text-secondary" Text='<%# Eval("description") %>' />
                            </div>
                            <div class="col">
                                <asp:Label ID="priceLabel" runat="server" CssClass="text-danger" Text='<%# Eval("price", "{0:C}") %>' />
                            </div>
                            <div class="col">
                                <asp:TextBox ID="txtQty" runat="server" CssClass="form-control" TextMode="Number" Text='<%# Eval("qty") %>'></asp:TextBox>
                            </div>
                            <div class="col">
                                <asp:Label ID="subtotalLabel" runat="server" CssClass="text-danger" Text='<%# Eval("subtotal", "{0:C}") %>' />
                            </div>
                            <div class="col">
                                <asp:LinkButton CssClass="me-3" ID="btnUpdate" runat="server" CommandName="update" CommandArgument='<%# Eval("pid") %>'><i class="bi-check-circle-fill"></i></asp:LinkButton>
                                <asp:LinkButton CssClass="mt-3" ID="btnDelete" runat="server" CommandName="delete" CommandArgument='<%# Eval("pid") %>'><i class="bi-trash-fill text-danger"></i></asp:LinkButton>
                            </div>
                        </div>
                        <hr />
                    </ItemTemplate>
                </asp:DataList>
                <div runat="server" class="row p-2 rounded" id="emptyCart" visible="false">
                    <a href="ProductCatalog.aspx">Your cart is empty! Click here to continue shopping!</a>
                </div>
            </div>
        </div>

        <div class="row bg-white p-3 rounded border border-opacity-10">
            <div class="col-3">
                <asp:Label CssClass="text-primary" runat="server" ID="lblStatus" Text="" />
            </div>
            <div class="col-9 text-end">
                <asp:Label CssClass="h3 fw-bold text-danger mx-3 px-3" runat="server" ID="lblTotal" Text="" />
                <asp:Button CssClass="btn btn-primary" runat="server" ID="btnCheckout" Text="Check Out" OnClick="btnCheckout_Click" />
            </div>
        </div>
    </main>
</asp:Content>
