<%@ Page Title="Registration Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="MWM_Assignment.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title" class="container">
        <div class="justify-content-center align-items-center d-grid" style="min-height: 80vh">
            <div class="p-5 bg-white rounded shadow-sm">
                <div class="row">
                    <h1 class="fw-bold mb-3">Glad to have you onboard!</h1>
                    <hr />
                </div>
                <div class="row">
                    <div class="col">
                        <div class="mb-3">
                            <a onclick="chooseFile()">
                                <img id="profileImage" src="/Images/Placeholder/placeholder-user.jpg" alt="Profile Image" class="m-2 img-fluid profile-image" />
                            </a>
                            <asp:FileUpload runat="server" ID="fuProfile" ClientIDMode="Static" CssClass="d-none" onchange="img();" />
                        </div>
                        <hr />

                        <!-- Name input -->
                        <div class="form-floating mb-3">
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="John Doe"/>
                            <asp:Label runat="server" ID="lblName" AssociatedControlID="txtName" CssClass="form-label" Text="Name" />
                        </div>

                    </div>
                    <div class="col">
                        <!-- Email input -->
                        <div class="form-floating mb-3">
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control w-100" TextMode="Email" autocomplete="off" placeholder="example@example.com" />
                            <asp:Label runat="server" ID="lblEmail" AssociatedControlID="txtEmail" CssClass="form-label" Text="Email Address" />
                        </div>

                        <!-- Password input -->
                        <div class="form-floating mb-3">
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" autocomplete="off" placeholder="Enter password" />
                            <asp:Label runat="server" ID="lblPassword" AssociatedControlID="txtPassword" CssClass="form-label" Text="Password" />
                        </div>

                        <!-- Confirm Password input -->
                        <div class="form-floating mb-3">
                            <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" autocomplete="off" placeholder="Confirm password" />
                            <asp:Label runat="server" ID="lblConfirmPassword" AssociatedControlID="txtPassword" CssClass="form-label" Text="Enter your Password again" />
                        </div>

                        <!-- Address input -->
                        <div class="form-floating mb-3">
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder=" " Style="height: 10rem" />
                            <asp:Label runat="server" ID="lblAddress" AssociatedControlID="txtName" CssClass="form-label" Text="Address" />
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
        <!-- Status Message -->
    </main>

    <script type="text/javascript">

        function chooseFile() {
            document.getElementById("fuProfile").click();
        }

        function img() {
            var url = inputToURL(document.getElementById("<%= fuProfile.ClientID %>"));
            document.getElementById("profileImage").src = url;
        }

        function inputToURL(inputElement) {
            var file = inputElement.files[0];
            return window.URL.createObjectURL(file);
        }

    </script>
</asp:Content>
