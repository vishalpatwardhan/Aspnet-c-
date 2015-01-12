using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using Practice___MVC.Controllers;
using Practice___MVC.Filters;
namespace Practice___MVC
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801
   
    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            //filters.Add(new HandleErrorAttribute());
        }

        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "Home", action = "Index", id = UrlParameter.Optional } // Parameter defaults
            );

        }

        

        protected void Application_Start()
        {
            //AreaRegistration.RegisterAllAreas();

            // Uncomment the Code to use the CustomerAuthorizeFilter Globally.
            //GlobalFilters.Filters.Add(new CustomAuthorizeFilter());
            //RegisterGlobalFilters(GlobalFilters.Filters);
            
            RegisterRoutes(RouteTable.Routes);

            // Uncomment the Code to use CustomerAuthorizeFilter at specific action i.e. HomeController's About.
            //IEnumerable<Func<ControllerContext, ActionDescriptor, object>> conditions =
            //new Func<ControllerContext, ActionDescriptor, object>[] { (c, a) => c.Controller.Equals("HomeController"), (c, a) => a.ActionName.Equals("About") ? new CustomAuthorizeFilter() : null };
            //var provider = new FilterProvider(conditions);
            //FilterProviders.Providers.Add(provider);
        }
    }
}