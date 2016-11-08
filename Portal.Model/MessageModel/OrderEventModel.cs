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
    }
}
