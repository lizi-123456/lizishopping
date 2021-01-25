using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace 栗子商城.Models
{
    public class SKUOrSPUOrShopCategory
    {
        public int SKUId { get; set; }
        public string SKUGoodName { get; set; }
        public string Goods_Description { get; set; }
        public decimal? GoodPrice { get; set; }
        public int? inventory { get; set; }
        public string GoodPhoto { get; set; }
        public int? SPUID { get; set; }
        public string BusinName { get; set; }
        public int? onclicknum { get; set; }
        public string SPUGoodName { get; set; }
        public string GoodInfo { get; set; }
        public string TypeName { get; set; }
    }
}