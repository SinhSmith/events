using Portal.Model.Context;
using Portal.Model.Repository;
using Portal.Service.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Portal.Model.Mapper;
using Portal.Model.ViewModel;

namespace Portal.Service.Implements
{
    public class UserResourcesService : IUserResourcesService
    {
        #region Properties

        private static PortalEntities context = new PortalEntities();
        private EventRepository eventRepository = new EventRepository(context);
        private EventOrderRepository orderRepository = new EventOrderRepository(context);
        private UserRepository userRepository = new UserRepository(context);
        private TicketRepository ticketRepository = new TicketRepository(context);
        private Repository<event_TicketOrder> ticketOrderRepository;

        #endregion

        #region Constructures

        public UserResourcesService()
        {
            context = new PortalEntities();
            eventRepository = new EventRepository(context);
            orderRepository = new EventOrderRepository(context);
            userRepository = new UserRepository(context);
            ticketRepository = new TicketRepository(context);
            ticketOrderRepository = new Repository<event_TicketOrder>(context);
        }

        #endregion

        #region Public functions

        /// <summary>
        /// Add bookmarked event for selected user
        /// </summary>
        /// <param name="eventId">event id</param>
        /// <param name="userId">user id</param>
        /// <param name="message">resul message of function</param>
        /// <returns>true if add action success and false if it fail</returns>
        public bool AddEventBookMark(int eventId,string userName, ref string message)
        {
            event_Event selectedEvent = eventRepository.GetEventById(eventId);
            if(selectedEvent == null){
                message = "Add Bookmark fail, Cannot found selected event";
                return false;
            }
            AspNetUser user = userRepository.GetUserByName(userName);
            if (!userRepository.CheckEventIsSavedOrNot(userName, eventId))
            {
                user.BookMarkEvents.Add(selectedEvent);
            }
            else
            {
                return false;
            }
            try
            {
                userRepository.Update(user);
                userRepository.Save();
                message = "Add bookmark successful";
                return true;
            }
            catch (Exception ex)
            {
                message = ex.Message;
                return false;
            }
        }

        /// <summary>
        /// Remove bookmarked event for selected user
        /// </summary>
        /// <param name="eventId">event id</param>
        /// <param name="userId">user id</param>
        /// <param name="message">resul message of function</param>
        /// <returns>true if add action success and false if it fail</returns>
        public bool RemoveEventBookMark(int eventId, string userName, ref string message)
        {
            event_Event selectedEvent = eventRepository.GetEventById(eventId);
            if (selectedEvent == null)
            {
                message = "Remove Bookmark fail, Cannot found selected event";
                return false;
            }
            AspNetUser user = userRepository.GetUserByName(userName);
            if (!userRepository.CheckEventIsSavedOrNot(userName, eventId))
            {
                return false;
            }
            user.BookMarkEvents.Remove(selectedEvent);
            try
            {
                userRepository.Update(user);
                userRepository.Save();
                message = "Remove bookmark successful";
                return true;
            }
            catch (Exception ex)
            {
                message = ex.Message;
                return false;
            }
        }

        /// <summary>
        /// Check event is saved by current user or not
        /// </summary>
        /// <param name="userName">User Name</param>
        /// <param name="eventId">Event Id</param>
        /// <returns></returns>
        public bool CheckEventIsSavedOrNot(string userName, int eventId)
        {
            return userRepository.CheckEventIsSavedOrNot(userName, eventId);
        }

        /// <summary>
        /// Get information of user
        /// </summary>
        /// <param name="userName">User name</param>
        /// <returns></returns>
        public AspNetUser GetUserProfileByName(string userName)
        {
            return userRepository.GetUserByName(userName);
        }

        /// <summary>
        /// Get list Bookmark events
        /// </summary>
        /// <param name="userId">user id</param>
        /// <returns>List bookmark events of selected user</returns>
        public IEnumerable<Model.ViewModel.DisplayEventSummaryView> GetListBookMarkEvent(string userName)
        {
            IEnumerable<event_Event> events = userRepository.GetListBookMarkEvents(userName);

            return events.ConvertToEventSummaryViews();
        }

        /// <summary>
        /// Get list event tiket order
        /// </summary>
        /// <param name="userId">user id</param>
        /// <returns>List order of selected user</returns>
        public IEnumerable<Model.Context.event_Order> GetListOrders(string userName)
        {
            return userRepository.GetEventTicketOrders(userName);
        }

