using Portal.Infractructure.Utility;
using Portal.Model.Context;
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
                Country = order.Event.Country
            };

            foreach (event_TicketOrder item in order.OrderTickets)
            {
                OrderEventTicketModel ticket = new OrderEventTicketModel()
                {
                    Id = item.OrderId,
                    Name = item.Ticket.Name,
                    Quantity = (int)item.Quantity,
                    Price = item.Ticket.Price
                };

                response.Tickets.Add(ticket);
            }

            return response;
        }
    }
}

