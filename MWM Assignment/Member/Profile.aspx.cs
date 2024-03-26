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
    public partial class Profile : System.Web.UI.Page
    {
        private readonly string strConn = ConfigurationManager.ConnectionStrings["GearUpDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["uid"] == null)
                {
                    Response.Redirect("../Default.aspx");
                }
                else
                {
                    populateFields(Session["uid"].ToString());
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
        }

        private void populateFields(String id)
        {
            SqlConnection conn = new SqlConnection(strConn);
            conn.Open();

            string query = "SELECT * FROM tblCustomers WHERE id = @id;";

            SqlCommand conm = new SqlCommand(query, conn);
            conm.Parameters.AddWithValue("@id", id.Trim());

            SqlDataReader reader = conm.ExecuteReader();
            if (reader.Read())
            {
                txtEmail.Text = reader["email"].ToString();
                txtName.Text = reader["name"].ToString();
                lblCurrentDt.Text = DateTime.Now.ToString();
            }

            reader.Close();
            conn.Close();
        }

        private String getNewName(String id)
        {
            string newName = "";
            SqlConnection conn = new SqlConnection(strConn);
            conn.Open();

            string query = "SELECT name FROM tblCustomers WHERE id = @id;";

            SqlCommand conm = new SqlCommand(query, conn);
            conm.Parameters.AddWithValue("@id", id.Trim());

            SqlDataReader reader = conm.ExecuteReader();
            if (reader.Read())
            {

                newName = reader["name"].ToString();
            }

            reader.Close();
            conn.Close();
            return newName;
        }
    }
}