using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace 栗子商城.Models
{
    public class PagingInfo
    {
        //项目总数量
        public int TotalItems { get; set; }
        //当前索引
        public int PageIndex { get; set; }
        //分页大小
        public int PageSize { get; set; }
        //页数
        public int PageCount
        {
            get
            {
                return (int)Math.Ceiling((decimal)TotalItems / PageSize);
            }
        }
    }
}