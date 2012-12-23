using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EntityFramework.Models;


namespace EntityFramework.Controllers
{

    public class CourseController : Controller
    {
        DBExcersizeEntities DB = new DBExcersizeEntities();
        Cours objCourse = new Cours();
        //Display all the courses
        public ActionResult Index()
        {
            var corses = (from courses in DB.Courses select courses).ToList();
            return View(corses);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        [ActionName("AddCourse")]
        public ActionResult AddCourseGet()
        {
            ViewData["Teachers"] = TeacherController.GetAllTeachers();
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [ActionName("AddCourse")]
        public ActionResult AddCoursePost(Cours crs)
        {
            objCourse = new Cours();
            objCourse = crs;
            objCourse.Teacher = TeacherController.GetTeacherById(int.Parse(Request.Form["TeacherId"]));
            DB.Courses.AddObject(objCourse);
            DB.SaveChanges();
            return RedirectToAction("Index", new { Controller = "Course" });
        }
    }
}
