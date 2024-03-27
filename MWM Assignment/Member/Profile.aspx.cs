﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
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
            string uid = Session["uid"].ToString();
            updateUser(uid);
            updateUserSession();
        }

        private void updateUserSession()
        {
            DataTable dt = getUser(Session["uid"].ToString());

            if (dt.Rows.Count == 1)
            {
                Session["name"] = dt.Rows[0]["name"].ToString().Trim();
                Session["profileImg"] = dt.Rows[0]["profilePicture"].ToString().Trim();
            }

            Response.Redirect("Profile.aspx");
        }

        private void updateUser(string uid)
        {
            // Open Connection
            SqlConnection conn = new SqlConnection(strConn);
            conn.Open();

            using (SqlTransaction transaction = conn.BeginTransaction())
            {
                try
                {
                    if (txtName.Text != "")
                    {
                        // Query
                        string query = "UPDATE tblCustomers SET name = @name WHERE id=@id";
                        SqlCommand comm = new SqlCommand(query, conn, transaction);
                        comm.Parameters.AddWithValue("@name", txtName.Text);
                        comm.Parameters.AddWithValue("@id", uid);

                        comm.ExecuteNonQuery();
                    }

                    if (txtAddress.Text != "")
                    {
                        // Query
                        string query = "UPDATE tblCustomers SET address = @address WHERE id=@id";
                        SqlCommand comm = new SqlCommand(query, conn, transaction);
                        comm.Parameters.AddWithValue("@address", txtAddress.Text);
                        comm.Parameters.AddWithValue("@id", uid);

                        comm.ExecuteNonQuery();
                    }

                    if (txtPassword.Text != "" && (txtPassword.Text == txtConfirmPassword.Text))
                    {
                        // Query
                        string query = "UPDATE tblCustomers SET password = @password WHERE id=@id";
                        SqlCommand comm = new SqlCommand(query, conn, transaction);
                        comm.Parameters.AddWithValue("@password", txtPassword.Text);
                        comm.Parameters.AddWithValue("@id", uid);

                        comm.ExecuteNonQuery();
                    }

                    if (fuProfile.HasFile)
                    {
                        string url = updateImage();
                        string query = "UPDATE tblCustomers SET profilePicture = @profilePicture WHERE id=@id";
                        SqlCommand comm = new SqlCommand(query, conn, transaction);
                        comm.Parameters.AddWithValue("@profilePicture", url);
                        comm.Parameters.AddWithValue("@id", uid);

                        comm.ExecuteNonQuery();
                        
                    }
                    transaction.Commit();
                    conn.Close();
                }
                catch (Exception ex) 
                {
                    transaction.Rollback();
                    setStatus(false, ex.Message);
                    conn.Close();
                }
            }
        }

        private string updateImage()
        {
            string fileUrl;

            if (fuProfile.HasFile)
            {
                string ext = Path.GetExtension(fuProfile.FileName);

                string directory = Server.MapPath("~//Images//Profile//");
                if (!System.IO.Directory.Exists(directory))
                {
                    System.IO.Directory.CreateDirectory(directory);
                }
                string[] files = Directory.GetFiles(directory);
                foreach (string file in files)
                {
                    if (Path.GetFileNameWithoutExtension(file) == txtName.Text)
                    {
                        System.IO.File.Delete(file);
                    }
                }

                string filePath = Server.MapPath("~//Images//Profile//" + txtName.Text + ext);

                fuProfile.SaveAs(filePath);

                fileUrl = "~/Images/Profile/" + txtName.Text + ext;
            }
            else
            {
                fileUrl = "~/Images/Placeholder/placeholder-user";
            }

            return fileUrl;
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