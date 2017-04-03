using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace Social_Semantics
{
    public partial class JSDetect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.HttpMethod.Equals("POST")) //if javascript called the refresh function
            {
                Session["jsActive"] = 1;
                Response.Redirect(HttpContext.Current.Request.QueryString["url"].ToString());
            }
            else
            {   //init non javascript off
                Session["jsActive"] = 0;
                refreshCommand.Content = "2; url=" + Request.QueryString["url"].ToString();
            }
        }
    }
}