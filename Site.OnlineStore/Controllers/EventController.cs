using Portal.Infractructure.Helper;
using Portal.Infractructure.Utility;
using Portal.Model.ViewModel;
using Portal.Service.Implements;
using Portal.Service.Interfaces;
using Portal.Service.MessageModel;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace Site.OnlineStore.Controllers
{
    public class EventController : Controller
    {
         #region Properties

        public IDisplayEventService service = new DisplayEventService();
        private static int productPerPage = 10;

        #endregion
        
        #region Constructures

        public EventController()
        {
            service = new DisplayEventService();
        }

        #endregion

        #region private functions

        /// <summary>
        /// Genarate initial Request object to get list product after category
        /// </summary>
        /// <param name="categoryId">id of selected category</param>
        /// <returns></returns>
        private GetEventsByCategoryRequest CreateInitialEventSearchRequest(int categoryId)
        {
            GetEventsByCategoryRequest request = new GetEventsByCategoryRequest()
            {
                Topics = new List<int> { categoryId },
                Index = 1,
                NumberOfResultsPerPage = productPerPage,
                SortBy = Portal.Infractructure.Utility.Define.EventSortBy.Date,
                StartDate = DateTime.Now
            };

            return request;
        }

        /// <summary>
        /// Genarate initial Request of Search event request
        /// </summary>
        /// <param name="categoryId">id of selected category</param>
        /// <returns></returns>
        private GetEventsByCategoryRequest CreateInitialSearchRequest(string City,string Country,string SearchString, Portal.Infractructure.Utility.Define.DateFilterType DateFilterType)
        {
            GetEventsByCategoryRequest request = new GetEventsByCategoryRequest()
            {
                Index = 1,
                NumberOfResultsPerPage = productPerPage,
                SortBy = Portal.Infractructure.Utility.Define.EventSortBy.Date,
                SearchString = SearchString,
                StartDate = DateTime.Now,
                DateFilterType = DateFilterType,
                City = City,
                Country = Country,
                Price = Define.TicketPriceType.AllPrices
            };

            return request;
        }

        /// <summary>
        /// Genarate request object to get list events, which matched conditions
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        private GetEventsByCategoryRequest GenarateGetEventsWithFiltersRequest(GetEventsWithFiltersRequest request)
        {
            GetEventsByCategoryRequest getEventsRequest = new GetEventsByCategoryRequest()
            {
                Topics = request.Topics,
                EventTypes = request.EventTypes,
                SortBy = request.SortBy,
                Price = request.Price,
                //StartDate = startDate,
                //EndDate = endDate,
                Index = request.Index,
                SearchString = request.SearchString,
                Country = request.Country,
                City = request.City,
                NumberOfResultsPerPage = request.NumberOfResultsPerPage,
            };

            CultureInfo provider = CultureInfo.InvariantCulture;
            DateTime startDate;
            DateTime endDate;
            var dateNow = DateTime.Now;
            DateTime baseDate = new DateTime(dateNow.Year, dateNow.Month, dateNow.Day, 0, 0, 0); 
            var thisWeekStart = baseDate.AddDays(-(int)baseDate.DayOfWeek);

            switch (request.DateFilterType)
            {
                case Portal.Infractructure.Utility.Define.DateFilterType.AllDates:
                    break;
                case Portal.Infractructure.Utility.Define.DateFilterType.Today:
                    getEventsRequest.StartDate = baseDate;
                    getEventsRequest.EndDate = baseDate.AddDays(1).AddSeconds(-1);
                    break;
                case Portal.Infractructure.Utility.Define.DateFilterType.Tomorrow:
                    getEventsRequest.StartDate = baseDate.AddDays(1);
                    getEventsRequest.EndDate = baseDate.AddDays(2).AddSeconds(-1);
                    break;
                case Portal.Infractructure.Utility.Define.DateFilterType.ThisWeek:
                    getEventsRequest.StartDate = baseDate;
                    getEventsRequest.EndDate = thisWeekStart.AddDays(7).AddSeconds(-1);
                    break;
                case Portal.Infractructure.Utility.Define.DateFilterType.ThisWeekend:
                    getEventsRequest.StartDate = thisWeekStart.AddDays(5);
                    getEventsRequest.EndDate = thisWeekStart.AddDays(7).AddSeconds(-1);
                    break;
                case Portal.Infractructure.Utility.Define.DateFilterType.NextWeek:
                    getEventsRequest.StartDate = thisWeekStart.AddDays(7);
                    getEventsRequest.EndDate = thisWeekStart.AddDays(14).AddSeconds(-1);
                    break;
                case Portal.Infractructure.Utility.Define.DateFilterType.NextMonth:
                    getEventsRequest.StartDate = new DateTime(baseDate.Year, baseDate.Month+1, 1);
                    getEventsRequest.EndDate = ((DateTime)getEventsRequest.StartDate).AddMonths(1).AddDays(-1);
                    break;
                case Portal.Infractructure.Utility.Define.DateFilterType.CustomDate:
                     if (request.StartDate != null && DateTime.TryParseExact(request.StartDate, EventConstants.DefaultDateTimeFormat, provider, DateTimeStyles.None, out startDate))
                    {
                        getEventsRequest.StartDate = startDate;
                    }
                    else
                    {
                        getEventsRequest.StartDate = baseDate;
                    }
                    if (request.EndDate != null && DateTime.TryParseExact(request.EndDate, EventConstants.DefaultDateTimeFormat, provider, DateTimeStyles.None, out endDate))
                    {
                        getEventsRequest.EndDate = endDate;
                    }
                    break;
            }

           

            return getEventsRequest;
        }

        private List<EventFilterDate> GetListEventFilterDate(Portal.Infractructure.Utility.Define.DateFilterType selectedItem = Portal.Infractructure.Utility.Define.DateFilterType.AllDates)
        {
            IEnumerable<Define.DateFilterType> values = Enum.GetValues(typeof(Define.DateFilterType)).Cast<Define.DateFilterType>();
            IEnumerable<EventFilterDate> items = from value in values
                                                select new EventFilterDate
                                                {
                                                    Name = EnumHelper.GetDescriptionFromEnum((Define.DateFilterType)value),
                                                    Id = (int)value,
                                                    IsSelected = value == selectedItem,
                                                };

            return items.ToList();
        }

        #endregion

        #region controller actions

        /// <summary>
        /// Display event index
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// Get EventView contain list event of selected category
        /// </summary>
        /// <param name="id">id of category</param>
        /// <returns></returns>
        public ActionResult GetProductByCategory(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GetEventsByCategoryRequest request = CreateInitialEventSearchRequest((int)id);
            GetEventsByCategoryResponse response = service.GetEventsByCategory(request);
            return View("DisplayProducts", response);
        }

        /// <summary>
        /// Get list product matched conditions
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult GetEventsByAjax(GetEventsWithFiltersRequest request)
        {
            GetEventsByCategoryRequest getEventRequest = GenarateGetEventsWithFiltersRequest(request);
            GetEventsByCategoryResponse response = service.GetEventsByCategory(getEventRequest);
            return Json(response, JsonRequestBehavior.AllowGet);
        }

        /// <summary>
        /// Get details of selected product
        /// </summary>
        /// <param name="id">id of product</param>
        /// <returns></returns>
        public ActionResult EventDetails(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            EventFullView foundEvent = service.GetEventDetails((int)id);
            //PopulateNewProductList();
            //PopulateCategoryList();
            //PopulateTopCategoryList();

            return View("ProductDetails", foundEvent);
        }

        /// <summary>
        /// Search event and return to search event view contain all matched events
        /// </summary>
        /// <param name="id">id of category</param>
        /// <returns></returns>
        public ActionResult SearchEvent(string City, string Country, string SearchString, Portal.Infractructure.Utility.Define.DateFilterType DateFilterType)
        {

            GetEventsByCategoryRequest request = CreateInitialSearchRequest(City, Country, SearchString, DateFilterType);
            GetEventsByCategoryResponse response = service.GetEventsByCategory(request);
            ViewBag.ListEventTopics = service.GetListEventTopics();
            ViewBag.ListEventTypes = service.GetListEventTypes();
            ViewBag.ListEventDateFilterRules = GetListEventFilterDate(DateFilterType);

            var filterModel = new Portal.Service.MessageModel.SearchFilterModel()
            {
                City = response.City,
                Country = response.Country,
                DateFilterType = response.DateFilterType,
                SearchString = response.SearchString,
                TotalNumberOfPages = response.TotalNumberOfPages,
                EventTypes = response.EventTypes,
                Topics = response.Topics,
                TotalEvents = response.TotalEvents
            };

            ViewBag.FilterModel = filterModel;



            return View("DisplayEvents", response);
        }

        /// <summary>
        /// Get list event matched conditions
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult GetSearchEventsByAjax(GetEventsWithFiltersRequest request)
        {
            GetEventsByCategoryRequest getEventRequest = GenarateGetEventsWithFiltersRequest(request);
            GetEventsByCategoryResponse response = service.GetEventsByCategory(getEventRequest);
            return View("DisplayEvents", response);
        }

        public ActionResult DisplayEvents()
        {
            ViewBag.ListEventTopics = service.GetListEventTopics();
            ViewBag.ListEventTypes = service.GetListEventTypes();
            return View("DisplayEvents");
        }

        #endregion
    }
}