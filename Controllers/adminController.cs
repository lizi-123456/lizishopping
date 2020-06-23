using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using 栗子商城.Models;

namespace 栗子商城.Controllers
{
    public class adminController : Controller
    {
        public lizishoppingEntities1 shop = new lizishoppingEntities1();
        // GET: admin

        //管理员登陆
        public ActionResult adminlogin()
        {
            return View();
        }
        //管理员登陆处理
        [HttpPost]
        public ActionResult adminlogininfo(MangeAdmin admin)
        {
            var data = shop.MangeAdmin.FirstOrDefault(s => s.Admins == admin.Admins && s.Pwd == admin.Pwd);
            if (data != null)
            {
                return Content("true");
            }
            else
            {
                return Content("false");
            }
        }

        //管理员注册
        public ActionResult adminzhuce()
        {
            return View();
        }
        //管理员注册处理
        public ActionResult adminzhuceinfo()
        {
            return View();
        }


        public ActionResult Index()
        {
            return View();
        }
        //商品管理主页
        public ActionResult pro_Index(int page = 1)
        {
            const int pageSize = 8;
            ViewData["pro"] = shop.selspuandshoptype().ToList().ToPagedList(page, pageSize); 
            var list = shop.selspuandshoptype().ToList().ToPagedList(page, pageSize);
            return View(list);
        }

        //商品添加
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
        //删除商品
        [HttpPost]
        public ActionResult prodel(int SPUID)
        {
            goodsSPUTables spu = shop.goodsSPUTables.FirstOrDefault(x => x.SPUID == SPUID);
            shop.goodsSPUTables.Remove(spu);
            if (shop.SaveChanges() > 0)
            {
                var gsku = shop.goodsSKUTables.Where(c => c.SPUID == spu.SPUID).ToList();
                foreach (var item in gsku)
                {
                    shop.goodsSKUTables.Remove(item);
                }
                if (shop.SaveChanges() > 0)
                {
                    return Content("true");
                }
                else
                {
                    return Content("false");
                }

            }
            else
            {
                return Content("false");
            }
        }

        //子商品管理主页
        public ActionResult prochild_Index(int page = 1)
        {
            const int pageSize = 8;
            ViewData["pro"] = shop.selproxaingqing().ToList();
            var list = shop.selproxaingqing().ToList().ToPagedList(page, pageSize);
            return View(list);
        }

        //子商品管理主页分部页
        public ActionResult prochild_Index_fenbu(string SKUGoodName)
        {
            ViewData["pro"] = shop.selproxaingqing().ToList();
            var list = shop.selpro_detials_SKUGoodName("%"+SKUGoodName+"%").ToList();
            return View(list);
        }

        //子商品添加
        public ActionResult addzzipro(goodsSPUTables spu)
        {
            ViewBag.SPUID = shop.goodsSPUTables.FirstOrDefault(d => d.SPUID == spu.SPUID).SPUID;
            ViewBag.SPUGoodName = shop.goodsSPUTables.FirstOrDefault(d => d.SPUID == spu.SPUID).SPUGoodName;
            return View();
        }
        //子商品添加处理
        [HttpPost]
        public ActionResult addzziproinfo(goodsSKUTables sku, HttpPostedFileBase file)
        {
            if (file != null)
            {
                if (file.ContentLength != 0)
                {
                    file.SaveAs(Server.MapPath("~/Content/img/product/" + file.FileName));
                }
            }

            goodsSKUTables gsku = new goodsSKUTables();
            gsku.SPUID = sku.SPUID;
            gsku.SKUGoodName = sku.SKUGoodName;
            gsku.Goods_Description = sku.Goods_Description;
            gsku.GoodPrice = sku.GoodPrice;
            gsku.inventory = sku.inventory;
            gsku.GoodPhoto = file.FileName;
            gsku.BusinName = "否";
            shop.goodsSKUTables.Add(gsku);
            shop.SaveChanges();
            return RedirectToAction("prochild_Index", "admin");
        }

        //删除子商品
        [HttpPost]
        public ActionResult prochilddel(int SKUId)
        {
            goodsSKUTables gsku = shop.goodsSKUTables.FirstOrDefault(x => x.SKUId == SKUId);
            shop.goodsSKUTables.Remove(gsku);
            if (shop.SaveChanges() > 0)
            {
                return Content("true");
            }
            else
            {
                return Content("false");
            }
        }

        //子商品添加更多图片
        public ActionResult addimg(goodsSKUTables gsku)
        {
            ViewBag.SKUId = shop.goodsSKUTables.FirstOrDefault(z => z.SKUId == gsku.SKUId).SKUId;
            return View();
        }
        //添加附图
        public ActionResult addimg_demo()
        {
            return View();
        }

        //添加附图
        public ActionResult addimg_demoinfo(List<HttpPostedFileBase> file)
        {
            ViewData["img"] = file;
            return View();
        }
        //子商品添加更多图片处理
        [HttpPost]
        public ActionResult addimginfo(goodsSKUTables gsku, HttpPostedFileBase file1, HttpPostedFileBase file2, HttpPostedFileBase file3, HttpPostedFileBase file4, HttpPostedFileBase file5)
        {
            if (file1 != null && file2 != null && file3 != null && file4 != null && file5 != null)
            {
                if (file1.ContentLength != 0 && file2.ContentLength != 0 && file3.ContentLength != 0 && file4.ContentLength != 0 && file5.ContentLength != 0)
                {
                    file1.SaveAs(Server.MapPath("~/Content/img/product/" + file1.FileName));
                    file2.SaveAs(Server.MapPath("~/Content/img/product/" + file2.FileName));
                    file3.SaveAs(Server.MapPath("~/Content/img/product/" + file3.FileName));
                    file4.SaveAs(Server.MapPath("~/Content/img/product/" + file4.FileName));
                    file5.SaveAs(Server.MapPath("~/Content/img/product/" + file5.FileName));
                }
            }
            GoodsPhotoTable tp = new GoodsPhotoTable();
            goodsSKUTables sku_fu = shop.goodsSKUTables.FirstOrDefault(x => x.SKUId == gsku.SKUId);
            sku_fu.BusinName = "是";
            tp.SKUId = gsku.SKUId;
            tp.Photo_one = file1.FileName;
            tp.Photo_two = file2.FileName;
            tp.Photo_three = file3.FileName;
            tp.Photo_four = file4.FileName;
            tp.Photo_five = file5.FileName;
            shop.GoodsPhotoTable.Add(tp);
            shop.SaveChanges();
            return RedirectToAction("prochild_Index", "admin");
        }

        //封禁和解封用户
        public ActionResult fengjinuser()
        {
            ViewData["users"] = shop.UserTable.ToList();
            return View();
        }

        //封禁和解封用户数据处理
        public ActionResult fengjinuserinfo(UserTable user)
        {
            UserTable u = shop.UserTable.FirstOrDefault(x => x.UserId == user.UserId);
            u.UserName = u.UserName;
            u.Email = u.Email;
            u.UserPassWord = u.UserPassWord;
            u.limits = u.limits;
            u.Userstatus = user.Userstatus;
            if (shop.SaveChanges() > 0)
            {
                return Content(u.Userstatus.ToString());
            }
            else
            {
                return Content("false");
            }
        }

        //订单管理
        public ActionResult order_manage()
        {
            ViewData["orders_all"] = shop.selproorders_all().ToList();
            return View();
        }

        //订单管理
        public ActionResult order_manageinfo(int OrderID)
        {
            shop.del_orders(OrderID);
            if (shop.SaveChanges()>0)
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