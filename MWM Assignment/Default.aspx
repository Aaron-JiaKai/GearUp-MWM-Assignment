<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MWM_Assignment._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <%--Carousel--%>
        <div id="mainCarousel" class="carousel slide mb-5" data-bs-ride="carousel" style="height: 70vh; margin-top: -15px">
            <div class="carousel-inner">
                <asp:ListView runat="server" ID="lvCarousel">
                    <ItemTemplate>
                        <div class="carousel-item <%# getActiveClass(Container.DisplayIndex) %>" style="background: black;">
                            <img src="<%# Eval("image") %>" class="d-block w-100 main-carousel-image" alt="<%# Eval("name") %>">
                            <div class="carousel-caption d-none d-md-block">
                                <h3><%# Eval("name") %></h3>
                                <p><%# Eval("description") %></p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>

            <button class="carousel-control-prev" type="button" data-bs-target="#mainCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#mainCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <%--Categories--%>
        <div class="container mb-5">
            <div class="row">
                <h3 class="text-secondary">CATEGORIES</h3>
            </div>
            <hr />
            <div class="row">
                <asp:ListView ID="lvCategories" runat="server" OnItemCommand="lvCategories_ItemCommand">
                    <ItemTemplate>
                        <div class="col-lg-3 col-6">
                            <a href="ProductCatalog.aspx?cid=<%# Eval("cid") %>">
                                <div class="card m-1 bg-white text-dark cards">
                                    <img src="<%# Eval("image") %>" class="card-img category-image-fit" alt="<%# Eval("name") %>">
                                    <div class="card-img-overlay">
                                        <h5 class="card-title"><%# Eval("name") %></h5>
                                        <p class="card-text"><%# Eval("description") %></p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
        <div class="container mb-5">
            <div class="row">
                <h3 class="text-secondary">BEST SELLERS</h3>
            </div>
            <hr />
            <%--ADD TOP SALES HERE--%>
        </div>
    </main>

</asp:Content>
