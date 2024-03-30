﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ManageProducts.aspx.cs" Inherits="MWM_Assignment.Admin.ManageProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="mx-5 p-5">
        <div class="row">
            <h3 class="text-secondary">MANAGE PRODUCTS</h3>
        </div>
        <hr />

        <div runat="server" id="divProductDetails" visible="false">
            <div class="row mt-5">
                <div class="col-12 col-md-4 offset-md-4">
                    <div class="mb-3 position-relative" style="max-height: 300px">
                        <img id="productImage" runat="server" src="~/Images/Placeholder/placeholder.jpg" alt="Profile Image" class="product-image" clientidmode="Static" />
                        <asp:FileUpload runat="server" ID="fuProduct" ClientIDMode="Static" CssClass="d-none" onchange="img();" />
                        <div class="d-flex justify-content-center align-items-center product-image-overlay" onclick="chooseFile()">
                            <i class="bi-pencil-square text-white"></i>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 offset-md-4">
                    <!-- Name input -->
                    <div class="form-floating mb-3">
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Style="min-width: 100%" />
                        <asp:Label runat="server" ID="lblName" AssociatedControlID="txtName" CssClass="form-label" Text="Product Name" />
                    </div>
                </div>
            </div>
            <div class="row mb-5">
                <div class="col text-center">
                    <asp:Button runat="server" ID="btnUpdate" Text="Update Product" CssClass="btn btn-primary btn-lg" OnClick="btnUpdate_Click" />
                </div>
            </div>
        </div>
        <div class="mb-5">
            <asp:ListView runat="server" ID="lvProduct" OnPagePropertiesChanging="lvProduct_PagePropertiesChanging" OnItemCommand="lvProduct_ItemCommand">
                <LayoutTemplate>
                    <table class="table table-hover table-responsive">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Name</th>
                                <th>Description</th>
                                <th>Unit Price</th>
                                <th>Category</th>
                                <th>Status</th>
                                <th style="min-width: 125px;">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr id="itemPlaceholder" runat="server"></tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="7" style="text-align: end">
                                    <asp:DataPager runat="server" ID="dpProduct" PagedControlID="lvProduct" PageSize="5">
                                        <Fields>
                                            <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="btn btn-secondary" />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Container.DataItemIndex + 1 %></td>
                        <td><%# Eval("prodName") %></td>
                        <td><%# Eval("description") %></td>
                        <td><%# Eval("price") %></td>
                        <td><%# Eval("catName") %></td>
                        <td><%# int.Parse(Eval("active").ToString()) == 1 ? "Active" : "Inactive" %></td>
                        <td>
                            <div class="row">
                                <div class="col-auto">
                                    <asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary" runat="server" CommandName="updateProduct" CommandArgument='<%# Eval("cid") %>'><i class="bi bi-pencil-square"></i></asp:LinkButton>
                                </div>
                                <div class="col-auto">
                                    <asp:LinkButton ID="LinkButton2" CssClass='btn btn-danger' runat="server" CommandName='<%# int.Parse(Eval("active").ToString()) == 1 ? "deleteProduct" : "restoreProduct" %>' CommandArgument='<%# Eval("cid") %>'><i class='bi <%# int.Parse(Eval("active").ToString()) == 1 ? "bi-trash" : "bi-arrow-counterclockwise" %>'></i></asp:LinkButton>
                                </div>
                            </div>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
    <!-- Hidden Fields -->
    <div hidden>
        <asp:HiddenField runat="server" ID="hfUid" Value="" />
    </div>

    <!-- Status Message -->
    <div runat="server" id="divStatus" visible="false">
        <div class="position-fixed bottom-0 start-0 w-100" style="z-index: 100">
            <div runat="server" id="statusBg" class="text-center text-md-start py-2 px-3 px-xl-5 align-items-center text-white">
                <asp:Label runat="server" ID="lblStatusIcon" CssClass="bi-check-circle text-white h2" />
                <asp:Label runat="server" ID="lblStatus" Text="" />
            </div>
        </div>
    </div>
    <!-- Status Message -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="JSContent" runat="server">
    <script type="text/javascript">

        function chooseFile() {
            document.getElementById("fuProduct").click();
        }

        function img() {
            var url = inputToURL(document.getElementById("fuProduct"));
            document.getElementById("productImage").src = url;
        }

        function inputToURL(inputElement) {
            var file = inputElement.files[0];
            return window.URL.createObjectURL(file);
        }

    </script>
</asp:Content>
