//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace 栗子商城.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class OrderInfo
    {
        public int OrderID { get; set; }
        public Nullable<int> UserId { get; set; }
        public Nullable<int> AddressId { get; set; }
        public Nullable<decimal> Total { get; set; }
        public Nullable<decimal> TranMoney { get; set; }
        public string PayState { get; set; }
        public string CreateTime { get; set; }
    }
}