        /// <summary>
        /// Get list live events of current user
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public IEnumerable<EventManagementItem> GetListLiveEvents(string userName)
        {
            List<EventManagementItem> listEventResult = new List<EventManagementItem>();
            IEnumerable<event_Event> events = userRepository.GetListLiveEventsOfUser(userName);

            foreach (var item in events)
            {
                int numberOrderedTicket = orderRepository.GetNumberOrderedTicketOfEvent(item.Id) + orderRepository.GetNumberPendingOrderTicketOfEvent(item.Id);
                int totalNumberTicket = ticketRepository.GetTotalNumberTicketOfEvent(item.Id);
                EventManagementItem eventItem = new EventManagementItem()
                {
                    Id = item.Id,
                    Title = item.Title,
                    StartDate = String.Format("{0:MMM dd, yyyy HH:mm}", (DateTime)item.StartDate),
                    SoldTicketNumber = numberOrderedTicket,
                    TotalTicketNumber = totalNumberTicket
                };
                listEventResult.Add(eventItem);
            }

            return listEventResult;
        }

        /// <summary>
        /// Get list draft events of current user
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public IEnumerable<EventManagementItem> GetListDraftEvents(string userName)
        {
            List<EventManagementItem> listEventResult = new List<EventManagementItem>();
            IEnumerable<event_Event> events = userRepository.GetListDraftEventsOfUser(userName);

            foreach (var item in events)
            {
                EventManagementItem eventItem = new EventManagementItem()
                {
                    Id = item.Id,
                    Title = item.Title,
                    StartDate = String.Format("{0:MMM dd, yyyy HH:mm}", (DateTime)item.StartDate)
                };
                listEventResult.Add(eventItem);
            }

            return listEventResult;
        }

        /// <summary>
        /// Get list draft events of current user
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public IEnumerable<EventManagementItem> GetListPassEvents(string userName)
        {
            List<EventManagementItem> listEventResult = new List<EventManagementItem>();
            IEnumerable<event_Event> events = userRepository.GetListPassEventsOfUser(userName);

            foreach (var item in events)
            {
                int numberOrderedTicket = orderRepository.GetNumberOrderedTicketOfEvent(item.Id) + orderRepository.GetNumberPendingOrderTicketOfEvent(item.Id);
                int totalNumberTicket = ticketRepository.GetTotalNumberTicketOfEvent(item.Id);
                EventManagementItem eventItem = new EventManagementItem()
                {
                    Id = item.Id,
                    Title = item.Title,
                    StartDate = String.Format("{0:MMM dd, yyyy HH:mm}", (DateTime)item.StartDate),
                    SoldTicketNumber = numberOrderedTicket,
                    TotalTicketNumber = totalNumberTicket
                };
                listEventResult.Add(eventItem);
            }

            return listEventResult;
        }

        public IEnumerable<EventManagementItem> FilterEvents(string userName, string searchString, string type)
        {
            List<EventManagementItem> listEventResult = new List<EventManagementItem>();
            IEnumerable<event_Event> events = new List<event_Event>();
            switch (type)
            {
                case "live":
                {
                    events = userRepository.GetListLiveEventsOfUser(userName,searchString);
                    break;
                }
                case "draft":
                {
                    events = userRepository.GetListDraftEventsOfUser(userName, searchString);
                    break;
                }
                case "pass":
                {
                    events = userRepository.GetListPassEventsOfUser(userName, searchString);
                    break;
                }
            }

            foreach (var item in events)
            {
                int numberOrderedTicket = orderRepository.GetNumberOrderedTicketOfEvent(item.Id) + orderRepository.GetNumberPendingOrderTicketOfEvent(item.Id);
                int totalNumberTicket = ticketRepository.GetTotalNumberTicketOfEvent(item.Id);
                EventManagementItem eventItem = new EventManagementItem()
                {
                    Id = item.Id,
                    Title = item.Title,
                    StartDate = String.Format("{0:MMM dd, yyyy HH:mm}", (DateTime)item.StartDate),
                    SoldTicketNumber = numberOrderedTicket,
                    TotalTicketNumber = totalNumberTicket
                };
                listEventResult.Add(eventItem);
            }

            return listEventResult;
        }

