using Portal.Model.Context;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Portal.Service.MessageModel
{
    public class CreateEventPostRequest
    {
        public CreateEventPostRequest()
        {
            Tickets = new List<EventTicketRequest>();
        }
        public Nullable<int> Id { get; set; }
        public string Title { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        [DisplayFormat(ConvertEmptyStringToNull = true)]
        public string Description { get; set; }
        [DisplayFormat(ConvertEmptyStringToNull = true)]
        public string OrganizationName { get; set; }
        [DisplayFormat(ConvertEmptyStringToNull = true)]
        public string OrganizationDescription { get; set; }
        public Nullable<int> CoverImageId { get; set; }
        public string PaymentEmail { get; set; }
        public int EventType { get; set; }
        public int EventTopic { get; set; }
        public bool IsShowRemainingNumberTicket { get; set; }
        [DisplayFormat(ConvertEmptyStringToNull = true)]
        public string Location_StreetName { get; set; }
        [DisplayFormat(ConvertEmptyStringToNull = true)]
        public string Location_Address { get; set; }
        [DisplayFormat(ConvertEmptyStringToNull = true)]
        public string Location_Address2 { get; set; }
        [DisplayFormat(ConvertEmptyStringToNull = true)]
        public string Location_City { get; set; }
        [DisplayFormat(ConvertEmptyStringToNull = true)]
        public string Location_State { get; set; }
        [DisplayFormat(ConvertEmptyStringToNull = true)]
        public string ZipCode { get; set; }
        [DisplayFormat(ConvertEmptyStringToNull = true)]
        public string Country { get; set; }
        public int Status { get; set; }
        public Nullable<int> SortOrder { get; set; }
        public bool IsVerified { get; set; }
        public List<EventTicketRequest> Tickets { get; set; }
    }

    public class EventScheduleRequest
    {
        public System.DateTime StartDate { get; set; }
        public System.DateTime EndDate { get; set; }
    }

    public class EventTicketRequest
    {
        public Nullable<int> Id { get; set; }
        [DisplayFormat(ConvertEmptyStringToNull = true)]
        public string Name { get; set; }
        public int Quantity { get; set; }
        [DisplayFormat(ConvertEmptyStringToNull = true)]
        public string Description { get; set; }
        public bool IsShowDescription { get; set; }
        public int SaleChanel { get; set; }
        public bool IsHide { get; set; }
        public int MinimunTicketOrder { get; set; }
        public int MaximunTicketOrder { get; set; }
        public string StartSaleDateTime { get; set; }
        public string EndSaleDateTime { get; set; }
        public int Type { get; set; }
        public decimal Price { get; set; }
    }

    public class CreateEventRequest
    {
        public CreateEventRequest()
        {
            Tickets = new List<CreateTicketRequest>();
        }
        [Required]
        public string Title { get; set; }
        [Required]
        public string StartDate { get; set; }
        [Required]
        public string EndDate { get; set; }
        [DisplayFormat(ConvertEmptyStringToNull = true)]
        public string Description { get; set; }
        [DisplayFormat(ConvertEmptyStringToNull = true)]
        public string OrganizationName { get; set; }
        [DisplayFormat(ConvertEmptyStringToNull = true)]
        public string OrganizationDescription { get; set; }
        public Nullable<int> CoverImageId { get; set; }
        public string PaymentEmail { get; set; }
        public int EventType { get; set; }
        public int EventTopic { get; set; }
        public bool IsShowRemainingNumberTicket { get; set; }
        [DisplayFormat(ConvertEmptyStringToNull = true)]
        public string Location_StreetName { get; set; }
        [DisplayFormat(ConvertEmptyStringToNull = true)]
        public string Location_Address { get; set; }
        [DisplayFormat(ConvertEmptyStringToNull = true)]
        public string Location_Address2 { get; set; }
        [DisplayFormat(ConvertEmptyStringToNull = true)]
        public string Location_City { get; set; }
        [DisplayFormat(ConvertEmptyStringToNull = true)]
        public string Location_State { get; set; }
        [DisplayFormat(ConvertEmptyStringToNull = true)]
        public string ZipCode { get; set; }
        [DisplayFormat(ConvertEmptyStringToNull = true)]
        public string Country { get; set; }
        public bool IsVerified { get; set; }
        public List<CreateTicketRequest> Tickets { get; set; }
        public string OwnerId { get; set; }
    }

    public class CreateTicketRequest
    {
        [DisplayFormat(ConvertEmptyStringToNull = true)]
        [Required]
        public string Name { get; set; }
        [Required]
        public int Quantity { get; set; }
        [DisplayFormat(ConvertEmptyStringToNull = true)]
        public string Description { get; set; }
        public bool IsShowDescription { get; set; }
        public int SaleChanel { get; set; }
        public bool IsHide { get; set; }
        public int MinimunTicketOrder { get; set; }
        public int MaximunTicketOrder { get; set; }
        [Required]
        public string StartSaleDateTime { get; set; }
        [Required]
        public string EndSaleDateTime { get; set; }
        public int Type { get; set; }
        public decimal Price { get; set; }
    }
}


