<%@ Page Title="Product Details Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="MWM_Assignment.ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title" class="container">
        <div class="row">
            <h1 class="fw-bold text-center">Product Details</h1>
        </div>
        <hr />
        <div class="row justify-content-center my-5">
            <div class="col-12 col-md-6">
                <asp:Image CssClass="img-fluid rounded" runat="server" ID="img_Image" ImageUrl="https://placehold.co/600x400" Style="height: 400px; width: 100%; object-fit: contain" />
            </div>
            <div class="col-12 col-md-6">
                <div class="row g-0">
                    <div class="card">
                        <div class="card-body">
                            <asp:Label runat="server" ID="lblName" Text="Placeholder" CssClass="fw-bold h5" />
                            <hr />
                            <asp:Label runat="server" ID="lblPrice" Text="Placeholder" CssClass="text-danger py-3"></asp:Label>
                            <br />
                            <asp:Label runat="server" ID="lblDescription" Text="Placeholder" />
                        </div>
                    </div>

                    <asp:Label runat="server" ID="lblQuantity" AssociatedControlID="txt_Quantity" Text="Quantity" CssClass="form-text" />
                    <asp:TextBox CssClass="form-control" runat="server" Text="1" TextMode="Number" ID="txt_Quantity"></asp:TextBox>


                    <div class="btn-group my-3 " role="group">
                        <asp:Button runat="server" ID="btnAddCart" CssClass="btn btn-secondary" Text="Add To Cart" OnClick="btnAddCart_Click" />
                        <asp:Button runat="server" ID="btnGoCart" CssClass="btn btn-primary" Text="Buy Now" OnClick="btnGoCart_Click" />
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
