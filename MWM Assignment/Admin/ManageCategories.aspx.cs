using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace MWM_Assignment.Admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MasterPage masterPage = (MasterPage)this.Master;
            HtmlAnchor anchor = (HtmlAnchor)masterPage.FindControl("hCategories");
            anchor.Attributes["class"] = "nav_link active";
        }
    }
}