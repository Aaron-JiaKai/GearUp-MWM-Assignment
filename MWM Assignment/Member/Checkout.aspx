<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="MWM_Assignment.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title" class="container">
        <h3 class="fw-bold">Checkout</h3>

        <div class="px-5 py-2 mt-5 shadow shadow-sm rounded bg-white">
            <div class="mx-auto align-items-center">
                <asp:DataList ID="dlCart" runat="server" RepeatColumns="1" RepeatDirection="Vertical" Width="100%">
                    <HeaderTemplate>
                        <div class="border-0">
                            <div class="row justify-content-between align-items-center">
                                <div class="col-12 col-md-5">
                                    <h5 class="fw-bold">Products Ordered</h5>
                                </div>
                                <div class="col-md-7">
                                    <div class="row ">
                                        <div class="col d-none d-md-flex">
                                            <p class="fw-bold">Unit Price</p>
                                        </div>
                                        <div class="col d-none d-md-flex">
                                            <p class="fw-bold">Quantity</p>
                                        </div>
                                        <div class="col d-none d-md-flex">
                                            <p class="fw-bold">Sub-Total</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="card mb-2 border-0">
                            <div class="row g-0 align-items-center">
                                <div class="col-6 col-md-3 pe-md-5 pe-2">
                                    <asp:Image ID="Image2" runat="server" CssClass="card-img img-fluid" ImageUrl='<%# Eval("image") %>' Style="height: 150px; width: 100%; object-fit: cover" />
                                </div>
                                <div class="card-body col-6 col-md-9">
                                    <div class="row">
                                        <asp:Label ID="Label1" runat="server" CssClass="d-none" Text='<%# Eval("pid") %>' />
                                        <asp:Label ID="Label2" runat="server" CssClass="card-title h5 fw-bold" Text='<%# Eval("name") %>' />
                                    </div>
                                    <div class="row">
                                        <div class="col-12 col-md order-1 mb-2">
                                            <asp:Label ID="Label3" runat="server" CssClass="small text-secondary " Width="150" Text='<%#Eval("description") %>' />
                                        </div>
                                        <div class="col-12 col-md order-3 order-sm-2">
                                            <label class="d-md-none text-secondary">Price: </label>
                                            <asp:Label ID="Label4" runat="server" CssClass="text-danger" Text='<%# Eval("price", "{0:C}") %>' />
                                        </div>
                                        <div class="col-12 col-md order-2 order-sm-3">
                                            <label class="d-md-none text-secondary">Quantity: </label>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("qty") %>' />
                                        </div>
                                        <div class="col d-none d-md-flex order-4">
                                            <asp:Label ID="Label6" runat="server" CssClass="text-danger fw-bold" Text='<%# Eval("subtotal", "{0:C}") %>' />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr />
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
        <div class="px-5 py-3 mt-3 shadow shadow-sm rounded bg-white">
            <div class="row">
                <div class="col-12 col-md">
                </div>
                <div class="col-12 col-md-4">
                    <span class="text-secondary">Merchandise Total: </span>
                    <asp:Label CssClass="text-secondary" runat="server" ID="lblTotal" Text="" />
                    <br />
                    <span class="text-secondary">SST (10%): </span>
                    <asp:Label CssClass="text-secondary" runat="server" ID="lblSst" Text="SST" />
                    <br />
                    <span class="fw-bold">Grand Sub-Total: </span>
                    <asp:Label CssClass="h5 fw-bold text-danger" runat="server" ID="lblGrandTotal" Text="Service" />
                    <br />
                    <asp:Button CssClass="btn btn-primary w-75 mt-3" runat="server" ID="btnPay" Text="Pay" OnClick="btnPay_Click" />
                </div>
            </div>
        </div>
    </main>

<%--    
    <div class="position-fixed bottom-0 start-0 w-100">
        <div class="text-center text-md-start py-2 px-3 px-xl-5 bg-success align-items-center">
            <i class="bi-check-circle-fill text-white h2"></i>
            <span class="text-white h5 ms-3">Order Received</span>
        </div>
    </div>
--%>
</asp:Content>