        public event_Event EventManagement(string userName,int eventId)
        {
            event_Event foundEvent = eventRepository.GetEventById(eventId);
            if (foundEvent.AspNetUser.UserName == userName)
            {
                return foundEvent;
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// Check whether current user is owner of event or not
        /// </summary>
        /// <param name="eventId">event id</param>
        /// <param name="userName">user name</param>
        /// <returns></returns>
        public bool CheckEventOwner(int eventId,string userName){
            AspNetUser user = eventRepository.GetOwnerEvent(eventId);

            return user.UserName == userName;
        }

        /// <summary>
        /// Get number sold ticket of a particular ticket 
        /// </summary>
        /// <param name="ticketId"></param>
        /// <returns></returns>
        private int GetNumberSoldTicket(int ticketId)
        {
            return ticketOrderRepository.Get(t => t.TicketId == ticketId && t.event_Order.Status == (int)Portal.Infractructure.Utility.Define.Status.Active).Count();
        }


        public EventManagementModel GetEventInformation(int eventId)
        {
            EventManagementModel retEvent = new EventManagementModel();
            event_Event foundEvent = eventRepository.GetEventForManagement(eventId);
            retEvent.EventId = foundEvent.Id;
            retEvent.Title = foundEvent.Title;
            retEvent.Location_StreetName = foundEvent.Location_StreetName;
            retEvent.Location_Address = foundEvent.Location_Address;
            retEvent.Location_Address2 = foundEvent.Location_Address2;
            retEvent.Location_City = foundEvent.Location_City;
            retEvent.Location_State = foundEvent.Location_State;
            retEvent.ZipCode = foundEvent.ZipCode;
            retEvent.Country = foundEvent.Country;
            retEvent.Status = foundEvent.Status;
            retEvent.StartDate = String.Format("{0:MMM dd, yyyy HH:mm}", (DateTime)foundEvent.StartDate);
            retEvent.Quantity = ticketRepository.GetTotalNumberTicketOfEvent(eventId);
            retEvent.NumberTicketSold = orderRepository.GetNumberOrderedTicketOfEvent(eventId) + orderRepository.GetNumberPendingOrderTicketOfEvent(eventId);
            retEvent.TicketTypeDetails = new List<TicketTypeDetails>();
            foreach (var ticket in foundEvent.Tickets)
            {
                TicketTypeDetails ticketDetail = new TicketTypeDetails()
                {
                    Name = ticket.Name,
                    Price = ticket.Price,
                    Quantity = ticket.Quantity,
                    NumberTicketSold = GetNumberSoldTicket(ticket.Id),
                    EndSaleTime = String.Format("{0:MMM dd, yyyy HH:mm}", (DateTime)ticket.EndSaleDateTime)
                };
                retEvent.TicketTypeDetails.Add(ticketDetail);
            }
            retEvent.Orders = new List<OrderInformation>();
            foundEvent.event_Order = foundEvent.event_Order.Where(o => o.Status == (int)Portal.Infractructure.Utility.Define.Status.Active).ToList();
            foreach (var order in foundEvent.event_Order)
            {
                OrderInformation orderInfor = new OrderInformation()
                {
                    OrderId = order.Id,
                    OrderTime = String.Format("{0:MMM dd, yyyy HH:mm}", (DateTime)order.OrderTime),
                    OrderUserName = order.FirstName + order.LastName,
                    Quantity = orderRepository.GetNumberTicketOfOrder(order.Id)
                };
                retEvent.Orders.Add(orderInfor);
            }

            return retEvent;

        }

        /// <summary>
        /// Check whether user have permission to access order information or not
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="orderId"></param>
        /// <returns></returns>
        public bool CheckOrderAccessAuthentication(string userName, int orderId)
        {
            event_Order order = orderRepository.GetOrderById(orderId);
            if (order == null)
            {
                return false;
            }
            else
            {
                return CheckEventOwner(order.EventId, userName);
            }
        }

        /// <summary>
        /// Get order details
        /// </summary>
        /// <param name="orderId"></param>
        /// <returns></returns>
        public OrderInformationModel OrderDetails(int orderId)
        {
            event_Order order = orderRepository.GetOrderById(orderId);
            OrderInformationModel retValue = new OrderInformationModel()
            {
                Guid = order.Guid,
                FirstName = order.FirstName,
                LastName = order.LastName,
                EmailAddress = order.EmailAddress,
                Status = order.Status == (int)Portal.Infractructure.Utility.Define.Status.Active?"Completed":"Pending",
                OrderTime = String.Format("{0:MMM dd, yyyy HH:mm}", (DateTime)order.OrderTime),
                PhoneNumber = order.PhoneNumber,
                Billing_Address = order.Billing_Address,
                Billing_Address2 = order.Billing_Address2,
                Billing_City = order.Billing_City,
                Billing_Country = order.Billing_Country,
                Shipping_Address = order.Shipping_Address,
                Shipping_Address2 = order.Shipping_Address2,
                Shipping_City = order.Shipping_City,
                Shipping_Country = order.Shipping_Country
            };
            retValue.OrderTickets = new List<TicketOrderInformation>();
            foreach (var ticket in order.OrderTickets)
            {
                TicketOrderInformation ticketInfor = new TicketOrderInformation()
                {
                    TicketCode = ticket.TicketCode,
                    TicketType = ticket.Ticket.Name
                };
                retValue.OrderTickets.Add(ticketInfor);
            }

            return retValue;
        }

        #endregion
    }
}