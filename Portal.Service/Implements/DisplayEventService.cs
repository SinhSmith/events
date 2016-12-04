using LinqKit;
using Portal.Infractructure.Utility;
using Portal.Model.Context;
using Portal.Model.Repository;
using Portal.Service.Interfaces;
using Portal.Service.MessageModel;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Portal.Model.Mapper;
using Portal.Model.ViewModel;
using Portal.Model.MessageModel;

namespace Portal.Service.Implements
{
    public class DisplayEventService : IDisplayEventService
    {
        #region Properties

        private static PortalEntities context = new PortalEntities();
        private EventRepository db = new EventRepository(context);
        private EventOrderRepository orderRepository = new EventOrderRepository(context);
        private TicketRepository ticketRepository = new TicketRepository(context);
        private UserRepository userRepository = new UserRepository(context);

        #endregion

        #region Constructures

        public DisplayEventService()
        {
            context = new PortalEntities();
            db = new EventRepository(context);
            orderRepository = new EventOrderRepository(context);
            ticketRepository = new TicketRepository(context);
            userRepository = new UserRepository(context);
        }

        #endregion

        #region Private functions

        /// <summary>
        /// Get list product with selected category, seach string, order, filter after price range, filter after brands, paging
        /// </summary>
        /// <param name="request">conditions for filter</param>
        /// <returns>list product matching with conditions</returns>
        private IEnumerable<event_Event> GetAllEventsMatchingQueryAndSort(GetEventsByCategoryRequest request)
        {
            
            var searchQuery = PredicateBuilder.True<event_Event>();

            if (request.Topics.Count() > 0)
            {
                searchQuery = searchQuery.And(e => request.Topics.Contains(e.EventTopic));
            }

            if (request.EventTypes.Count() > 0)
            {
                searchQuery = searchQuery.And(e => request.EventTypes.Contains(e.EventType));
            }

            if (request.StartDate!=null)
            {
                searchQuery = searchQuery.And(e => e.StartDate >= request.StartDate);
            }
            else
            {
                searchQuery = searchQuery.And(e => e.StartDate >= DateTime.Now);
            }

            if (request.EndDate!=null)
            {
                searchQuery = searchQuery.And(p => p.StartDate <= request.EndDate);
            }

            switch (request.Price)
            {
                case Portal.Infractructure.Utility.Define.TicketPriceType.Free:
                    searchQuery = searchQuery.And(e => e.Tickets.Any(t => t.Type == (int)Portal.Infractructure.Utility.Define.TicketType.Free));
                    break;
                case Portal.Infractructure.Utility.Define.TicketPriceType.Paid:
                    searchQuery = searchQuery.And(e => e.Tickets.Any(t => t.Type == (int)Portal.Infractructure.Utility.Define.TicketType.Paid));
                    break;
            }

            if (request.Country != null)
            {
                searchQuery = searchQuery.And(e => e.Country.Contains(request.Country));
            }

            if (request.State != null)
            {
                searchQuery = searchQuery.And(e => e.Location_State.Contains(request.State));
            }

            //if (request.City != null)
            //{
            //    searchQuery = searchQuery.And(e => e.Location_City.Contains(request.City));
            //}

            if (request.SearchString != null && request.SearchString != string.Empty)
            {
                searchQuery = searchQuery.And(e => e.Title.Contains(request.SearchString));
            }

            searchQuery = searchQuery.And(e => e.Status == (int)Portal.Infractructure.Utility.Define.Status.Active && e.IsVerified);

            IEnumerable<event_Event> eventsMatchingRefinement = db.Get(
                filter: searchQuery, includeProperties: "CoverImage,AspNetUser,Tickets");
            switch (request.SortBy)
            {
                case Portal.Infractructure.Utility.Define.EventSortBy.Name:
                    eventsMatchingRefinement = eventsMatchingRefinement
                    .OrderBy(p => p.Title);
                    break;
                case Portal.Infractructure.Utility.Define.EventSortBy.Date:
                    eventsMatchingRefinement = eventsMatchingRefinement
                    .OrderBy(p => p.StartDate);
                    break;
            }

            return eventsMatchingRefinement.ToList();

        }

