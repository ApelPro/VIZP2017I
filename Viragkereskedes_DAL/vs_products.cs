//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Viragkereskedes_DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class vs_products : enAccessories
    {
        public int accessory_number { get; set; }
    
        public virtual enBouquet bid { get; set; }
        public virtual enAccessories acc_id { get; set; }
    }
}
