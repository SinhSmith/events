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
    
    public partial class system_Organisers
    {
        public int Id { get; set; }
        public Nullable<System.Guid> UserId { get; set; }
        public Nullable<int> AvatarId { get; set; }
        public string OrganiserName { get; set; }
        public string About { get; set; }
        public string Website { get; set; }
        public string Facebook { get; set; }
        public string Twitter { get; set; }
        public Nullable<int> Status { get; set; }
        public Nullable<System.Guid> CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<System.Guid> ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
    
        public virtual share_Images share_Images { get; set; }
    }
}
