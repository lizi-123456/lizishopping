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
        // GET: Home
        public lizishoppingEntities shop = new lizishoppingEntities();
        //主页
        public ActionResult Index()
        {
            ViewData["pro"] = shop.selproxiangqing_rexiao().ToList();

            ViewData["pro_2"] = shop.selspuandtype_top().ToList();

            ViewData["pro_3"] = shop.selspuandtype_id(1).ToList();

            ViewData["pro_4"] = shop.selspuandtype_id(8).ToList();

            ViewData["zuixin"] = shop.selpro_zuixin().ToList();
            return View();
        }
    }
}