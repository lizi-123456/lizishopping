using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using 栗子商城.Models;

namespace 栗子商城.Controllers
{
    public class loginRegisterController : Controller
    {

        public lizishoppingEntities shop = new lizishoppingEntities();
        //public shoppingEntities1 shop = new shoppingEntities1();

        // GET: loginRegister
        public ActionResult Index()
        {
            return View();
        }
        //用户登录
        public ActionResult Login()
        {
            return View();
        }
        //用户登录处理方法
        [HttpPost]
        public ActionResult Logininfo(UserTable u)
        {

            var data = shop.UserTable.FirstOrDefault(x => x.UserName == u.UserName && x.UserPassWord == u.UserPassWord && x.Userstatus == 0);
            if (data!=null)
            {
                return Content("true");
                
            }
            else
            {
                return Content("false");
            }
        }

        [HttpPost]
        public ActionResult Logininfoid(UserTable u)
        {

            int UserId = shop.UserTable.FirstOrDefault(x => x.UserName == u.UserName && x.UserPassWord == u.UserPassWord && x.Userstatus == 0).UserId;
            
                return Content(UserId.ToString());
        }
        //用户修改密码
        [HttpPost]
        public ActionResult updatepwd(UserTable u)
        {

            var data = shop.UserTable.FirstOrDefault(x => x.UserId == u.UserId);
            data.UserPassWord = u.UserPassWord;
            data.UserName = data.UserName;
            data.limits = data.limits;
            data.Userstatus = data.Userstatus;
            data.Email = data.Email;
            if (shop.SaveChanges() > 0)
            {
                return Content("true");

            }
            else
            {
                return Content("false");
            }
        }

        //用户注册
        public ActionResult Zhuce()
        {
            return View();
        }

        //用户注册处理数据方法
        [HttpPost]
        public ActionResult Zhuceinfo(UserTable u)
        {
            UserTable user = new UserTable();
            user.UserName = u.UserName;
            user.Email = u.Email;
            user.UserPassWord = u.UserPassWord;
            user.limits = "1";
            user.Userstatus = 0;
            shop.UserTable.Add(user);
            if (shop.SaveChanges()>0)
            {
                return Content("true");
            }
            else
            {
                return Content("false");
            }
            
        }
        //判断邮箱是否已被注册
        public ActionResult email(UserTable u)
        {
            var user = shop.UserTable.FirstOrDefault(x => x.Email == u.Email);

            if (user != null)
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