using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using 栗子商城.Models;

namespace 栗子商城.Controllers
{
    public class kuangjiaController : Controller
    {
        public lizishoppingEntities shop = new lizishoppingEntities();
        // GET: admin
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult left()
        {
            return View();
        }

        public ActionResult main()
        {
            return View();
        }
        public ActionResult footer()
        {
            return View();
        }
        public ActionResult content(int page = 1)
        {
            const int pageSize = 8;
            ViewData["pro"] = shop.selproxaingqing().ToList();
            var list = shop.selproxaingqing().ToList().ToPagedList(page, pageSize);
            return View(list);
        }
        public ActionResult top()
        {
            return View();
        }

        public ActionResult adminlogin() {
            return View();
        }

        public ActionResult List(int page = 1)
        {
            const int pageSize = 10;
            //var students = entities.T_Student.OrderBy(s => s.Id).Skip((page - 1) * 2).Take(2);
            List<selproxaingqing_Result> data = shop.selproxaingqing().ToList();
            var students = data.ToPagedList(page, pageSize);
            return View(students);
        }
    }
}