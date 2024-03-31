<%@ Page Title="Product Details Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="MWM_Assignment.ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title" class="container" style="min-height: 60vh;">
        <div class="row g-0 my-3">
            <h3 class="text-secondary">PRODUCT DETAILS</h3>
            <hr />
        </div>
        <div class="bg-white p-5 my-5 shadow-sm">
            <div class="row justify-content-center">
                <div class="col-12 col-md-5 px-5">
                    <div class="row">
                        <h3 class="text-secondary">PRODUCT</h3>
                        <hr />
                        <div>
                            <asp:Image CssClass="img-fluid rounded" runat="server" ID="img_Image" ImageUrl="https://placehold.co/600x400" Style="height: 200px; width: 100%; object-fit: contain" />
                        </div>
                        <div>
                            <asp:Label runat="server" ID="lblName" Text="Placeholder" CssClass="fw-bold h5" />
                        </div>
                        <div class="my-2">
                            <asp:Label runat="server" ID="lblPrice" Text="Placeholder" CssClass="text-danger py-3"></asp:Label>
                        </div>
                        <div>
                            <asp:Label runat="server" ID="lblQuantity" AssociatedControlID="txt_Quantity" Text="Quantity" CssClass="form-text" />
                            <asp:TextBox CssClass="form-control" runat="server" Text="1" TextMode="Number" ID="txt_Quantity" min="1"></asp:TextBox>
                            <div class="btn-group my-3" role="group">
                                <asp:Button runat="server" ID="btnAddCart" CssClass="btn btn-outline-primary " Text="Add To Cart" OnClick="btnAddCart_Click" />
                                <asp:Button runat="server" ID="btnGoCart" CssClass="btn btn-primary" Text="Buy Now" OnClick="btnGoCart_Click" />
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-12 col-md px-5">
                    <div class="row">
                        <h3 class="text-secondary">DESCRIPTION</h3>
                        <hr />
                        <asp:Label runat="server" ID="lblDescription" Text="Placeholder" Style="white-space: pre-wrap;" />
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
    </main>
</asp:Content>
