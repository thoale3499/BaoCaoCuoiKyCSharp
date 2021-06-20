using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace TestUngDung.Areas.Admin.Models
{
    public class LoginModel
    {
        public int id { get; set; }
        [Required]
        public string username { get; set; }
        public string password { get; set; }
        public string status { get; set; }
    }
}