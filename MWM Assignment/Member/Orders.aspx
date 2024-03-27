<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="MWM_Assignment.Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <main aria-labelledby="title" class="container">
        <div class="justify-content-center align-items-center" style="min-height: 80vh;">
            <div class="px-5 pt-3 mx-5 bg-white rounded shadow-sm">
                <div class="row">
                    <h1 class="fw-bold mb-3">Orders</h1>
                </div>
                <div class="mb-3">
                    <ul class="nav nav-pills justify-content-end" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="ship-tab" data-bs-toggle="tab" data-bs-target="#ship" type="button" role="tab" aria-controls="ship" aria-selected="true">To Ship</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="receive-tab" data-bs-toggle="tab" data-bs-target="#receive" type="button" role="tab" aria-controls="receive" aria-selected="false">To Receive</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="completed-tab" data-bs-toggle="tab" data-bs-target="#completed" type="button" role="tab" aria-controls="completed" aria-selected="false">Completed</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="cancelled-tab" data-bs-toggle="tab" data-bs-target="#cancelled" type="button" role="tab" aria-controls="cancelled" aria-selected="false">Cancelled</button>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="px-5 py-3">
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="ship" role="tabpanel" aria-labelledby="ship-tab">
                        <asp:DataList ID="dlPaid" runat="server" RepeatColumns="1" RepeatDirection="Vertical" Width="100%">
                            <ItemTemplate>
                                <div class="bg-white border-0 shadow-sm p-3 rounded my-3">
                                    <div class="row align-items-center justify-content-between">
                                        <div class="col-auto">
                                            <span class="small text-secondary">Order Reference: </span>
                                            <asp:Label ID="Label4" runat="server" CssClass="small text-secondary" Text='<%# Eval("oid") %>' />
                                        </div>
                                        <div class="col text-end">
                                            <span class="text-secondary">| </span>
                                            <asp:Label ID="Label6" runat="server" CssClass="small text-success" Text='<%# Eval("status") %>' />
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-auto me-3" style="min-width: 184px;">
                                            <asp:Image ID="Image1" runat="server" CssClass="img-fluid p-2" ImageUrl='<%# Eval("image") %>' Style="height: 8rem; width: 8rem; object-fit: contain" />
                                        </div>
                                        <div class="col py-3">
                                            <div class="row g-0">
                                                <asp:Label ID="Label1" runat="server" CssClass="d-none" Text='<%# Eval("pid") %>' />
                                                <asp:Label ID="Label2" runat="server" CssClass="h5" Text='<%# Eval("name") %>' />
                                            </div>
                                            <div>
                                                <span class="small text-secondary">x</span>
                                                <asp:Label ID="Label3" runat="server" CssClass="small text-secondary" Text='<%# Eval("qty") %>' />
                                            </div>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col text-end align-items-end">
                                            <div class="row g-0">
                                                <div class="col text-start">
                                                    <asp:Label ID="Label5" runat="server" CssClass="small text-secondary " Text='<%# Eval("dtAdded") %>' />
                                                </div>
                                                <div class="col text-end">
                                                    <span>Order Total: </span>
                                                    <asp:Label ID="Label7" runat="server" CssClass="h5 text-danger" Text='<%# Eval("subtotal", "{0:C}") %>' />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                    <div class="tab-pane fade" id="receive" role="tabpanel" aria-labelledby="receive-tab">
                        <asp:DataList ID="dlShipped" runat="server" RepeatColumns="1" RepeatDirection="Vertical" Width="100%">
                            <ItemTemplate>
                                <div class="bg-white border-0 shadow-sm p-3 rounded my-3">
                                    <div class="row align-items-center justify-content-between">
                                        <div class="col-auto">
                                            <span class="small text-secondary">Order Reference: </span>
                                            <asp:Label ID="Label4" runat="server" CssClass="small text-secondary" Text='<%# Eval("oid") %>' />
                                        </div>
                                        <div class="col text-end">
                                            <span class="text-secondary">| </span>
                                            <asp:Label ID="Label6" runat="server" CssClass="small text-success" Text='<%# Eval("status") %>' />
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-auto me-3" style="min-width: 184px;">
                                            <asp:Image ID="Image1" runat="server" CssClass="img-fluid p-2" ImageUrl='<%# Eval("image") %>' Style="height: 8rem; width: 8rem; object-fit: contain" />
                                        </div>
                                        <div class="col py-3">
                                            <div class="row g-0">
                                                <asp:Label ID="Label1" runat="server" CssClass="d-none" Text='<%# Eval("pid") %>' />
                                                <asp:Label ID="Label2" runat="server" CssClass="h5" Text='<%# Eval("name") %>' />
                                            </div>
                                            <div>
                                                <span class="small text-secondary">x</span>
                                                <asp:Label ID="Label3" runat="server" CssClass="small text-secondary" Text='<%# Eval("qty") %>' />
                                            </div>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col text-end align-items-end">
                                            <div class="row g-0">
                                                <div class="col text-start">
                                                    <asp:Label ID="Label5" runat="server" CssClass="small text-secondary " Text='<%# Eval("dtAdded") %>' />
                                                </div>
                                                <div class="col text-end">
                                                    <span>Order Total: </span>
                                                    <asp:Label ID="Label7" runat="server" CssClass="h5 text-danger" Text='<%# Eval("subtotal", "{0:C}") %>' />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                    <div class="tab-pane fade" id="completed" role="tabpanel" aria-labelledby="completed-tab">
                        <asp:DataList ID="dlDelivered" runat="server" RepeatColumns="1" RepeatDirection="Vertical" Width="100%">
                            <ItemTemplate>
                                <div class="bg-white border-0 shadow-sm p-3 rounded my-3">
                                    <div class="row align-items-center justify-content-between">
                                        <div class="col-auto">
                                            <span class="small text-secondary">Order Reference: </span>
                                            <asp:Label ID="Label4" runat="server" CssClass="small text-secondary" Text='<%# Eval("oid") %>' />
                                        </div>
                                        <div class="col text-end">
                                            <span class="text-secondary">| </span>
                                            <asp:Label ID="Label6" runat="server" CssClass="small text-success" Text='<%# Eval("status") %>' />
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-auto me-3" style="min-width: 184px;">
                                            <asp:Image ID="Image1" runat="server" CssClass="img-fluid p-2" ImageUrl='<%# Eval("image") %>' Style="height: 8rem; width: 8rem; object-fit: contain" />
                                        </div>
                                        <div class="col py-3">
                                            <div class="row g-0">
                                                <asp:Label ID="Label1" runat="server" CssClass="d-none" Text='<%# Eval("pid") %>' />
                                                <asp:Label ID="Label2" runat="server" CssClass="h5" Text='<%# Eval("name") %>' />
                                            </div>
                                            <div>
                                                <span class="small text-secondary">x</span>
                                                <asp:Label ID="Label3" runat="server" CssClass="small text-secondary" Text='<%# Eval("qty") %>' />
                                            </div>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col text-end align-items-end">
                                            <div class="row g-0">
                                                <div class="col text-start">
                                                    <asp:Label ID="Label5" runat="server" CssClass="small text-secondary " Text='<%# Eval("dtAdded") %>' />
                                                </div>
                                                <div class="col text-end">
                                                    <span>Order Total: </span>
                                                    <asp:Label ID="Label7" runat="server" CssClass="h5 text-danger" Text='<%# Eval("subtotal", "{0:C}") %>' />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                    <div class="tab-pane fade" id="cancelled" role="tabpanel" aria-labelledby="cancelled-tab">
                        <asp:DataList ID="dlCancelled" runat="server" RepeatColumns="1" RepeatDirection="Vertical" Width="100%">
                            <ItemTemplate>
                                <div class="bg-white border-0 shadow-sm p-3 rounded my-3">
                                    <div class="row align-items-center justify-content-between">
                                        <div class="col-auto">
                                            <span class="small text-secondary">Order Reference: </span>
                                            <asp:Label ID="Label4" runat="server" CssClass="small text-secondary" Text='<%# Eval("oid") %>' />
                                        </div>
                                        <div class="col text-end">
                                            <span class="text-secondary">| </span>
                                            <asp:Label ID="Label6" runat="server" CssClass="small text-danger" Text='<%# Eval("status") %>' />
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-auto me-3" style="min-width: 184px;">
                                            <asp:Image ID="Image1" runat="server" CssClass="img-fluid p-2" ImageUrl='<%# Eval("image") %>' Style="height: 8rem; width: 8rem; object-fit: contain" />
                                        </div>
                                        <div class="col py-3">
                                            <div class="row g-0">
                                                <asp:Label ID="Label1" runat="server" CssClass="d-none" Text='<%# Eval("pid") %>' />
                                                <asp:Label ID="Label2" runat="server" CssClass="h5" Text='<%# Eval("name") %>' />
                                            </div>
                                            <div>
                                                <span class="small text-secondary">x</span>
                                                <asp:Label ID="Label3" runat="server" CssClass="small text-secondary" Text='<%# Eval("qty") %>' />
                                            </div>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col text-end align-items-end">
                                            <div class="row g-0">
                                                <div class="col text-start">
                                                    <asp:Label ID="Label5" runat="server" CssClass="small text-secondary " Text='<%# Eval("dtAdded") %>' />
                                                </div>
                                                <div class="col text-end">
                                                    <span>Order Total: </span>
                                                    <asp:Label ID="Label7" runat="server" CssClass="h5 text-danger" Text='<%# Eval("subtotal", "{0:C}") %>' />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                </div>
            </div>
        </div>


        <!-- Status Message -->
        <div runat="server" id="divStatus">
            <div class="position-fixed bottom-0 start-0 w-100">
                <div runat="server" id="statusBg" class="text-center text-md-start py-2 px-3 px-xl-5 align-items-center text-white">
                    <asp:Label runat="server" ID="lblStatusIcon" CssClass="bi-check-circle text-white h2" />
                    <asp:Label runat="server" ID="lblStatus" Text="" />
                </div>
            </div>
        </div>
        <!-- Status Message -->
    </main>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="JSContent" runat="server">
</asp:Content>
