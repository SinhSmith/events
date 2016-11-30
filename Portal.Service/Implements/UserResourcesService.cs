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

        #endregion

        #region Constructures

        public UserResourcesService()
        {
            context = new PortalEntities();
            eventRepository = new EventRepository(context);
            orderRepository = new EventOrderRepository(context);
            userRepository = new UserRepository(context);
            ticketRepository = new TicketRepository(context);
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

        #endregion
    }
}
