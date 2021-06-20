using ModelEF.DAO;
using ModelEF.Model;
using PagedList;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TestUngDung.Areas.Admin.Controllers
{
    public class ProductController : Controller
    {
        // GET: Admin/Product
        public ActionResult Index(int? page)
        {
            var product = new ProductDAO();
            var model = product.ListAll();
            LeThiKimThoaContext dbPro = new LeThiKimThoaContext();
            if (page == null) page = 1;
            int pageSize = 5;
            int pageNumber = (page ?? 1);
            return View(model.OrderBy(x => x.Quantity).ThenByDescending(y => y.UnitCost).ToPagedList(pageNumber, pageSize));
        }

        public ActionResult Details(string id)
        {
            var model = new ProductDAO().ViewDetail(id);
            return View(model);
        }

        [HandleError]
        [HttpGet]
        public ActionResult Create()
        {
            LeThiKimThoaContext dbPro = new LeThiKimThoaContext();
            ViewBag.typeListCreate = new SelectList(dbPro.Categories, "ID", "Name");
            return View();
        }

        [HandleError]
        [HttpPost]
        public ActionResult Create(Product createPro, HttpPostedFileBase file)
        {
            LeThiKimThoaContext dbPro = new LeThiKimThoaContext();
            ViewBag.typeListCreate = new SelectList(dbPro.Categories, "ID", "Name");
            var pro = dbPro.Products.SingleOrDefault(c => c.ID.Equals(createPro.ID));
            if (file != null)
            {
                if (file.ContentLength > 0)
                {
                    try
                    {
                        string nameFile = Path.GetFileName(file.FileName);
                        file.SaveAs(Path.Combine(Server.MapPath("/Images"), nameFile));
                        createPro.Image = "/Images/" + nameFile;
                    }
                    catch (Exception)
                    {
                        ViewBag.CreateProError = "Không thể chọn ảnh.";
                    }
                }
                try
                {
                    if (pro != null)
                    {
                        ViewBag.CreateProError = "Mã sản phẩm đã tồn tại.";
                    }
                    else
                    {
                        dbPro.Products.Add(createPro);
                        dbPro.SaveChanges();
                        ViewBag.CreateProError = "Thêm sản phẩm thành công.";
                    }
                }
                catch (Exception)
                {
                    ViewBag.CreateProError = "Không thể thêm sản phẩm.";
                }
            }
            else
            {
                ViewBag.HinhAnh = "Vui lòng chọn hình ảnh.";
            }
            return View();

        }
    }
}