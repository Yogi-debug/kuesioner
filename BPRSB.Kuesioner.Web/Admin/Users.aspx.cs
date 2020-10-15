using BPRSB.Kuesioner.Library.Models;
using BPRSB.Kuesioner.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BPRSB.Kuesioner.Web.Admin
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }
        public void LoadData()
        {
            List<User> das = MySqlRepository.GetAll<User>("Username like '%" + TextBoxSearch.Text + "%' ");
            Session["List_User"] = das;
            ListViewData.DataSource = das;
            ListViewData.DataBind();
        }

        public void ViewData()
        {
            // Response.Redirect("UsersUpdate.aspx?user_id=" + user_id);
        }
        protected void ButtonDeleteUser_Click(object sender, EventArgs e)
        { 
            Control button = (Control)sender;
            ListViewDataItem item = (ListViewDataItem)button.BindingContainer;
            List<User> users = (List<User>)Session["List_User"];
            User user = users[item.DataItemIndex];
            Session["Selected_User"] = user;
            LabelConfirmation.Text = "Please confirm to delete User '" + user.Username + "'.";
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalConfirmation", "$(document).ready(function () {$('#ModalConfirmation').modal();});", true);
        }
        protected void ButtonUpdateUser_Click(object sender, EventArgs e)
        {
            
            Control button = (Control)sender;
            ListViewDataItem item = (ListViewDataItem)button.BindingContainer;
            List<User> users = (List<User>)Session["List_User"];
            User user = users[item.DataItemIndex];
            Response.Redirect("UserAddUpdate.aspx?UserId=" + user.UserId);
        }
        protected void ButtonOKConfirm_Click(object sender, EventArgs e)
        {
            try
            { 
                User usr = (User)Session["Selected_User"]; 
                MySqlRepository.Delete(usr);
                LoadData();
            }
            catch (Exception x)
            {
                LabelError.Text = x.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ModalError", "$(document).ready(function () {$('#ModalError').modal();});", true);
            }
        }
        protected void ListViewData_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            lvDataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            LoadData();
        }
        protected void ButtonSearchUser_Click(object sender, EventArgs e)
        {
            LoadData();
        }

        protected void ButtonViewData_Click(object sender, EventArgs e)
        { 
            Control button = (Control)sender;
            ListViewDataItem item = (ListViewDataItem)button.BindingContainer;
            List<User> das = (List<User>)Session["List_User"];
        }
    }
}