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

namespace Portal.Service.Implements
{
    public class DisplayEventService : IDisplayEventService
    {
        #region Properties

        private static PortalEntities context = new PortalEntities();
        private EventRepository db = new EventRepository(context);

        #endregion

        #region Constructures

        public DisplayEventService()
        {
            context = new PortalEntities();
            db = new EventRepository(context);
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

            if (request.EndDate!=null)
            {
                searchQuery = searchQuery.And(p => p.StartDate <= request.EndDate);
            }

            if (request.Price != null)
            {
                switch (request.Price)
                {
                    case Portal.Infractructure.Utility.Define.TicketPriceType.Free:
                        searchQuery = searchQuery.And(e => e.Tickets.Any(t => t.Type == (int)Portal.Infractructure.Utility.Define.TicketType.Free));
                        break;
                    case Portal.Infractructure.Utility.Define.TicketPriceType.Paid:
                        searchQuery = searchQuery.And(e => e.Tickets.Any(t => t.Type == (int)Portal.Infractructure.Utility.Define.TicketType.Paid));
                        break;
                }
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
        private string GetEventTopicNameById(int id)
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
        /// Get list event types by ids
        /// </summary>
        /// <param name="eventTypeIds"></param>
        /// <returns></returns>
        private IEnumerable<EventTypeModel> GetListEventTypes(List<int> eventTypeIds)
        {
            return GetListEventTypes().Where(t => eventTypeIds.Contains(t.Id)).ToList();
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
        public EventFullView GetEventDetails(int id)
        {
            event_Event eventObject = db.GetEventById(id);
            if (eventObject == null)
            {
                return null;
            }
            else
            {
                return eventObject.ConvertToEventFullView();
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


        public IEnumerable<DisplayEventSummaryView> GetEventByTopic(int topicId)
        {
            IEnumerable<event_Event> events = db.GetAllEventsWithoutDelete().Where(e => e.EventTopic == topicId).ToList();

            return events.ConvertToEventSummaryViews().ToList();
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
        }

        #endregion
    }
}
