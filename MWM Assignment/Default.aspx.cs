using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MWM_Assignment
{
    public partial class _Default : Page
    {
        private string strConn = ConfigurationManager.ConnectionStrings["GearUpDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] != null)
            {
            }
            else
            {
            }

            if (!IsPostBack)
            {
                loadProducts();
                loadCategories();
            }
        }
        private void loadProducts()
        {
            DataTable dt = getRandomProducts();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                dt.Rows[i]["image"] = dt.Rows[i]["image"].ToString().Remove(0, 1);
            }

            lvCarousel.DataSource = dt;
            lvCarousel.DataBind();
        }

        private void loadCategories()
        {
            DataTable dt = getCategoryImages();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                dt.Rows[i]["image"] = dt.Rows[i]["image"].ToString().Remove(0, 1);
            }

            lvCategories.DataSource = dt;
            lvCategories.DataBind();

        }

        protected string getActiveClass(int index)
        {
            if (index == 0)
            {
                return "active";
            }
            else
            {
                return "";
            }
        }


        private DataTable getRandomProducts()
        {
            // Open Connection
            SqlConnection conn = new SqlConnection(strConn);
            conn.Open();

            // Query
            string query = "select top(5) * from tblProducts order by newid()";

            // SQL Command
            SqlDataAdapter adapter = new SqlDataAdapter(query, conn);

            DataTable dt = new DataTable();
            adapter.Fill(dt);

            conn.Close();
            return dt;
        }

        private DataTable getCategoryImages()
        {
            // Open Connection
            SqlConnection conn = new SqlConnection(strConn);
            conn.Open();

            string query = "select p.cid, min(image) as 'image',  min(c.name) as 'name', min(c.description) as 'description' from tblProducts p inner join tblCategory c on p.cid = c.cid where c.active = 1 group by p.cid";

            // SQL Command
            SqlDataAdapter adapter = new SqlDataAdapter(query, conn);

            DataTable dt = new DataTable();
            adapter.Fill(dt);

            conn.Close();
            return dt;
        }

        protected void lvCategories_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "showDetails")
            {
                string pid = "";

                // Command Argument Method
                pid = e.CommandArgument.ToString();

                // Find Control Method
                Label pidLabel = e.Item.FindControl("pidLabel") as Label;
                pid = pidLabel.Text;

                Session["pid"] = pid;

                Response.Redirect("ProductDetails.aspx");
            }
        }


        private DataTable getProducts()
        {
            // Open Connection
            SqlConnection conn = new SqlConnection(strConn);
            conn.Open();

            // Query
            string query = "select * from tblProducts";

            // SQL Command
            SqlDataAdapter adapter = new SqlDataAdapter(query, conn);

            DataTable dt = new DataTable();
            adapter.Fill(dt);

            conn.Close();
            return dt;
        }

        private DataTable getCategories()
        {
            // Open Connection
            SqlConnection conn = new SqlConnection(strConn);
            conn.Open();

            // Query
            string query = "select * from tblCategory";

            // SQL Command
            SqlDataAdapter adapter = new SqlDataAdapter(query, conn);

            DataTable dt = new DataTable();
            adapter.Fill(dt);

            conn.Close();
            return dt;
        }
    }
}