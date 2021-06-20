using ModelEF.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using PagedList;
using ModelEF.DAO;

namespace TestUngDung.Areas.Shop.Controllers
{
    public class HomeController : Controller
    {
        // GET: Shop/Home

        public ActionResult Index()
        {
            var product = new ProductDAO();
            var model = product.ListAll();
            return View(model);
        }

    }
}