        /// <summary>
        /// Crop list event result to satisfy current page
        /// </summary>
        /// <param name="productsFound">list event need to paging</param>
        /// <param name="pageIndex">current index of page on Layout</param>
        /// <param name="numberOfResultsPerPage">total event displayed on a page</param>
        /// <returns>list event result</returns>
        private IEnumerable<event_Event> CropEventListToSatisfyGivenIndex(IEnumerable<event_Event> eventsFound, int pageIndex, int numberOfResultsPerPage)
        {
            if (pageIndex > 1)
            {
                int numToSkip = (pageIndex - 1) * numberOfResultsPerPage;
                return eventsFound.Skip(numToSkip)
                .Take(numberOfResultsPerPage).ToList();
            }
            else
            {
                return eventsFound.Take(numberOfResultsPerPage).ToList();
            }
        }

        /// <summary>
        /// Get event topic name by id
        /// </summary>
        /// <param name="eventId"></param>
        /// <returns></returns>
        public string GetEventTopicNameById(int id)
        {
           EventTopicModel topic = GetListEventTopics().Where(t => t.Id == id).FirstOrDefault();
           if (topic != null)
           {
               return topic.Name;
           }
           else
           {
               return String.Empty;
           }
        }

        /// <summary>
        /// Get list event topics by ids
        /// </summary>
        /// <param name="topicIds"></param>
        /// <returns></returns>
        private IEnumerable<EventTopicModel> GetListEventTopics(List<int> topicIds)
        {
            return GetListEventTopics().Where(t => topicIds.Contains(t.Id)).ToList();
        }

        /// <summary>
        /// Get event type name by id
        /// </summary>
        /// <param name="eventId"></param>
        /// <returns></returns>
        public string GetEventTypeNameById(int id)
        {
            EventTypeModel type = GetListEventTypes().Where(t => t.Id == id).FirstOrDefault();
            if (type != null)
            {
                return type.Name;
            }
            else
            {
                return String.Empty;
            }
        }

        /// <summary>
        /// Get list event types by ids
        /// </summary>
        /// <param name="eventTypeIds"></param>
        /// <returns></returns>
        private IEnumerable<EventTypeModel> GetListEventTypes(List<int> eventTypeIds)
        {
            return GetListEventTypes().Where(t => eventTypeIds.Contains(t.Id)).ToList();
        }

        private bool CheckAvailableTicket(int eventId, int ticketId,int orderQuantity)
        {
            //List<event_TicketOrder> orderedTickets = orderRepository.GetOrderedTicket(eventId, ticketId);

            int numberOrderedTicket = orderRepository.GetNumberOrderedTicket(eventId, ticketId);

            //foreach (var ticket in orderedTickets)
            //{
            //    numberOrderedTicket += (int)ticket.Quantity;
            //}

            int totalTickets = ticketRepository.GetTicketById(ticketId).AvailableTicketQuantity;

            if (orderQuantity > (totalTickets - numberOrderedTicket))
            {
                return false;
            }else{
                return true;
            }
            
        }

        #endregion

        #region Public functions

        /// <summary>
        /// Get list event after category
        /// </summary>
        /// <param name="request">condition for filter</param>
        /// <returns>matched condition events</returns>
        public GetEventsByCategoryResponse GetEventsByCategory(GetEventsByCategoryRequest request)
        {
            IEnumerable<event_Event> foundEvents = GetAllEventsMatchingQueryAndSort(request);

            // Set Event Type and Event Topic
            foreach (var item in foundEvents)
            {
                item.EventTopicName = GetEventTopicNameById(item.EventTopic);
                item.EventTypeName = GetEventTypeNameById(item.EventType);
            }

            GetEventsByCategoryResponse reponse = new GetEventsByCategoryResponse()
            {
                EventTypes = request.EventTypes,
                Topics = request.Topics,
                StartDate = request.StartDate!=null?((DateTime)request.StartDate).ToString(EventConstants.DefaultDateTimeFormat):null,
                EndDate = request.EndDate!=null?((DateTime)request.EndDate).ToString(EventConstants.DefaultDateTimeFormat):null,
                NumberOfTitlesFound = foundEvents.Count(),
                TotalNumberOfPages = (int)Math.Ceiling((double)foundEvents.Count() / request.NumberOfResultsPerPage),
                CurrentPage = request.Index,
                TotalEvents = foundEvents.Count(),
                SearchString = request.SearchString,
                SortBy = request.SortBy,
                Price = request.Price,
                Country = request.Country,
                State = request.State,
                City = request.City,
                Events = CropEventListToSatisfyGivenIndex(foundEvents, request.Index, request.NumberOfResultsPerPage).ConvertToEventSummaryViews().ToList(),
                ListEventTypes = GetListEventTypes(foundEvents.Select(p => p.EventType).Distinct().ToList()),
                ListTopics = GetListEventTopics(foundEvents.Select(p => p.EventTopic).Distinct().ToList()),
                DateFilterType = request.DateFilterType
            };

            return reponse;
        }

