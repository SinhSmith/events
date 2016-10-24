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
        public string EventType { get; set; }
        public string EventTopic { get; set; }
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
}
