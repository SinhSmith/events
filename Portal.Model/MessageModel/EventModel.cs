using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Portal.Model.MessageModel
{
    public class GetOrderTicketFormRequest
    {
        public int EventId { get; set; }
        public IEnumerable<OrderTicketRequest> Tickets {get;set;}
        public string Owner { get; set; }
    }

    public class OrderTicketRequest{
        public int TicketId { get; set; }
        public int TicketQuantity { get; set; }
    }

    public class TicketOrderGroup
    {
        public int TicketId { get; set; }
        public int Quantity { get; set; }
    }

}
