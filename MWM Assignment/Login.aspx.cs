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
            SqlConnection conn = new SqlConnection(strConn);
            conn.Open();

            string query = "SELECT * FROM tblCustomers WHERE email = @email AND password = @password";

            SqlCommand conm = new SqlCommand(query, conn);
            conm.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
            conm.Parameters.AddWithValue("@password", txtPassword.Text.Trim());

            SqlDataReader reader = conm.ExecuteReader();
            if (reader.Read())
            {
                Response.Write("LOGIN SUCCESS");
                Session["uid"] = reader["id"];
                Session["name"] = reader["name"];
                Response.Redirect("Default.aspx");
            }
            else
            {
                Response.Write("LOGIN FAILED");
            }

            reader.Close();
            conn.Close();
        }
    }
}