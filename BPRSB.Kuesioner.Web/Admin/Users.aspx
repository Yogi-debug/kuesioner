<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="BPRSB.Kuesioner.Web.Admin.Users" %>

<%@ Register Src="~/Admin/SideBarUser.ascx" TagPrefix="uc1" TagName="SideBarUser" %>
<%@ Register Src="~/Admin/TopBar.ascx" TagPrefix="uc1" TagName="TopBar" %>

<link href="../Content/bootstrap.css" rel="stylesheet" />
<script src="../Scripts/jquery-3.0.0.min.js"></script>
<script src="../Scripts/bootstrap.bundle.min.js"></script>
<link href="../css/sb-admin-2.min.css" rel="stylesheet" />

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Title</title>
</head>
<body id="page-top">
                <form runat="server" class="needs-validation" novalidate>
    <div id="wrapper">
        <uc1:SideBarUser runat="server" ID="SideBarUser" />
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <uc1:TopBar runat="server" ID="TopBar" />
                <!-- Begin Page Content -->
                    <div class="container-fluid">
                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">User</h1>
                        <p class="mb-4">Tambah, Edit, Delete User</p>
                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Lis User</h6>
                            </div>
                            <br>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <a href="UserAddUpdate.aspx" class="btn btn-success btn-icon-split">
                                            <span class="icon text-white-50">
                                                <i class="fas fa-check"></i>
                                            </span>
                                            <span class="text">Add New User</span>
                                        </a>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="input-group">
                                            <asp:TextBox ID="TextBoxSearch" runat="server" type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2"></asp:TextBox>
                                            <div class="input-group-append">
                                                <asp:Button ID="ButtonSearchUser" runat="server" class="btn btn-primary" type="button" Text="Search" OnClick="ButtonSearchUser_Click"></asp:Button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <div class="table-responsive">
                                    <asp:ListView runat="server" ID="ListViewData" OnPagePropertiesChanging="ListViewData_PagePropertiesChanging">
                                        <LayoutTemplate>
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>LoginId</th>
                                                        <th>Username</th>
                                                        <th>Email</th>
                                                        <th>IsAdmin</th>
                                                        <th>Function</th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th>LoginId</th>
                                                        <th>Username</th>
                                                        <th>Email</th>
                                                        <th>IsAdmin</th>
                                                        <th>Function</th>
                                                    </tr>
                                                </tfoot>
                                                <tbody>
                                                    <tr runat="server" id="itemPlaceholder"></tr>
                                                </tbody>
                                            </table>
                                        </LayoutTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td><a href="UserAddUpdate.aspx?UserId=<%# Eval("UserId") %>"><%# Eval("LoginId") %></a></td>
                                                <td><%# Eval("Username") %></td>
                                                <td><%# Eval("Email") %></td>
                                                <td><%# Eval("IsAdmin") %></td>
                                                <td>
                                                    <asp:Button ID="ButtonDeleteUser" runat="server" Text="Delete" CausesValidation="false"
                                                        Visible="true" CssClass="btn btn-danger" OnClick="ButtonDeleteUser_Click" />
                                                    <asp:Button ID="ButtonUpdateUser" runat="server" CausesValidation="false" Text="Update"
                                                        Visible="true" CssClass="btn btn-primary" OnClick="ButtonUpdateUser_Click" />
                                                </td>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </div>
                                <label>Page</label>
                                <asp:DataPager ID="lvDataPager1" runat="server" PagedControlID="ListViewData" PageSize="20">
                                    <Fields>
                                        <asp:NumericPagerField ButtonType="Link" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->
                    <!-- Modal Confirmation-->
                    <div class="modal fade" id="ModalConfirmation" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Confirmation</h5>
                                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">×</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <asp:Label ID="LabelConfirmation" runat="server" Text="Please Confirm."></asp:Label>
                                </div>
                                <div class="modal-footer">
                                    <asp:Button runat="server" ID="ButtonOKConfirm" class="btn btn-secondary" UseSubmitBehavior="false" type="button" data-dismiss="modal" Text="OK" OnClick="ButtonOKConfirm_Click" />
                                    <button class="btn btn-primary" type="button" data-dismiss="modal">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
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
            <!-- End of Main Content -->
            <!-- #include file="Footer.html" -->
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
                </form>

</body>
</html>
