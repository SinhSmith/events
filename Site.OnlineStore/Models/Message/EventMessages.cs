using Portal.Service.MessageModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineStoreMVC.Models.Message
{
    public class GetEventsInCurrentLocationResponse : BaseMessage
    {
        public GetEventsByCategoryResponse Result { get; set; } 
    }
}