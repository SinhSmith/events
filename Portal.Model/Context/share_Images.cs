//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Portal.Model.Context
{
    using System;
    using System.Collections.Generic;
    
    public partial class share_Images
    {
        public share_Images()
        {
            this.cms_News = new HashSet<cms_News>();
            this.system_Banners = new HashSet<system_Banners>();
            this.portal_Projects = new HashSet<portal_Projects>();
            this.portal_Projects1 = new HashSet<portal_Projects>();
        }
    
        public int Id { get; set; }
        public string ImageName { get; set; }
        public string ImagePath { get; set; }
        public Nullable<int> Status { get; set; }
        public Nullable<System.Guid> CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<System.Guid> ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
    
        public virtual ICollection<cms_News> cms_News { get; set; }
        public virtual ICollection<system_Banners> system_Banners { get; set; }
        public virtual ICollection<portal_Projects> portal_Projects { get; set; }
        public virtual ICollection<portal_Projects> portal_Projects1 { get; set; }
    }
}