using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EntityFramework.Models;

namespace EntityFramework.Controllers
{



    public class StudentController : Controller
    {
        //
        // GET: /Student/
        Student objstudent = null;
        Cours objcourse = null;
        Standard objstandard = null;
        List<Cours> lstcourse = null;
        List<Standard> lststandard = null;
        DBExcersizeEntities DB = new DBExcersizeEntities();
        //retrieve list of all students
        public ActionResult Index()
        {
            var studs = (from students in DB.Students select students).ToList();
            return View(studs);
        }

        public ActionResult GetDetails(int StudId)
        {
            var studentdetails = GetStudentDetailsByStudentId(StudId);
            return View(studentdetails);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        [ActionName("AddStudent")]
        public ActionResult AddStudentGet()
        {
            lststandard = new List<Standard>();
            List<Cours> lstcour = new List<Cours>();
            lstcourse = new List<Cours>();
            lstcourse = GetAllCourses();
            var standrds = (from standards in DB.Standards select new { standards.StandardId, standards.StandardName });
            ViewData["courses"] = lstcourse;
            ViewData["standards"] = standrds;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [ActionName("AddStudent")]
        public ActionResult AddStudentPost(FormCollection frmcollection)
        {

            objstudent = new Student();
            objstudent.StudentName = frmcollection["StudentName"];
            objstudent.Standard = GetStandardById(int.Parse(frmcollection["StandardId"]));
            lstcourse = GetAllCourses();
            foreach (Cours crs in lstcourse)
            {
                if ((frmcollection[crs.CourseName]).ToString().Contains("true"))
                {
                    objstudent.Courses.Add(GetCourseByName(crs.CourseName));
                }
            }
            DB.Students.AddObject(objstudent);
            DB.SaveChanges();
            return RedirectToAction("Index");
        }


        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult DeleteStudent(int StudId)
        {

            DB.Students.DeleteObject(GetStudentDetailsByStudentId(StudId));
            DB.SaveChanges();
            return RedirectToAction("Index");
        }

        public List<Student> GetStudentDetails()
        {
            var studentdetails = (from studdetails in DB.Students
                                    select studdetails).ToList();
            return studentdetails;
        }
        public Student GetStudentDetailsByStudentId(int StudId)
        {
            var studentdetails = (from studdetails in DB.Students
                                    where studdetails.StudentId == StudId
                                    select studdetails).FirstOrDefault();
            return (Student)studentdetails;
        }

        public List<Cours> GetAllCourses()
        {
            lstcourse = new List<Cours>();
            var courses = (from course in DB.Courses select course).ToList();
            foreach (Cours crs in courses)
            {
                objcourse = new Cours();
                objcourse.CourseId = crs.CourseId;
                objcourse.CourseName = crs.CourseName;
                objcourse.Location = crs.Location;
                lstcourse.Add(objcourse);
            }
            return lstcourse;
        }

        public Cours GetCourseByName(string coursename)
        {
            objcourse = new Cours();
            var cours = (from courses in DB.Courses where courses.CourseName == coursename select courses).FirstOrDefault();
            objcourse = (Cours)cours;
            return objcourse;
        }

        public Standard GetStandardById(int standardid)
        {
            objstandard = new Standard();
            var standard = (from standards in DB.Standards where standards.StandardId == standardid select standards).FirstOrDefault();
            objstandard = (Standard)standard;
            return objstandard;
        }
    }
}
