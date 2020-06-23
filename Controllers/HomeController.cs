using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using 栗子商城.Models;

namespace 栗子商城.Controllers
{
    public class HomeController : Controller
    {
        public lizishoppingEntities1 shop = new lizishoppingEntities1();
        public ActionResult Index()
        {
            ViewData["pro"] = shop.selspuandshoptype().ToList();
            return View();
        }
    }
}