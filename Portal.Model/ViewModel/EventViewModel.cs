﻿using Portal.Model.Context;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Portal.Model.ViewModel
{
    public class EventSummaryViewModel
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string OrganizationName { get; set; }
        public string Location_StreetName { get; set; }
        public string Location_Address { get; set; }
        public string Location_Address2 { get; set; }
        public string Location_City { get; set; }
        public string Location_State { get; set; }
        public string ZipCode { get; set; }
        public string Country { get; set; }
        public string Status { get; set; }
        public Nullable<int> SortOrder { get; set; }
        public bool IsVerified { get; set; }
        public virtual share_Images CoverImage { get; set; }
    }

    public class EventFullView{
        public EventFullView()
        {
            Tickets = new List<EventTicketResponse>();
        }
        public int Id { get; set; }
        public string Title { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string Description { get; set; }
        public string OrganizationName { get; set; }
        public string OrganizationDescription { get; set; }
        public share_Images CoverImage { get; set; }
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

        public ICollection<EventTicketResponse> Tickets { get; set; }

    }

    public class EventTicketResponse
    {
        public EventTicketResponse()
        {
            SaleChanelOptions = new List<SaleChanelOption>();
        }
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
        public IList<SaleChanelOption> SaleChanelOptions { get; set; }


    }

    public class SaleChanelOption{
        public int Value{get;set;}
        public string Text{get;set;}
    }

    public class DisplayEventSummaryView
    {
        public DisplayEventSummaryView()
        {
            ListOrderPricePrice = new List<string>();
            IsBookMarked = false;
        }
        public int Id { get; set; }
        public string Title { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string Description { get; set; }
        public string OrganizationName { get; set; }
        public string CoverImage { get; set; }
        public string EventType { get; set; }
        public string EventTopic { get; set; }
        public string Location_StreetName { get; set; }
        public string Location_Address { get; set; }
        public string Location_Address2 { get; set; }
        public string Location_City { get; set; }
        public string Location_State { get; set; }
        public string ZipCode { get; set; }
        public string Country { get; set; }
        public int TicketPriceType { get; set; }
        public List<string> ListOrderPricePrice { get; set; }
        public bool IsBookMarked { get; set; }
    }

    public class EventDetailsResponse
    {
        public EventDetailsResponse()
        {
            Tickets = new List<OrderEventTicketModel>();
        }
        public int Id { get; set; }
        public string OrderId { get; set; }
        public string Title { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string Description { get; set; }
        public string OrganizationName { get; set; }
        public string OrganizationDescription { get; set; }
        public string CoverImage { get; set; }
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
        public int RemainOrderSessionTime { get; set; }
        public Nullable<int> SortOrder { get; set; }
        public bool IsVerified { get; set; }
        public IList<OrderEventTicketModel> Tickets { get; set; }
    }

    public class OrderEventTicketModel
    {
        public Nullable<int> Id { get; set; }
        [DisplayFormat(ConvertEmptyStringToNull = true)]
        public string Name { get; set; }
        public int Quantity { get; set; }
        public int AvailableQuantity { get; set; }
        [DisplayFormat(ConvertEmptyStringToNull = true)]
        public string Description { get; set; }
        public int MinimunTicketOrder { get; set; }
        public int MaximunTicketOrder { get; set; }
        public string StartSaleDateTime { get; set; }
        public string EndSaleDateTime { get; set; }
        public int Type { get; set; }
        public decimal Price { get; set; }

    }

    public class OrderDetails
    {
        public OrderDetails()
        {
            this.OrderTickets = new HashSet<OrderEventTicketModel>();
        }
    
        public int Id { get; set; }
        public System.Guid Guid { get; set; }
        public int EventId { get; set; }
        public string UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string EmailAddress { get; set; }
        public Nullable<int> Status { get; set; }
        public Nullable<System.DateTime> OrderTime { get; set; }
    
        public virtual event_Event Event { get; set; }
        public virtual ICollection<OrderEventTicketModel> OrderTickets { get; set; }
    }

    public class EventManagementItem
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string StartDate { get; set; }
        public int TotalTicketNumber { get; set; }
        public int SoldTicketNumber { get; set; }
    }

    public class TicketTypeDetails
    {
        public string Name { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        public int NumberTicketSold { get; set; }
        public string EndSaleTime { get; set; }
    }

    public class OrderInformation{
        public int OrderId{get;set;}
        public string OrderTime{get;set;}
        public string OrderUserName{get;set;}
        public int Quantity{get;set;}
    }

    public class EventManagementModel
    {
        public int EventId { get; set; }
        public string Title { get; set; }
        public string Location_StreetName { get; set; }
        public string Location_Address { get; set; }
        public string Location_Address2 { get; set; }
        public string Location_City { get; set; }
        public string Location_State { get; set; }
        public string ZipCode { get; set; }
        public string Country { get; set; }
        public int Status { get; set; }
        public string StartDate { get; set; }

        public int Quantity { get; set; }
        public int NumberTicketSold { get; set; }
        public List<TicketTypeDetails> TicketTypeDetails { get; set; }
        public List<OrderInformation> Orders { get; set; }

    }

    public class TicketOrderInformation
    {
        public string TicketType { get; set; }
        public System.Guid TicketCode { get; set; }
    }

    public class OrderInformationModel
    {
        public System.Guid Guid { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string EmailAddress { get; set; }
        public string Status { get; set; }
        public string OrderTime { get; set; }
        public string PhoneNumber { get; set; }
        public string Billing_Address { get; set; }
        public string Billing_Address2 { get; set; }
        public string Billing_City { get; set; }
        public string Shipping_Address { get; set; }
        public string Shipping_Address2 { get; set; }
        public string Shipping_City { get; set; }
        public string Billing_Country { get; set; }
        public string Shipping_Country { get; set; }

        public ICollection<TicketOrderInformation> OrderTickets { get; set; }
    }
}

