using Portal.Infractructure.Utility;
using Portal.Model.Context;
using Portal.Model.MessageModel;
using Portal.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Portal.Model.Mapper
{
    public static class OrderEventMapper
    {
        public static EventDetailsResponse ConvertToOrderEventTicketModel(this event_Order order)
        {
            EventDetailsResponse response = new EventDetailsResponse()
            {
                Id = order.Event.Id,
                OrderId = order.Guid.ToString(),
                Title = order.Event.Title,
                StartDate = ((DateTime)order.Event.StartDate).ToString(EventConstants.DefaultDateTimeFormat),
                EndDate = ((DateTime)order.Event.EndDate).ToString(EventConstants.DefaultDateTimeFormat),
                Description = order.Event.Description,
                OrganizationName = order.Event.OrganizationName,
                OrganizationDescription = order.Event.OrganizationDescription,
                CoverImage = order.Event.CoverImage.ImagePath,
                EventType = order.Event.EventType,
                EventTopic = order.Event.EventTopic,
                Location_StreetName = order.Event.Location_StreetName,
                Location_Address = order.Event.Location_Address,
                Location_Address2 = order.Event.Location_Address2,
                Location_City = order.Event.Location_City,
                Location_State = order.Event.Location_State,
                ZipCode = order.Event.ZipCode,
                Country = order.Event.Country,
                RemainOrderSessionTime = (int)(480 - (DateTime.Now-(DateTime)order.OrderTime).TotalSeconds)
            };

            IList<TicketOrderGroup> orderGroups = order.OrderTickets.GroupBy(t => t.TicketId).Select(g => new TicketOrderGroup()
            {
                TicketId = g.Key,
                Quantity = g.Count()
            }).ToList();

            foreach (var item in orderGroups)
            {
                var ticketDetails = order.OrderTickets.Where(t => t.TicketId == item.TicketId).First();
                OrderEventTicketModel ticket = new OrderEventTicketModel()
                {
                    Id = ticketDetails.OrderId,
                    Name = ticketDetails.Ticket.Name,
                    Quantity = (int)item.Quantity,
                    Price = ticketDetails.Ticket.Price
                };

                response.Tickets.Add(ticket);
            }

            return response;
        }

        public static OrderDetails ConvertToOrderDetailsModel(this event_Order order)
        {
            OrderDetails orderDetails = new OrderDetails()
            {
                Id = order.Id,
                Guid = order.Guid,
                EventId = order.EventId,
                UserId = order.UserId,
                FirstName = order.FirstName,
                LastName = order.LastName,
                EmailAddress = order.EmailAddress,
                Status = order.Status,
                OrderTime = order.OrderTime,
                Event = order.Event
            };

            return orderDetails;
        }
    }
}

