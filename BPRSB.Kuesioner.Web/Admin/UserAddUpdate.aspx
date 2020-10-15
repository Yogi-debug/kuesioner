<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserAddUpdate.aspx.cs" Inherits="BPRSB.Kuesioner.Web.Admin.UserAddUpdate" %>

<%@ Register Src="~/Admin/SideBarUser.ascx" TagPrefix="uc1" TagName="SideBarUser" %>
<%@ Register Src="~/Admin/TopBar.ascx" TagPrefix="uc1" TagName="TopBar" %>
<link href="../Content/bootstrap.css" rel="stylesheet" />
<script src="../Scripts/jquery-3.0.0.min.js"></script>
<script src="../Scripts/bootstrap.bundle.min.js"></script>
<link href="../css/sb-admin-2.min.css" rel="stylesheet" />

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        // Example starter JavaScript for disabling form submissions if there are invalid fields
        (function () {
            'use strict';
            window.addEventListener('load', function () {
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.getElementsByClassName('needs-validation');
                // Loop over them and prevent submission
                var validation = Array.prototype.filter.call(forms, function (form) {
                    form.addEventListener('submit', function (event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>
</head>
<body id="page-top">
    <div id="wrapper">
        <uc1:SideBarUser runat="server" ID="SideBarUser" />
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <uc1:TopBar runat="server" ID="TopBar" />
                <!-- Begin Page Content -->
                <form id="form1" runat="server">
                    <div class="container-fluid">
                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Create New User</h6>
                            </div>
                            <div class="card-body">
                                <div class="form-group row">

                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="TextBoxUserName">User Name</label>
                                        <asp:TextBox ID="TextBoxUserName" type="text" runat="server" class="form-control" placeholder="User Name" required></asp:TextBox>
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="TextBoxLoginID">Login ID</label>
                                        <asp:TextBox ID="TextBoxLoginID" type="text" runat="server" class="form-control" placeholder="Login ID" required></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label for="TextBoxPassword">Password</label>
                                        <asp:TextBox ID="TextBoxPassword" type="Password" runat="server" class="form-control form-control-user" placeholder="Password"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="TextBoxEmailID">Email</label>
                                        <asp:TextBox ID="TextBoxEmailID" type="Email" runat="server" class="form-control form-control-user" placeholder="Email ID" required></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <asp:CheckBox runat="server" ID="CheckBoxAdminAccess" Text="Admin Access" />
                                    </div>
                                    <div class="col-sm-6">
                                    </div>
                                </div>


                                <asp:Button ID="ButtonSave" runat="server" Text="Save" class="btn btn-primary" OnClick="ButtonSave_Click" />
                            </div>
                        </div>

                    </div>
                </form>
            </div>
            <!-- End of Main Content -->
            <!-- #include file="Footer.html" -->
            <!-- Error Modal-->
            <div class="modal fade" id="ErrorModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Error Occured!</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="LabelError" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">OK</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
</body>
</html>
