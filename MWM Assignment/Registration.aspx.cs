﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MWM_Assignment
{
    public partial class Registration : System.Web.UI.Page
    {
        private readonly string strConn = ConfigurationManager.ConnectionStrings["GearUpDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                divStatus.Visible = false;
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (checkNewUser())
            {
                if (insertUser())
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        private bool insertUser()
        {
            SqlConnection conn = new SqlConnection(strConn);
            conn.Open();

            string query = "insert into tblCustomers (name, email, password, address, profilePicture, dtAdded, active) values (@name, @email, @password, @address, @profilePicture, @dtAdded, @active)";

            // SQL Command
            SqlCommand comm = new SqlCommand(query, conn);
            comm.Parameters.AddWithValue("@name", txtName.Text.Trim());
            comm.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
            comm.Parameters.AddWithValue("@password", txtPassword.Text.Trim());
            comm.Parameters.AddWithValue("@address", "");
            comm.Parameters.AddWithValue("@profilePicture", "");
            comm.Parameters.AddWithValue("@dtAdded", DateTime.Now);
            comm.Parameters.AddWithValue("@active", 1);

            int result = comm.ExecuteNonQuery();
            if (result > 0)
            {
                conn.Close();
                setStatus(true, "Account successfully created on " + DateTime.Now.ToString());
                return true;
            }
            else
            {
                conn.Close();
                setStatus(false, "Something went wrong. Please try again.");
                return false;
            }
        }

        private bool checkNewUser()
        {
            SqlConnection conn = new SqlConnection(strConn);
            conn.Open();

            string query = "SELECT * FROM tblCustomers WHERE email = @email";

            SqlCommand conm = new SqlCommand(query, conn);
            conm.Parameters.AddWithValue("@email", txtEmail.Text.Trim());

            SqlDataReader reader = conm.ExecuteReader();
            if (reader.Read())
            {
                setStatus(false, "User already exists! Please try again with a different email address!");
                reader.Close();
                conn.Close();
                return false;
            }
            else
            {
                reader.Close();
                conn.Close();
                return true;
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