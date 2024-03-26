using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MWM_Assignment
{
    public partial class Login : System.Web.UI.Page
    {
        private readonly string strConn = ConfigurationManager.ConnectionStrings["GearUpDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (login())
            {
                setStatus(true, "Login Successful! Welcome back.");
                Response.Redirect("Default.aspx");
            } else
            {
                setStatus(false, "Login Failed! Please try again!");
            }

            
        }

        private bool login()
        {
            SqlConnection conn = new SqlConnection(strConn);
            conn.Open();

            string query = "SELECT * FROM tblCustomers WHERE email = @email AND password = @password";

            SqlCommand comm = new SqlCommand(query, conn);
            comm.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
            comm.Parameters.AddWithValue("@password", txtPassword.Text.Trim());

            SqlDataReader reader = comm.ExecuteReader();

            if (reader.Read())
            {
                Session["uid"] = reader["id"];
                Session["name"] = reader["name"];
                Session["profileImg"] = reader["profilePicture"];

                reader.Close();
                conn.Close();
                return true;
            }
            else
            {
                reader.Close();
                conn.Close();
                return false;
            }
        }

        private void setStatus(bool status, string message)
        {
            if (status)
            {
                lblStatusIcon.CssClass = "bi-check-circle";
                statusBg.Attributes["class"] = "text-center text-md-start py-2 px-3 px-xl-5 align-items-center text-white bg-success";
            }
            else
            {
                lblStatusIcon.CssClass = "bi-x-circle";
                statusBg.Attributes["class"] = "text-center text-md-start py-2 px-3 px-xl-5 align-items-center text-white bg-danger";
            }

            lblStatus.Text = message;

            divStatus.Visible = true;
        }
    }
}