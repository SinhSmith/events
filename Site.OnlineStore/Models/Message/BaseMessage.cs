using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineStoreMVC.Models.Message
{
    public class BaseMessage
    {
        public bool IsSuccess { get; set; }
        public string Message { get; set; }
    }
}