        ///// <summary>
        ///// Get details product
        ///// </summary>
        ///// <param name="id">id of product</param>
        ///// <returns>Product details object</returns>
        public EventDetailsResponse GetEventDetails(int id)
        {
            event_Event eventObject = db.GetEventById(id);
            if (eventObject == null)
            {
                return null;
            }
            else
            {
                EventDetailsResponse result = eventObject.ConvertToEventDetailsModel();
                foreach (var ticket in result.Tickets)
                {
                    ticket.AvailableQuantity = ticket.Quantity - orderRepository.GetNumberOrderedTicket(eventObject.Id, (int)ticket.Id);
                }

                return result;
            }
        }

        ///// <summary>
        ///// Get list event in next 7 days
        ///// </summary>
        ///// <returns></returns>
        public IEnumerable<DisplayEventSummaryView> GetAllNearestEvent()
        {
            IEnumerable<event_Event> events = db.Get(filter: p => p.StartDate >= DateTime.Now && p.StartDate < DateTime.Now.AddDays(7) && p.Status == (int)Define.Status.Active).Take(10);

            return events.ConvertToEventSummaryViews();
        }

        /// <summary>
        /// Search event by name
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        public GetEventsByCategoryResponse SearchByEventName(GetEventsByCategoryRequest request)
        {
            IEnumerable<event_Event> foundEvents = GetAllEventsMatchingQueryAndSort(request);

            GetEventsByCategoryResponse response = new GetEventsByCategoryResponse()
            {
                EventTypes = request.EventTypes,
                Topics = request.Topics,
                StartDate = ((DateTime)request.StartDate).ToString(EventConstants.DefaultDateTimeFormat),
                EndDate = ((DateTime)request.EndDate).ToString(EventConstants.DefaultDateTimeFormat),
                NumberOfTitlesFound = foundEvents.Count(),
                TotalNumberOfPages = (int)Math.Ceiling((double)foundEvents.Count() / request.NumberOfResultsPerPage),
                CurrentPage = request.Index,
                TotalEvents = foundEvents.Count(),
                SearchString = request.SearchString,
                SortBy = request.SortBy,
                Price = request.Price,
                Country = request.Country,
                City = request.City,
                Events = CropEventListToSatisfyGivenIndex(foundEvents, request.Index, request.NumberOfResultsPerPage).ConvertToEventSummaryViews(),
                ListEventTypes = GetListEventTypes(foundEvents.Select(p => p.EventType).Distinct().ToList()),
                ListTopics = GetListEventTopics(foundEvents.Select(p => p.EventTopic).Distinct().ToList())
            };

            return response;
        }

        /// <summary>
        /// Get event by id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public event_Event GetEventById(int id)
        {
            return db.GetEventById(id);
        }

        /// <summary>
        /// Get list event types
        /// </summary>
        /// <returns></returns>
        public IEnumerable<EventTypeModel> GetListEventTypes()
        {
            IList<EventTypeModel> listEventTypes = new List<EventTypeModel>(){
                new EventTypeModel() {Id=19, Name="Appearance or Signing"},
                new EventTypeModel() {Id=17, Name="Attraction"},
                new EventTypeModel() {Id=18, Name="Camp, Trip, or Retreat"},
                new EventTypeModel() {Id=9, Name="Class, Training, or Workshop"},
                new EventTypeModel() {Id=6, Name="Concert or Performance"},
                new EventTypeModel() {Id=1, Name="Conference"},
                new EventTypeModel() {Id=4, Name="Convention"},
                new EventTypeModel() {Id=8, Name="Dinner or Gala"},
                new EventTypeModel() {Id=5, Name="Festival or Fair"},
                new EventTypeModel() {Id=14, Name="Game or Competition"},
                new EventTypeModel() {Id=10, Name="Meeting or Networking Event"},
                new EventTypeModel() {Id=100, Name="Other"},
                new EventTypeModel() {Id=11, Name="Party or Social Gathering"},
                new EventTypeModel() {Id=15, Name="Race or Endurance Event"},
                new EventTypeModel() {Id=12, Name="Rally"},
                new EventTypeModel() {Id=7, Name="Screening"},
                new EventTypeModel() {Id=2, Name="Ceminar or Talk"},
                new EventTypeModel() {Id=16, Name="Tour"},
                new EventTypeModel() {Id=13, Name="Tournament"},
                new EventTypeModel() {Id=3, Name="Tradeshow, Consumer Show, or Expo"}
            };

            return listEventTypes;
        }

