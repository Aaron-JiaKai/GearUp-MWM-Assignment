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
    public partial class Orders : System.Web.UI.Page
    {
        private readonly string strConn = ConfigurationManager.ConnectionStrings["GearUpDB"].ConnectionString;

        private readonly Dictionary<int, string> statusDictionary = new Dictionary<int, string>()
        {
           { 1, "Paid" },
           { 2, "Shipped" },
           { 3, "Delivered" },
           { 4, "Cancelled" },
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] == null)
            {
                Response.Redirect("~/");
                return;
            }

            populateData();
        }

        private void populateData()
        {
            DataTable dtPaid = getOrders(1);
            dlPaid.DataSource = dtPaid;
            dlPaid.DataBind();

            DataTable dtShipped = getOrders(2);
            dlShipped.DataSource = dtShipped;
            dlShipped.DataBind();

            DataTable dtDelivered = getOrders(3);
            dlDelivered.DataSource = dtDelivered;
            dlDelivered.DataBind();

            DataTable dtCancelled = getOrders(4);
            dlCancelled.DataSource = dtCancelled;
            dlCancelled.DataBind();
        }

        private DataTable getOrders(int statusCd)
        {
            SqlConnection conn = new SqlConnection(strConn);
            conn.Open();

            string status = statusDictionary[statusCd];

            string query = "select o.oid,sum(o.subTotal + o.tax) as 'subtotal',min(o.pid) as 'pid', (select qty from tblOrders o2 where o2.oid = min(o.oid) and o2.pid = min(o.pid)) as 'qty', (select dtAdded from tblOrders o2 where o2.oid = min(o.oid) and o2.pid = min(o.pid)) as 'dtAdded', (select status from tblOrders o2 where o2.oid = min(o.oid) and o2.pid = min(o.pid)) as 'status' ,(select name from tblProducts where pid = min(o.pid)) as 'name',(select image from tblProducts where pid = min(o.pid)) as 'image',count(*) as 'items' FROM tblOrders o where status = @status GROUP BY o.oid order by min(o.dtAdded) desc;";

            // SQL Command
            SqlCommand comm = new SqlCommand(query, conn);
            comm.Parameters.AddWithValue("@status", status);

            SqlDataAdapter da = new SqlDataAdapter(comm);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }
    }
}