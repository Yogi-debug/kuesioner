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
    public partial class UserAddUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["UserId"] != null)
                {
                    string user_id = Request.QueryString["UserId"];
                    loadUser(user_id);
                }
            }
        }

        private void loadUser(string user_id)
        {
            User user = MySqlRepository.GetById<User>(Convert.ToInt32(user_id));
            if (user != null)
            {
                TextBoxLoginID.Text = user.LoginId;
                TextBoxEmailID.Text = user.Email;
                TextBoxUserName.Text = user.Username; 
                CheckBoxAdminAccess.Checked = user.IsAdmin;
                TextBoxPassword.Text = user.Password;
            }
            Session["User"] = user;
        }

        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (TextBoxUserName.Text == "")
                    throw new Exception("User name cannot be blank");
                if (TextBoxLoginID.Text == "")
                    throw new Exception("Login ID cannot be blank");
                User user = (User)Session["User"];
                if (user == null)
                    user = new User();
                user.LoginId = TextBoxLoginID.Text;
                user.Email = TextBoxEmailID.Text;
                user.Username = TextBoxUserName.Text; 
                if(TextBoxPassword.Text.Length != 32 )
                    user.Password = Tools.MD5Hash(TextBoxPassword.Text);
                user.IsAdmin = CheckBoxAdminAccess.Checked;
                user.Active = true;
                MySqlRepository.InsertUpdate(user);
                Response.Redirect("Users.aspx");
            }
            catch (Exception x)
            {
                LabelError.Text = x.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "ErrorModal", "$(document).ready(function () {$('#ErrorModal').modal();});", true);
            }
        }
    }
}