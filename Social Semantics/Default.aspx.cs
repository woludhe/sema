using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Social_Semantics
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["provider"] == null)
            {
                Context.GetOwinContext().Authentication.SignOut();
                return;
            }

            if (Session["AccessToken"] == null)
            {
                Startup su = new Startup();
                string strAccessCode = su.AccessCode;
                Session["AccessToken"] = string.IsNullOrEmpty(strAccessCode) ? null : strAccessCode;

                if (Session["provider"].ToString().ToUpper() == "TWITTER")
                {
                    string strAccessCodeSecret = su.AccessCodeSecret;
                    Session["AccessTokenSecret"] = string.IsNullOrEmpty(strAccessCodeSecret) ? null : strAccessCodeSecret;
                }
            }
        }
    }
}