using Portal.Model.Context;
using Portal.Model.Repository;
using Portal.Service.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Portal.Model.Mapper;

namespace Portal.Service.Implements
{
    public class UserResourcesService : IUserResourcesService
    {
        #region Properties

        private static PortalEntities context = new PortalEntities();
        private EventRepository eventRepository = new EventRepository(context);
        private EventOrderRepository orderRepository = new EventOrderRepository(context);
        private UserRepository userRepository = new UserRepository(context);

        #endregion

        #region Constructures

        public UserResourcesService()
        {
            context = new PortalEntities();
            eventRepository = new EventRepository(context);
            orderRepository = new EventOrderRepository(context);
            userRepository = new UserRepository(context);
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
            user.BookMarkEvents.Add(selectedEvent);
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

        #endregion


        public IEnumerable<event_Order> GetListOrder(string userName)
        {
            throw new NotImplementedException();
        }
    }
}
