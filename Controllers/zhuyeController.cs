using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using 栗子商城.Models;

namespace 栗子商城.Controllers
{
    public class ZhuyeController : Controller
    {

        public ActionResult wangyiyun() {
            return View();
        }

        // GET: zhuye
        public lizishoppingEntities shop = new lizishoppingEntities();
        //主页
        public ActionResult Index()
        {
            //ViewData["pro"] = shop.selproxiangqing_rexiao().ToList();
            var ss = (from a in shop.goodsSKUTables
                      join b in shop.goodsSPUTables on a.SPUID equals b.SPUID
                      join c in shop.ShopCategory on b.ShopID equals c.ShopID
                      select new SKUOrSPUOrShopCategory
                      {
                          SKUId = a.SKUId,
                          GoodPhoto = a.GoodPhoto,
                          SKUGoodName = a.SKUGoodName,
                          GoodPrice = a.GoodPrice,
                          onclicknum = a.onclicknum
                      }).OrderByDescending(s => s.onclicknum).Take(5).ToList();

            ViewData["pro"] = ss;



            ViewData["pro_2"] = shop.selspuandtype_top().ToList();

            ViewData["pro_3"] = shop.selspuandtype_id(1).ToList();

            ViewData["pro_4"] = shop.selspuandtype_id(8).ToList();

            ViewData["zuixin"] = shop.selpro_zuixin().ToList();



            return View();
        }

        //购物车
        public ActionResult shopcart(int UserID) {
            ViewData["pro_cart"] = shop.selprocart_userid(UserID).ToList();
            return View();
        }

        //用户昵称
        public ActionResult yonghunicheng(int UserID)
        {
            var data = shop.UserTable.FirstOrDefault(c => c.UserId == UserID);
            return Content(data.nicheng);
        }

        //购物车数据处理
        [HttpPost]
        public ActionResult shopcartinfo(ShoppCar cart)
        {
            ShoppCar c = new ShoppCar();
            c.SKUId = cart.SKUId;
            c.UserID = cart.UserID;
            shop.ShoppCar.Add(c);
            if (shop.SaveChanges()>0)
            {
                return Content("true");
            }
            else
            {
                return Content("false");
            }
        }
        //删除购物车
        [HttpPost]
        public ActionResult shopcartdel(ShoppCar sh)
        {
            ShoppCar s = shop.ShoppCar.FirstOrDefault(a=>a.ShopCardID == sh.ShopCardID);
            shop.ShoppCar.Remove(s);
            if (shop.SaveChanges() > 0)
            {
                return Content("true");
            }
            else
            {
                return Content("false");
            }
        }

        //商品详情
        public ActionResult pro_details(selproxaingqing_Result xq,int ? userid)
        {
            ViewBag.SKUId = xq.SKUId;
            //用户的点击次数
            goodsSKUTables sku_onclick = shop.goodsSKUTables.FirstOrDefault(d => d.SKUId == xq.SKUId);
            sku_onclick.onclicknum += 1;
            shop.SaveChanges();


            //热销榜的数据展示
            ViewData["pro"] = shop.selproxiangqing_rexiao().ToList();


            //商品详情的数据展示
            ViewData["pro_xq"] = shop.selpro_detials_id(xq.SKUId).ToList();

            ViewData["pro_img"] = shop.GoodImg.Where(s => s.SKUID == xq.SKUId).ToList();

            //下面的更多商品的数据展示
            ViewData["pro_top"] = shop.selspuandtype_top().ToList();
            //商品颜色显示
            ViewData["Color"] = shop.goodsSKUColor.Where(a => a.SKU_ID == xq.SKUId).ToList();

            //下面的商品评价数据展示
            ViewData["pro_pingjia"] = shop.selpro_pingjia_id(xq.SKUId).ToList();
            return View();
        }

        //商品详情分部视图
        public ActionResult pro_details_fenbu(int ? userid,int ? skuid)
        {
            ViewBag.pingjia = shop.UserTable.FirstOrDefault(x => x.UserId == userid);
            ViewBag.skuid = skuid;
            return View();
        }



        //结账页面
        public ActionResult checkout(selpro_detials_id_Result det,int ? UserID)
        {
            ViewData["pro_detial"] = shop.selpro_detials_id(det.SKUId).ToList();
            int colorid = int.Parse(Request["ColorID"].ToString());
            ViewBag.color = shop.goodsSKUColor.FirstOrDefault(s => s.goodsSKUColor_ID == colorid).Color_Name;
            ViewData["pro_addres"] = shop.User_addressTable.Where(x=>x.UserId == UserID).ToList();
            return View();
        }

        //结账页面处理数据
        [ValidateInput(false)]
        public ActionResult checkoutinfo(OrderGoodslist ol,OrderInfo oi,int inventory)
        {
            shop.add_order(oi.UserId,oi.AddressId,oi.Total,oi.TranMoney,oi.PayState,oi.CreateTime,ol.SKUId,ol.GoodNum,ol.Color_Name,ol.GoodPrice);
            
            if (shop.SaveChanges()>0)
            {
                
                return Content("true");
            }
            else
            {
                goodsSKUTables sk = shop.goodsSKUTables.FirstOrDefault(c => c.SKUId == ol.SKUId);
                sk.SKUGoodName = sk.SKUGoodName;
                sk.Goods_Description = sk.Goods_Description;
                sk.GoodPrice = sk.GoodPrice;
                sk.inventory = inventory;
                sk.GoodPhoto = sk.GoodPhoto;
                sk.SPUID = sk.SPUID;
                shop.SaveChanges();
                return Content("false");
            }
            
        }

