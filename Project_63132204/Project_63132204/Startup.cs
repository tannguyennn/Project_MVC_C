using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Project_63132204.Startup))]
namespace Project_63132204
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
