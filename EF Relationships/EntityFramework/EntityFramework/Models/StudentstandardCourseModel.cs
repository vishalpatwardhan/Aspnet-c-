using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EntityFramework.Models
{
    public class StudentstandardCourseModel
    {
        public Student Stud{get;set;}
        public Standard standrd { get; set; }
        public List<Cours> Course { get; set; }
        
    }
}