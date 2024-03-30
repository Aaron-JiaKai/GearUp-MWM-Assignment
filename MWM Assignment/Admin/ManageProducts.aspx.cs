using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace MWM_Assignment.Admin
{
    public partial class ManageProducts : System.Web.UI.Page
    {
        private readonly string strConn = ConfigurationManager.ConnectionStrings["GearUpDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            MasterPage masterPage = (MasterPage)this.Master;
            HtmlAnchor anchor = (HtmlAnchor)masterPage.FindControl("hProducts");
            anchor.Attributes["class"] = "nav_link active";

            if (!IsPostBack) populateTable();

        }

        private void populateTable()
        {
            divProductDetails.Visible = false;

            DataTable dt = getProducts();

            lvProduct.DataSource = dt;
            lvProduct.DataBind();
        }

        private DataTable getProducts()
        {
            SqlConnection conn = new SqlConnection(strConn);
            conn.Open();

            string query = "SELECT *, p.name as 'prodName', c.name as 'catName' FROM tblProducts p INNER JOIN tblCategory c ON p.cid = c.cid ORDER BY p.active DESC";

            SqlDataAdapter da = new SqlDataAdapter(query, conn);

            DataTable dt = new DataTable();

            da.Fill(dt);

            return dt;
        }


        protected void lvProduct_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (lvProduct.FindControl("dpProduct") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.populateTable();
        }

        protected void lvProduct_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            string pid;
            pid = e.CommandArgument.ToString();

            if (pid == string.Empty)
            {
                setStatus(false, "An error occurred: User ID not found!");
                return;
            }

            hfUid.Value = pid;

            switch (e.CommandName)
            {
                case "updateProduct":
                    populateUserDetails(pid);
                    divProductDetails.Visible = true;
                    break;
                case "deleteProduct":
                    deleteProduct(pid);
                    break;
                case "restoreProduct":
                    restoreProduct(pid);
                    break;
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

        private void deleteProduct(string pid)
        {
            SqlConnection conn = new SqlConnection(strConn);
            conn.Open();

            using (SqlTransaction transaction = conn.BeginTransaction())
            {
                try
                {
                    // Query
                    string query = "UPDATE tblProducts SET active = 0 WHERE pid= @pid";
                    SqlCommand comm = new SqlCommand(query, conn, transaction);
                    comm.Parameters.AddWithValue("@pid", pid);

                    comm.ExecuteNonQuery();

                    transaction.Commit();
                    setStatus(true, "Account has been deactivated");
                    populateTable();
                }
                catch (Exception e)
                {
                    transaction.Rollback();
                    setStatus(false, e.Message);
                    return;
                }
            }
        }

        private void restoreProduct(string pid)
        {
            SqlConnection conn = new SqlConnection(strConn);
            conn.Open();

            using (SqlTransaction transaction = conn.BeginTransaction())
            {
                try
                {
                    // Query
                    string query = "UPDATE tblProducts SET active = 1 WHERE pid= @pid";
                    SqlCommand comm = new SqlCommand(query, conn, transaction);
                    comm.Parameters.AddWithValue("@pid", pid);

                    comm.ExecuteNonQuery();

                    transaction.Commit();
                    setStatus(true, "Account has been reactivated!");
                    populateTable();
                }
                catch (Exception e)
                {
                    transaction.Rollback();
                    setStatus(false, e.Message);
                    return;
                }
            }
        }

        private void populateUserDetails(string pid)
        {
            DataTable dt = getProduct(pid);

            if (dt.Rows.Count > 0)
            {
                txtName.Text = dt.Rows[0]["name"].ToString().Trim();
                productImage.Attributes["src"] = dt.Rows[0]["image"].ToString().Trim();
            }
        }

        private DataTable getProduct(string pid)
        {
            SqlConnection conn = new SqlConnection(strConn);
            conn.Open();

            string query = "SELECT *, c.name as 'catName' FROM tblProducts p INNER JOIN tblProducts c ON p.cid = c.cid WHERE pid = @pid";

            SqlCommand comm = new SqlCommand(query, conn);
            comm.Parameters.AddWithValue("pid", pid);

            SqlDataAdapter da = new SqlDataAdapter(comm);

            DataTable dt = new DataTable();

            da.Fill(dt);

            return dt;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string uid = hfUid.Value.ToString();

            if (uid == string.Empty) return;

            updateProduct(uid);
            populateTable();
        }

        private void updateProduct(string pid)
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
                        string query = "UPDATE tblProducts SET name = @name WHERE pid=@pid";
                        SqlCommand comm = new SqlCommand(query, conn, transaction);
                        comm.Parameters.AddWithValue("@name", txtName.Text.Trim());
                        comm.Parameters.AddWithValue("@pid", pid);

                        comm.ExecuteNonQuery();
                    }

                    if (fuProduct.HasFile)
                    {
                        string url = updateImage();
                        string query = "UPDATE tblProducts SET image = @image WHERE pid=@pid";
                        SqlCommand comm = new SqlCommand(query, conn, transaction);
                        comm.Parameters.AddWithValue("@image", url);
                        comm.Parameters.AddWithValue("@pid", pid);

                        comm.ExecuteNonQuery();
                    }

                    transaction.Commit();
                    setStatus(true, "User Details has been updated successfully!");
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

        string updateImage()
        {
            string fileUrl;

            if (fuProduct.HasFile)
            {
                string ext = Path.GetExtension(fuProduct.FileName);

                string directory = Server.MapPath("~//Images//Category//");
                if (!System.IO.Directory.Exists(directory))
                {
                    System.IO.Directory.CreateDirectory(directory);
                }
                string[] files = Directory.GetFiles(directory);

                foreach (string file in files)
                {
                    if (Path.GetFileNameWithoutExtension(file) == txtName.Text.ToString())
                    {
                        System.IO.File.Delete(file);
                    }
                }

                string filePath = Server.MapPath("~//Images//Category//" + txtName.Text + ext);

                fuProduct.SaveAs(filePath);

                fileUrl = "~/Images/Category/" + txtName.Text + ext;
            }
            else
            {
                fileUrl = "~/Images/Placeholder/placeholder.jpg";
            }

            return fileUrl;
        }
    }
}