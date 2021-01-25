using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using 栗子商城.Models;

namespace 栗子商城.Controllers
{
    public class houtaiController : Controller
    {
        public lizishoppingEntities shop = new lizishoppingEntities();
        // GET: houtai
        public ActionResult Index()
        {
            ViewData["pro"] = shop.selproxaingqing().ToList();
            return View();
        }

        public ActionResult Pro_Index()
        {
            var list = shop.selspuandshoptype().ToList();
            return View(list);
        }

        public ActionResult Add_product()
        {

            ViewData["shopCategory"] = shop.ShopCategory.ToList();

            return View();
        }
        //商品添加处理
        [HttpPost]
        public ActionResult Addproductinfo(goodsSPUTables spu, goodsSKUTables sku, ShopCategory sc, HttpPostedFileBase file)
        {
            if (file != null)
            {
                if (file.ContentLength != 0)
                {
                    file.SaveAs(Server.MapPath("~/Content/img/product/" + file.FileName));
                }
            }
            goodsSPUTables gspu = new goodsSPUTables();
            gspu.SPUGoodName = spu.SPUGoodName;
            gspu.GoodInfo = spu.GoodInfo;
            gspu.ShopID = sc.ShopID;
            shop.goodsSPUTables.Add(gspu);
            if (shop.SaveChanges() > 0)
            {
                return Content("true");
            }
            else
            {
                return Content("false");
            }


        }


    }
}