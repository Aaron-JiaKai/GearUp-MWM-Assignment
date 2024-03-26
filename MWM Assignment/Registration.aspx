<%@ Page Title="Registration Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="MWM_Assignment.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title" class="container">
        <div class="justify-content-center align-items-center d-grid" style="min-height: 80vh">
            <div class="p-5 bg-white rounded">
                <div class="row">
                    <h1 class="fw-bold mb-3">Glad to have you onboard!</h1>
                </div>
                <div class="row">
                    <div class="col-md-9 col-lg-6 col-xl-5">
                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp" class="img-fluid">
                    </div>
                    <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">

                        <!-- Name input -->
                        <div class="form-outline mb-4">
                            <asp:Label runat="server" ID="lblName" AssociatedControlID="txtName" CssClass="form-label" Text="Name" />
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control form-control-lg" Style="max-width: 100%" placeholder="Enter name" />
                        </div>

                        <!-- Email input -->
                        <div class="form-outline mb-4">
                            <asp:Label runat="server" ID="lblEmail" AssociatedControlID="txtEmail" CssClass="form-label" Text="Email Address" />
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control form-control-lg" Style="max-width: 100%" placeholder="Enter a valid email address" />
                        </div>

                        <!-- Password input -->
                        <div class="form-outline mb-3">
                            <asp:Label runat="server" ID="lblPassword" AssociatedControlID="txtPassword" CssClass="form-label" Text="Password" />
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control form-control-lg" TextMode="Password" Style="max-width: 100%" placeholder="Enter password" />
                        </div>

                        <div class="text-center text-lg-start mt-4 pt-2">
                            <asp:Button runat="server" ID="btnRegister" Text="Sign up" CssClass="btn btn-primary btn-lg" Style="padding-left: 2.5rem; padding-right: 2.5rem;" OnClick="btnRegister_Click" />
                        </div>
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

        <!-- SQL Data Source -->
        <div class="row">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:GearUpDB %>" DeleteCommand="DELETE FROM [tblCustomers] WHERE [id] = @original_id AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([password] = @original_password) OR ([password] IS NULL AND @original_password IS NULL)) AND (([dtAdded] = @original_dtAdded) OR ([dtAdded] IS NULL AND @original_dtAdded IS NULL)) AND (([active] = @original_active) OR ([active] IS NULL AND @original_active IS NULL))" InsertCommand="INSERT INTO [tblCustomers] ([name], [email], [password], [dtAdded], [active]) VALUES (@name, @email, @password, @dtAdded, @active)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [tblCustomers]" UpdateCommand="UPDATE [tblCustomers] SET [name] = @name, [email] = @email, [password] = @password, [dtAdded] = @dtAdded, [active] = @active WHERE [id] = @original_id AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([password] = @original_password) OR ([password] IS NULL AND @original_password IS NULL)) AND (([dtAdded] = @original_dtAdded) OR ([dtAdded] IS NULL AND @original_dtAdded IS NULL)) AND (([active] = @original_active) OR ([active] IS NULL AND @original_active IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_id" Type="Int32" />
                    <asp:Parameter Name="original_name" Type="String" />
                    <asp:Parameter Name="original_email" Type="String" />
                    <asp:Parameter Name="original_password" Type="String" />
                    <asp:Parameter Name="original_dtAdded" Type="DateTime" />
                    <asp:Parameter Name="original_active" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtName" Name="name" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtEmail" Name="email" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtPassword" Name="password" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="lblCurrentDt" DefaultValue="" Name="dtAdded" PropertyName="Text" Type="DateTime" />
                    <asp:Parameter DefaultValue="1" Name="active" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="dtAdded" Type="DateTime" />
                    <asp:Parameter Name="active" Type="Int32" />
                    <asp:Parameter Name="original_id" Type="Int32" />
                    <asp:Parameter Name="original_name" Type="String" />
                    <asp:Parameter Name="original_email" Type="String" />
                    <asp:Parameter Name="original_password" Type="String" />
                    <asp:Parameter Name="original_dtAdded" Type="DateTime" />
                    <asp:Parameter Name="original_active" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </main>
</asp:Content>
