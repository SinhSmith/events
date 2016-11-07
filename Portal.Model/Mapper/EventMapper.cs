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
    public static class EventMapper
    {
        public static EventFullView ConvertToEventFullView(this event_Event eventObject)
        {
            EventFullView eventFullView = new EventFullView()
            {
                Id = eventObject.Id,
                Title = eventObject.Title,
                StartDate = ((DateTime)eventObject.StartDate).ToString(EventConstants.DefaultDateTimeFormat),
                EndDate = ((DateTime)eventObject.EndDate).ToString(EventConstants.DefaultDateTimeFormat),
                Description = eventObject.Description,
                OrganizationName = eventObject.OrganizationName,
                OrganizationDescription = eventObject.OrganizationDescription,
                CoverImage = eventObject.CoverImage,
                PaymentEmail = eventObject.PaymentEmail,
                EventType = eventObject.EventType,
                EventTopic = eventObject.EventTopic,
                IsShowRemainingNumberTicket = eventObject.IsShowRemainingNumberTicket,
                Location_StreetName = eventObject.Location_StreetName,
                Location_Address = eventObject.Location_Address,
                Location_Address2 = eventObject.Location_Address2,
                Location_City = eventObject.Location_City,
                Location_State = eventObject.Location_State,
                ZipCode = eventObject.ZipCode,
                Country = eventObject.Country,
                IsVerified = eventObject.IsVerified,
                Tickets = eventObject.Tickets.ConvertToEventTicketResponses()
            };

            return eventFullView;
        }

        public static EventTicketResponse ConvertToEventTicketResponse(this event_Ticket ticket)
        {
            EventTicketResponse responseTicket = new EventTicketResponse()
            {
                Id = ticket.Id,
                Name = ticket.Name,
                Quantity = ticket.Quantity,
                Description = ticket.Description,
                IsShowDescription = ticket.IsShowDescription,
                SaleChanel = ticket.SaleChanel,
                IsHide = ticket.IsHide,
                MinimunTicketOrder = ticket.MinimunTicketOrder,
                MaximunTicketOrder = ticket.MaximunTicketOrder,
                StartSaleDateTime = ticket.StartSaleDateTime.ToString(EventConstants.DefaultDateTimeFormat),
                EndSaleDateTime = ((DateTime)ticket.EndSaleDateTime).ToString(EventConstants.DefaultDateTimeFormat),
                Type = ticket.Type,
                Price = ticket.Price
            };

            return responseTicket;
        }

        public static ICollection<EventTicketResponse> ConvertToEventTicketResponses(this IEnumerable<event_Ticket> tickets)
        {
            List<EventTicketResponse> ticketResponses = new List<EventTicketResponse>();
            foreach (var item in tickets)
            {
                ticketResponses.Add(item.ConvertToEventTicketResponse());
            }

            return ticketResponses;
        }

        public static DisplayEventSummaryView ConvertToEventSummaryView(this event_Event eventObject)
        {
            DisplayEventSummaryView eventSummaryView = new DisplayEventSummaryView()
            {
                Id = eventObject.Id,
                Title = eventObject.Title,
                StartDate = ((DateTime)eventObject.StartDate).ToString(EventConstants.DefaultDateTimeFormat),
                EndDate = ((DateTime)eventObject.EndDate).ToString(EventConstants.DefaultDateTimeFormat),
                Description = eventObject.Description,
                OrganizationName = eventObject.OrganizationName,
                CoverImage = eventObject.CoverImage !=null? eventObject.CoverImage.ImagePath:"/Content/Images/no-image.png",
                EventType = eventObject.EventType,
                EventTopic = eventObject.EventTopic,
                Location_StreetName = eventObject.Location_StreetName,
                Location_Address = eventObject.Location_Address,
                Location_Address2 = eventObject.Location_Address2,
                Location_City = eventObject.Location_City,
                Location_State = eventObject.Location_State,
                ZipCode = eventObject.ZipCode,
                Country = eventObject.Country,
            };

            return eventSummaryView;
        }

        public static IEnumerable<DisplayEventSummaryView> ConvertToEventSummaryViews(this IEnumerable<event_Event> eventObjects)
        {
            foreach (event_Event item in eventObjects)
            {
                yield return item.ConvertToEventSummaryView();
            }
        }

        public static EventDetailsResponse ConvertToEventDetailsModel(this event_Event eventObject)
        {
            EventDetailsResponse eventFullView = new EventDetailsResponse()
            {
                Id = eventObject.Id,
                Title = eventObject.Title,
                StartDate = ((DateTime)eventObject.StartDate).ToString(EventConstants.DefaultDateTimeFormat),
                EndDate = ((DateTime)eventObject.EndDate).ToString(EventConstants.DefaultDateTimeFormat),
                Description = eventObject.Description,
                OrganizationName = eventObject.OrganizationName,
                OrganizationDescription = eventObject.OrganizationDescription,
                CoverImage = eventObject.CoverImage,
                EventType = eventObject.EventType,
                EventTopic = eventObject.EventTopic,
                IsShowRemainingNumberTicket = eventObject.IsShowRemainingNumberTicket,
                Location_StreetName = eventObject.Location_StreetName,
                Location_Address = eventObject.Location_Address,
                Location_Address2 = eventObject.Location_Address2,
                Location_City = eventObject.Location_City,
                Location_State = eventObject.Location_State,
                ZipCode = eventObject.ZipCode,
                Country = eventObject.Country,
                Tickets = eventObject.Tickets.ConvertToOrderEventTicketModels()
            };

            return eventFullView;
        }

        public static OrderEventTicketModel ConvertToOrderEventTicketModel(this event_Ticket ticket)
        {
            OrderEventTicketModel responseTicket = new OrderEventTicketModel()
            {
                Id = ticket.Id,
                Name = ticket.Name,
                Quantity = 0,
                Description = ticket.Description,
                MinimunTicketOrder = ticket.MinimunTicketOrder,
                MaximunTicketOrder = ticket.MaximunTicketOrder,
                StartSaleDateTime = ticket.StartSaleDateTime.ToString(EventConstants.DefaultDateTimeFormat),
                EndSaleDateTime = ((DateTime)ticket.EndSaleDateTime).ToString(EventConstants.DefaultDateTimeFormat),
                Type = ticket.Type,
                Price = ticket.Price
            };

            return responseTicket;
        }

        public static IList<OrderEventTicketModel> ConvertToOrderEventTicketModels(this IEnumerable<event_Ticket> tickets)
        {
            List<OrderEventTicketModel> ticketResponses = new List<OrderEventTicketModel>();
            foreach (var item in tickets)
            {
                ticketResponses.Add(item.ConvertToOrderEventTicketModel());
            }

            return ticketResponses.ToList();
        }
    }
}
