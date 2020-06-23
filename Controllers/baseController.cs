using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.Mvc;
using 栗子商城.Models;

namespace 栗子商城.Controllers
{
    public class baseController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}