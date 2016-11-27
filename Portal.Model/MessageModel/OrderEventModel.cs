using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Portal.Model.MessageModel
{
    public class ConfirmOrderTicketRequest
    {
        public Guid OrderId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string EmailAddress { get; set; }
        public DateTime SubmitTime { get; set; }
        public string PhoneNumber { get; set; }
        public string Billing_Address { get; set; }
        public string Billing_Address2 { get; set; }
        public string Billing_City { get; set; }
        public string Billing_Country { get; set; }
        public string Shipping_Address { get; set; }
        public string Shipping_Address2 { get; set; }
        public string Shipping_City { get; set; }
        public string Shipping_Country { get; set; }
        //public string State { get; set; }
        //public string PostalCode { get; set; }
    }

    public class RequestOrderResponseModel
    {
        public bool Success { get; set; }
        public string Message { get; set; }
        public string OrderGuid { get; set; }
    }
}
