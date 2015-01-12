using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Mvc;
using Practice___MVC.Filters;
using Practice___MVC.Models;

namespace Practice___MVC.Controllers
{
    
    public class HomeController : Controller
    {
        
        //[CustomActionFilter]
        //[CopyCustomActionFilter]
        //[CustomExceptionFilter]
        // and so on...
        // Decorate them as per your need.
        public ActionResult Index()
        {
            ViewBag.Message = "Welcome to ASP.NET MVC!";
            return View();
        }
        
        public ActionResult About()
        {
            return View();
        }

        public ActionResult Filters()
        {
            return View();
        }
    }
}
