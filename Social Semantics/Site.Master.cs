using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace Social_Semantics
{
    public partial class SiteMaster : MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;
        bool jsEnabled = false;

        protected void Page_Init(object sender, EventArgs e)
        {
            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsJavascriptActive)
            {
                //Response.Write("Javascript active");
            }
            else
            {
                divJava.Style.Add("display", "");
            }
        }

        #region Check Java Enable
        /// <summary>
        /// boolean indicating if javascript is active on the client browser
        /// </summary>
        public static bool IsJavascriptActive
        {
            get
            {
                bool active = false;
                HttpContext context = HttpContext.Current;
                if (!context.Request.Browser.Crawler)
                {
                    if (context.Session["jsActive"] == null)
                    {
                        context.Response.Redirect("/JSDetect.aspx?url=" + context.Request.Url.AbsoluteUri.ToString() + " ", true);
                    }
                    else
                    {
                        if (context.Session["jsActive"].ToString().Equals("0"))
                        {
                            active = false;
                        }
                        else if (context.Session["jsActive"].ToString().Equals("1"))
                        {
                            active = true;
                        }
                    }
                }
                return active;
            }
        }
        /// <summary>
        /// Domain name and port
        /// </summary>
        public static string ClientDomainName
        {
            get
            {
                return HttpContext.Current.Request.Url.AbsoluteUri.Substring(0, HttpContext.Current.Request.Url.AbsoluteUri.Length - HttpContext.Current.Request.Url.PathAndQuery.Length);
            }
        }

        #endregion

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut();
            //Clear Sessions
            Session.Clear();
        }
    }

}