        /// <summary>
        /// Get event topics list
        /// </summary>
        /// <returns></returns>
        public IEnumerable<EventTopicModel> GetListEventTopics()
        {
            IList<EventTopicModel> GetListEventTopics = new List<EventTopicModel>(){
                new EventTopicModel() {Id=118,Name="Auto, Boat & Air"},
                new EventTopicModel() {Id=101,Name="Business & Professional"},
                new EventTopicModel() {Id=111,Name="Charity & Causes"},
                new EventTopicModel() {Id=113,Name="Community & Culture"},
                new EventTopicModel() {Id=115,Name="Family & Education"},
                new EventTopicModel() {Id=106,Name="Fashion & Beauty"},
                new EventTopicModel() {Id=104,Name="Film, Media & Entertainment"},
                new EventTopicModel() {Id=110,Name="Food & Drink"},
                new EventTopicModel() {Id=112,Name="Government & Politics"},
                new EventTopicModel() {Id=107,Name="Health & Wellness"},
                new EventTopicModel() {Id=119,Name="Hobbies & Special Interest"},
                new EventTopicModel() {Id=117,Name="Home & Lifestyle"},
                new EventTopicModel() {Id=103,Name="Music"},
                new EventTopicModel() {Id=199,Name="Other"},
                new EventTopicModel() {Id=105,Name="Performing & Visual Arts"},
                new EventTopicModel() {Id=114,Name="Religion & Spirituality"},
                new EventTopicModel() {Id=102,Name="Science & Technology"},
                new EventTopicModel() {Id=116,Name="Seasonal & Holiday"},
                new EventTopicModel() {Id=108,Name="Sports & Fitness"},
                new EventTopicModel() {Id=109,Name="Travel & Outdoor"}
            };

            return GetListEventTopics;
        }

        /// <summary>
        /// Get events by topic
        /// </summary>
        /// <param name="topicId"></param>
        /// <returns></returns>
        public IEnumerable<DisplayEventSummaryView> GetEventByTopic(int topicId)
        {
            IEnumerable<event_Event> events = db.GetAllEventsWithoutDelete().Where(e => e.EventTopic == topicId).ToList();

            return events.ConvertToEventSummaryViews().ToList();
        }

        /// <summary>
        /// Add new order
        /// </summary>
        /// <param name="orderRequest"></param>
        /// <returns>Return Guid of new order if Create Order successful, return null if Create Order fail</returns>
        public Guid? AddOrder(GetOrderTicketFormRequest orderRequest,ref string message)
        {
           try
            {
               string userId = null;
               if(orderRequest.Owner!=null && orderRequest.Owner != string.Empty){
                   AspNetUser user = userRepository.GetUserByName(orderRequest.Owner);
                   userId = user.Id;
               }

               // Check have enough available tickets or not
               bool orderValid = true;

               foreach (var item in orderRequest.Tickets)
               {
                   if (!CheckAvailableTicket(orderRequest.EventId, item.TicketId, item.TicketQuantity))
                   {
                       orderValid = false;
                   }
               }

               if (!orderValid)
               {
                   message = "Have not enough ticket available";
                   return null;
               }
               
               // Create Order
                event_Order order = new event_Order()
                {
                    EventId = orderRequest.EventId,
                    Guid = Guid.NewGuid(),
                    Status = (int)Portal.Infractructure.Utility.Define.Status.Deactive,
                    OrderTime = DateTime.Now,
                    UserId = userId
                };

               // Create Order Ticket
                foreach (var item in orderRequest.Tickets)
                {
                    for (int i = 0; i < item.TicketQuantity; i++)
                    {
                        order.OrderTickets.Add(new event_TicketOrder()
                        {
                            TicketId = item.TicketId,
                            TicketCode = Guid.NewGuid(),
                        });
                    }
                }

                orderRepository.Insert(order);

                orderRepository.Save();

                return order.Guid;
            }
            catch(Exception ex)
            {
                message = ex.Message;
                return null;
            }
        }

