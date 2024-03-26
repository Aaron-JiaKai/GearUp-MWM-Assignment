<%@ Page Title="Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="MWM_Assignment.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title" class="container">
        <h2>Manage Profile</h2>

        <div class="row">
            <div class="col">
                <span>Name : </span>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
            </div>
            <div class="col">
                <span>Email : </span>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
            </div>
        </div>
        <div class="row">
            <div class="col-6">
                <span>Password : </span>
                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="form-control" />
            </div>
        </div>
        <div class="row">
            <asp:Label runat="server" ID="lblCurrentDt" />
        </div>
        <div class="row">
            <div class="col-2">
                <asp:Button runat="server" ID="btnUpdate" Text="Update" CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
            </div>
        </div>

        <div class="row">

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CSMWM2311 %>" SelectCommand="SELECT * FROM [tblCustomers]" UpdateCommand="UPDATE tblCustomers SET name = @name WHERE id = @id">
                <UpdateParameters>
                    <asp:ControlParameter ControlID="txtName" Name="name" PropertyName="Text" />
                    <asp:SessionParameter Name="id" SessionField="id" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
    </main>
</asp:Content>
