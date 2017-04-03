using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Social_Semantics.Startup))]
namespace Social_Semantics
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