        /// <summary>
        /// Get Order by guid
        /// </summary>
        /// <param name="orderGuid"></param>
        /// <returns></returns>
        public event_Order GetOrderByGuid(Guid orderGuid)
        {
            return orderRepository.getEventByGuid(orderGuid);
        }

        /// <summary>
        /// Confirm ticket order
        /// </summary>
        /// <param name="orderInfor"></param>
        /// <param name="message"></param>
        /// <returns></returns>
        public bool ConfirmOrderTicket(ConfirmOrderTicketRequest orderInfor, ref string message)
        {
            event_Order order = orderRepository.getEventByGuid(orderInfor.OrderId);
            if(order == null){
                message = "Order was not found!";
                return false;
            }

            if (orderInfor.SubmitTime.Subtract((DateTime)order.OrderTime).Minutes > 8)
            {
                message = "Order was time out!";
                return false;
            }

            bool orderValid = true;

            IList<TicketOrderGroup> orderGroups = order.OrderTickets.GroupBy(t => t.TicketId).Select(g => new TicketOrderGroup()
            {
                TicketId = g.Key,
                Quantity = g.Count()
            }).ToList();

            foreach (var item in orderGroups)
            {
                if (!CheckAvailableTicket(order.EventId, item.TicketId,item.Quantity))
                {
                    orderValid = false;
                }
            }

            if (!orderValid) {
                message = "Have not enough ticket available";
                return false;
            }

            try
            {
                order.FirstName = orderInfor.FirstName;
                order.LastName = orderInfor.LastName;
                order.EmailAddress = orderInfor.EmailAddress;
                order.PhoneNumber = orderInfor.PhoneNumber;
                order.Billing_Address = orderInfor.Billing_Address;
                order.Billing_Address2 = orderInfor.Billing_Address2;
                order.Billing_City = orderInfor.Billing_City;
                order.Billing_Country = orderInfor.Billing_Country;
                order.Shipping_Address = orderInfor.Shipping_Address;
                order.Shipping_Address2 = orderInfor.Shipping_Address2;
                order.Shipping_City = orderInfor.Shipping_City;
                order.Shipping_Country = orderInfor.Shipping_Country;
                order.Status = (int)Portal.Infractructure.Utility.Define.Status.Active;
                orderRepository.Save();

                message = "Order tickets successful!";
                return true;
            }
            catch (Exception ex)
            {
                message = ex.Message;
                return false;
            }
        }

        /// <summary>
        /// Check Order session is timeout or not
        /// </summary>
        /// <param name="orderGuid"></param>
        /// <param name="message"></param>
        /// <returns></returns>
        public bool CheckOrderSessionTimeOut(Guid orderGuid, ref string message)
        {
            event_Order order = orderRepository.getEventByGuid(orderGuid);
            if (order == null)
            {
                message = "Order was not found!";
                return false;
            }

            if ((DateTime.Now-(DateTime)order.OrderTime).TotalSeconds > 480)
            {
                // Delete order when order session time out
                order.Status = (int)Portal.Infractructure.Utility.Define.Status.Delete;
                orderRepository.Save();

                message = "Order was time out!";
                return false;
            }

            message = "Check Order session timeout successful!";
            return true;
        }

        #endregion

        #region Release resources

        /// <summary>
        /// Refresh entities to clean cache of Entity framework
        /// </summary>
        public void RefreshAll()
        {
            foreach (var entity in context.ChangeTracker.Entries())
            {
                entity.Reload();
            }
        }

        /// <summary>
        /// Dispose database connection using in repositories, which used in this service
        /// </summary>
        public void Dispose()
        {
            db.Dispose();
            orderRepository.Dispose();
            ticketRepository.Dispose();
        }

        #endregion
    }
}
