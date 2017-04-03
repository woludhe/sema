using Microsoft.AspNet.Identity;
using Microsoft.Owin;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.Cookies;
using Owin;
using Microsoft.Owin.Security.Facebook;
using Microsoft.Owin.Security.Twitter;
using System.Web;
using System.Windows;

namespace Social_Semantics
{
    public partial class Startup {
        public string AccessCode
        {
            get
            {
                if (HttpContext.Current.Application["AccessToken"] != null)
                    return HttpContext.Current.Application["AccessToken"].ToString();
                else
                    return string.Empty;
            }
            set { HttpContext.Current.Application["AccessToken"] = value; }
        }

        public string AccessCodeSecret
        {
            get
            {
                if (HttpContext.Current.Application["AccessCodeSecret"] != null)
                    return HttpContext.Current.Application["AccessCodeSecret"].ToString();
                else
                    return string.Empty;
            }
            set { HttpContext.Current.Application["AccessCodeSecret"] = value; }
        }

        // For more information on configuring authentication, please visit http://go.microsoft.com/fwlink/?LinkId=301883
        public void ConfigureAuth(IAppBuilder app)
        {
            // Enable the application to use a cookie to store information for the signed in user
            // and also store information about a user logging in with a third party login provider.
            // This is required if your application allows users to login
            app.UseCookieAuthentication(new CookieAuthenticationOptions
            {
                AuthenticationType = DefaultAuthenticationTypes.ApplicationCookie,
                LoginPath = new PathString("/Account/Login")
            });
            app.UseExternalSignInCookie(DefaultAuthenticationTypes.ExternalCookie);

            // Uncomment the following lines to enable logging in with third party login providers
            //app.UseMicrosoftAccountAuthentication(
            //    clientIG: "",
            //    clientSecret: "");

            app.UseTwitterAuthentication(new TwitterAuthenticationOptions
            {
                ConsumerKey = "CTkIEDpt3z2fEixn4lvM5dIyu",
                ConsumerSecret = "HkCfchy87ZqIaa2rAraQeGbwXNts04AHBqg4A3M4CHt9KazTWI",
                BackchannelCertificateValidator = new CertificateSubjectKeyIdentifierValidator(
                new[]
                {
                    "A5EF0B11CEC04103A34A659048B21CE0572D7D47", // VeriSign Class 3 Secure Server CA - G2
                    "0D445C165344C1827E1D20AB25F40163D8BE79A5", // VeriSign Class 3 Secure Server CA - G3
                    "7FD365A7C2DDECBBF03009F34339FA02AF333133", // VeriSign Class 3 Public Primary Certification Authority - G5
                    "39A55D933676616E73A761DFA16A7E59CDE66FAD", // Symantec Class 3 Secure Server CA - G4
                    "4eb6d578499b1ccf5f581ead56be3d9b6744a5e5", // VeriSign Class 3 Primary CA - G5
                    "5168FF90AF0207753CCCD9656462A212B859723B", // DigiCert SHA2 High Assurance Server C‎A 
                    "B13EC36903F8BF4701D498261A0802EF63642BC3"  // DigiCert High Assurance EV Root CA
                }),
                Provider = new TwitterAuthenticationProvider
                {
                    OnAuthenticated = async context =>
                    {
                        // Retrieve the OAuth access token to store for subsequent API calls
                        AccessCode = context.AccessToken;
                        AccessCodeSecret = context.AccessTokenSecret;
                    }
                }
            });

            var options = new FacebookAuthenticationOptions
            {
                AppId = "112069712469758",
                AppSecret = "74b14723e5be3639f851a2751f791ea4",
                SignInAsAuthenticationType = Microsoft.Owin.Security.AppBuilderSecurityExtensions.GetDefaultSignInAsAuthenticationType(app),
                Provider = new FacebookAuthenticationProvider
                {
                    OnAuthenticated = async context =>
                    {
                        // Retrieve the OAuth access token to store for subsequent API calls
                        AccessCode = context.AccessToken;
                    }
                }
            };
            
            //options.Scope.Add("public_profile");
            //options.Scope.Add("email");
            options.Scope.Add("user_likes");
            app.UseFacebookAuthentication(options);

            //app.UseGoogleAuthentication();
        }
    }
}
