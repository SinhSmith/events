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

namespace OnlineStoreMVC.Controllers
{
    //CultureInfo provider = CultureInfo.InvariantCulture;
    // DateTime startDate;
    //if (DateTime.TryParseExact(request.StartDate, EventConstants.DefaultDateTimeFormat, provider, DateTimeStyles.None, out startDate))
    //{}

    // DateTime endDate;
    //if (DateTime.TryParseExact(request.EndDate, EventConstants.DefaultDateTimeFormat, provider, DateTimeStyles.None, out endDate))
    //{}
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
        private GetEventsByCategoryRequest CreateInitialSearchRequest(string searchString)
        {
            GetEventsByCategoryRequest request = new GetEventsByCategoryRequest()
            {
                Index = 1,
                NumberOfResultsPerPage = productPerPage,
                SortBy = Portal.Infractructure.Utility.Define.EventSortBy.Date,
                SearchString = searchString,
                StartDate = DateTime.Now

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
            CultureInfo provider = CultureInfo.InvariantCulture;
            DateTime startDate;
            DateTime.TryParseExact(request.StartDate, EventConstants.DefaultDateTimeFormat, provider, DateTimeStyles.None, out startDate);
            DateTime endDate;
            DateTime.TryParseExact(request.EndDate, EventConstants.DefaultDateTimeFormat, provider, DateTimeStyles.None, out endDate);

            GetEventsByCategoryRequest getEventsRequest = new GetEventsByCategoryRequest()
            {
                 Topics = request.Topics,
                 EventTypes = request.EventTypes,
                 SortBy = request.SortBy,
                 Price = request.Price,
                 StartDate = startDate,
                 EndDate = endDate,
                 Index = request.Index,
                 SearchString = request.SearchString,
                 Country = request.Country,
                 City = request.City,
                 NumberOfResultsPerPage = request.NumberOfResultsPerPage
            };

            return getEventsRequest;
        }

        /// <summary>
        /// Create SelectList sort product options using for dropdownlist
        /// </summary>
        /// <param name="option">selected option</param>
        /// <returns></returns>
        //private void PopulateStatusDropDownList(ProductsSortBy option = ProductsSortBy.ProductNameAToZ)
        //{
        //    IEnumerable<ProductsSortBy> values = Enum.GetValues(typeof(ProductsSortBy)).Cast<ProductsSortBy>();
        //    IEnumerable<SelectListItem> items = from value in values
        //                                        select new SelectListItem
        //                                        {
        //                                            Text = EnumHelper.GetDescriptionFromEnum((ProductsSortBy)value),
        //                                            Value = ((int)value).ToString(),
        //                                            Selected = value == option,
        //                                        };

        //    ViewBag.SortProductOptionsSelectListItems = items;
        //}

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
            //PopulateStatusDropDownList();
            //PopulateNewProductList();
            //PopulateBestSellProductList();
            //PopulateCategoryList();
            //PopulateTopCategoryList();
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
            return Json(response);
        }

        /// <summary>
        /// Get details of selected product
        /// </summary>
        /// <param name="id">id of product</param>
        /// <returns></returns>
        public ActionResult ProductDetails(int? id)
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
        public ActionResult SearchEvent(string searchString)
        {

            GetEventsByCategoryRequest request = CreateInitialSearchRequest(searchString);
            GetEventsByCategoryResponse response = service.SearchByEventName(request);
            //PopulateCategoryList();

            return View("SearchResult", response);
        }

        /// <summary>
        /// Get list event matched conditions
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult GetSearchProductsByAjax(string searchString)
        {
            GetEventsByCategoryRequest request = CreateInitialSearchRequest(searchString);
            GetEventsByCategoryResponse response = service.SearchByEventName(request);
            return Json(response);
        }

        #endregion
    }
}