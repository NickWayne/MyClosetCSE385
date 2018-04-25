using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Clothes.Startup))]
namespace Clothes
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
