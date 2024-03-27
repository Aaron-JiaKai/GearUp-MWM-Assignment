using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
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
            if (Session["uid"] == null)
            {
                Response.Redirect("~/");
                return;
            }

            if (!IsPostBack) populateUser();

        }

        private void populateUser()
        {
            string uid = Session["uid"].ToString();
            DataTable dt = getUser(uid);

            if (dt.Rows.Count == 1)
            {
                txtName.Text = dt.Rows[0]["name"].ToString().Trim();
                txtEmail.Text = dt.Rows[0]["email"].ToString().Trim();
                txtAddress.Text = dt.Rows[0]["address"].ToString().Trim();
                profileImage.Attributes["src"] = dt.Rows[0]["profilePicture"].ToString().Trim();
            }
        }

        private DataTable getUser(string uid)
        {
            // Open Connection
            SqlConnection conn = new SqlConnection(strConn);
            conn.Open();

            // Query
            string query = "select * from tblCustomers where id = @id";

            SqlCommand comm = new SqlCommand(query, conn);
            comm.Parameters.AddWithValue("@id", uid);

            // SQL Command
            SqlDataAdapter adapter = new SqlDataAdapter(comm);

            DataTable dt = new DataTable();
            adapter.Fill(dt);

            conn.Close();
            return dt;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }

        private void updateUser()
        {

        }
    }
}