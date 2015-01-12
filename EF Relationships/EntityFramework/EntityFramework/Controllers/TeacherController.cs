using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EntityFramework.Models;

namespace EntityFramework.Controllers
{
    public class TeacherController : Controller
    {
        static DBExcersizeEntities DB = new DBExcersizeEntities();
        static Teacher objTeacher = null;
        public ActionResult Index()
        {
            return View();
        }

        public static List<Teacher> GetAllTeachers()
        {
            var teachrs = (from teachers in DB.Teachers select teachers).ToList();
            return teachrs;
        }

        public static Teacher GetTeacherById(int teachrid)
        {
            objTeacher = new Teacher();
            var teachr = (from teachers in DB.Teachers where teachers.TeacherId == teachrid select teachers).FirstOrDefault();
            objTeacher = (Teacher)teachr;
            DB.Detach(objTeacher);
            return objTeacher;

        }
    }
}
