using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MWM_Assignment
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] != null)
            {
                hLogin.Visible = false;
                hRegister.Visible = false;
            }
            else
            {
                hCart.Visible = false;
                hProfile.Visible = false;
                lbLogout.Visible = false;
            }

            if (Session["profileImg"] != null && Session["name"] != null)
            {
                imgProfile.ImageUrl = Session["profileImg"].ToString();
                lblProfile.Text = Session["name"].ToString();
            }

        }

        protected void lbLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

    }
}