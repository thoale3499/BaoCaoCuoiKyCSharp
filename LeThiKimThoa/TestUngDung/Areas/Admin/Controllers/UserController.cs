using ModelEF;
using ModelEF.DAO;
using ModelEF.Model;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TestUngDung.Areas.Admin.Controllers
{
    public class UserController : Controller
    {
        //GET: Admin/User
        public ActionResult Index(int page = 1, int pagesize = 5)
        {
            var user = new UserDAO();
            var model = user.ListAll();
            return View(model.ToPagedList(page, pagesize));
        }

        [HttpPost]
        public ActionResult Index(string searchString, int page = 1, int pagesize = 5)
        {
            var user = new UserDAO();
            var model = user.ListWhereAll(searchString, page, pagesize);
            ViewBag.SearchString = searchString;
            return View(model.ToPagedList(page, pagesize));
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        protected void SetAlert(string message, string type)
        {
            TempData["AlertMessage"] = message;
            if (type == "success")
            {
                TempData["AlertType"] = "alert-success";
            }
            else if (type == "warning")
            {
                TempData["AlertType"] = "alert-warning";
            }
            else if (type == "error")
            {
                TempData["AlertType"] = "alert-danger";
            }
        }
        [HttpPost]
        public ActionResult Create(UserAccount model)
        {
            var dao = new UserDAO();
            if (dao.Find(model.UserName)!= null)
            {
                SetAlert("Tài khoản đã tồn tại", "error");
                return RedirectToAction("Create", "User");
            }
            var pass = Common.EncryptMD5(model.Password);
            model.Password = pass;
            string result = dao.Insert(model);
            if (!string.IsNullOrEmpty(result))
            {
                SetAlert("Tài khoản đã được thêm thành công", "success");
                return RedirectToAction("Index", "User");
            }
            else
            {
                ModelState.AddModelError("", "Tạo mới người dùng không thành công");
            }
            return View();
        }
        [HttpDelete]
        public ActionResult Delete(int id)
        {
            var dao = new UserDAO().Delete(id);
            return RedirectToAction("Index");
        }
    }
}