        //用户主页
        public ActionResult userzhuye(int? UserID)
        {
            ViewData["user_info"] = shop.UserTable.Where(x => x.UserId == UserID).ToList();

            ViewData["pro_addres"] = shop.User_addressTable.Where(x => x.UserId == UserID).ToList();

            ViewData["pro_yifukuan"] = shop.selproorders_zhuangtai(UserID, "已付款").OrderByDescending(s => Convert.ToDateTime(s.CreateTime)).ToList();

            ViewData["pro_weifukuan"] = shop.selproorders_zhuangtai(UserID,"未付款").OrderByDescending(s => Convert.ToDateTime(s.CreateTime) ).ToList();

            return View();
        }

        public ActionResult Del_Order(int ? Order_Id) {
            var order = shop.OrderInfo.FirstOrDefault(x=>x.OrderID == Order_Id);
            shop.OrderInfo.Remove(order);
            if (shop.SaveChanges() > 0)
            {
                return Content("true");
            }
            else
            {
                return Content("false");
            }

            
        }

        //用户信息修改
        public ActionResult xinxixiiugai(UserTable u)
        {
            UserTable user = shop.UserTable.FirstOrDefault(c => c.UserId == u.UserId);
            user.UserPassWord = u.UserPassWord;
            user.nicheng = u.nicheng;
            if (shop.SaveChanges()>0)
            {
                return Content("true");
            }
            else
            {
                return Content("false");
            }
        }

        //商品评价
        public ActionResult shop_pingjia(Appraise app)
        {
            //商品详情的数据展示
            ViewData["pro_xq"] = shop.selpro_detials_id(app.SKUId).ToList();
            ViewBag.nicheng = shop.UserTable.FirstOrDefault(g => g.UserId == app.UserId).nicheng;
            return View();
        }

        //商品评价数据处理
        public ActionResult shop_pingjiainfo(Appraise app)
        {
            Appraise a = new Appraise();
            a.content = app.content;
            a.Grade = app.Grade;
            a.Ratetime = app.Ratetime;
            a.SKUId = app.SKUId;
            a.UserId = app.UserId;
            shop.Appraise.Add(a);
            if (shop.SaveChanges()>0)
            {
                return Content("true");
            }
            else
            {
                return Content("false");
            }
            
        }


        //付款状态
        public ActionResult zhuangtai_付款(OrderInfo oi)
        {
            OrderInfo order = shop.OrderInfo.FirstOrDefault(s=>s.OrderID == oi.OrderID);
            order.UserId = order.UserId;
            order.AddressId = order.AddressId;
            order.Total = order.Total;
            order.TranMoney = order.TranMoney;
            order.PayState = "已付款";
            order.CreateTime = order.CreateTime;
            if (shop.SaveChanges() > 0)
            {
                return Content("true");
            }
            else
            {
                return Content("false");
            }
        }

        //收货地址
        [HttpPost]
        public ActionResult shopaddressinfo(User_addressTable addres)
        {
            User_addressTable ur = new User_addressTable();
            ur.consigneeName = addres.consigneeName;
            ur.Adress = addres.Adress;
            ur.postal_code = addres.postal_code;
            ur.contact_way = addres.contact_way;
            ur.UserId = addres.UserId;
            ur.default_Address = addres.default_Address;
            shop.User_addressTable.Add(ur);
            if (shop.SaveChanges()>0)
            {
                return Content("true");

            }
            else
            {
                return Content("false");
            }
        }


        //用户搜索数据处理
        public ActionResult serach_pro(string SKUGoodName)
        {
            ViewData["pro_serach"] = shop.selpro_detials_SKUGoodName("%" + SKUGoodName + "%").ToList();
            ViewData["pro_serach"] = shop.goodsSKUTables.Where(s => s.SKUGoodName.Contains(SKUGoodName)).ToList();

            return View();
        }

        //用户分类查看
        public ActionResult serach_fenlei(int ? ShopID)
        {
            ViewData["pro_fenlei"] = shop.selspuandtype_id(ShopID).ToList();
            ViewBag.titles = Request["title"];
            return View();
        }

        //模态框展示
        public ActionResult motaichakan(int ? SKUId) {
            List<selpro_detials_id_Result> list = shop.selpro_detials_id(SKUId).ToList();

            if (list != null)
            {
                return Content(list[0].GoodPhoto +"分隔符"+ list[0].Photo_one + "分隔符" + list[0].Photo_two + "分隔符" + list[0].Photo_three + "分隔符" + list[0].Photo_four + "分隔符" + list[0].Photo_five + "分隔符" + list[0].SKUGoodName + "分隔符" + list[0].GoodPrice + "分隔符" + list[0].SPUGoodName + "分隔符" + list[0].Goods_Description + "分隔符" + list[0].SKUId);
            }
            else
            {
                return Content("false");
            }
        }
        //添加收藏
        public ActionResult add_shoucang()
        {
            int skuid = int.Parse(Request["SKUID"]);
            int shoucang_state = int.Parse(Request["shoucang"]);
            int userid = int.Parse(Request["UserID"]);
            shoucang shoucang = shop.shoucang.FirstOrDefault(s => s.SKUID ==skuid && s.UserID == userid);
            if (shoucang == null)
            {
                shoucang shoucang1 = new shoucang();
                shoucang1.SKUID = skuid;
                shoucang1.shoucang_state = 1;
                shoucang1.UserID = userid;
                shop.shoucang.Add(shoucang1);
                if (shop.SaveChanges()>0)
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
    }
}