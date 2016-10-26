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
    
    public partial class event_Event
    {
        public event_Event()
        {
            this.Tickets = new HashSet<event_Ticket>();
        }
    
        public int Id { get; set; }
        public System.Guid Guid { get; set; }
        public string OwnerId { get; set; }
        public string Title { get; set; }
        public Nullable<System.DateTime> StartDate { get; set; }
        public Nullable<System.DateTime> EndDate { get; set; }
        public string Description { get; set; }
        public string OrganizationName { get; set; }
        public string OrganizationDescription { get; set; }
        public Nullable<int> CoverImageId { get; set; }
        public string PaymentEmail { get; set; }
        public int EventType { get; set; }
        public int EventTopic { get; set; }
        public bool IsShowRemainingNumberTicket { get; set; }
        public string Location_StreetName { get; set; }
        public string Location_Address { get; set; }
        public string Location_Address2 { get; set; }
        public string Location_City { get; set; }
        public string Location_State { get; set; }
        public string ZipCode { get; set; }
        public string Country { get; set; }
        public int Status { get; set; }
        public Nullable<int> SortOrder { get; set; }
        public bool IsVerified { get; set; }
    
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual share_Images CoverImage { get; set; }
        public virtual ICollection<event_Ticket> Tickets { get; set; }
    }
}
