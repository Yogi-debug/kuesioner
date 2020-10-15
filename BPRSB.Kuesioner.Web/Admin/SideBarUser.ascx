<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SideBarUser.ascx.cs" Inherits="BPRSB.Kuesioner.Web.Admin.SideBarUser" %>
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="default.aspx">
        <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">BPRSB</div>
    </a>
    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item">
        <a class="nav-link" href="index.html">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span></a>
    </li>
    <!-- Divider -->
    <hr class="sidebar-divider">
    <!-- Heading -->
    <div class="sidebar-heading">
        Administration
    </div>
    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item active">
        <a class="nav-link" href="users.aspx">
            <i class="fas fa-fw fa-table"></i>
            <span>User</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="karyawan.aspx">
            <i class="fas fa-fw fa-table"></i>
            <span>Karyawan</span></a>
    </li>
</ul>
