using Portal.Infractructure.Helper;
using Portal.Infractructure.Utility;
using Portal.Model.Context;
using Portal.Model.MessageModel;
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
using Portal.Model.Mapper;
using Site.OnlineStore.Models.ImageModels;
using System.IO;
using Site.OnlineStore.Areas.Admin.Controllers;

namespace Site.OnlineStore.Controllers
{
    public class EventController : BaseManagementController
    {
        #region Properties

        public IDisplayEventService service = new DisplayEventService();
        public IEventManagementService eventManagementService = new EventManagementService();
        public IUserResourcesService userService = new UserResourcesService();

        private static int productPerPage = 10;

        #endregion
        
        #region Constructures

        public EventController()
        {
            service = new DisplayEventService();
            eventManagementService = new EventManagementService();
            userService = new UserResourcesService();
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
        private GetEventsByCategoryRequest CreateInitialSearchRequest(string City,string State,string Country,string SearchString,
            Portal.Infractructure.Utility.Define.DateFilterType DateFilterType, 
            int? Topic,int? EventType)
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
                State = State,
                Country = Country,
                Price = Define.TicketPriceType.AllPrices,
                Topics = Topic != null ? new List<int>() { (int)Topic} :new List<int>(),
                EventTypes = EventType!=null ? new List<int>() { (int)EventType}:new List<int>()
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
                State = request.State,
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

        /// <summary>
        /// Delete image from server
        /// </summary>
        /// <param name="path"></param>
        /// <returns></returns>
        [NonAction]
        private bool DeleteImageInFolder(string path)
        {

            string filePath = Server.MapPath("~/" + path);
            if (System.IO.File.Exists(filePath))
            {
                try
                {
                    System.IO.File.Delete(filePath);
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }
            }
            return true;
        }

        /// <summary>
        /// Upload project image
        /// </summary>
        /// <param name="file"></param>
        /// <param name="counter"></param>
        /// <returns></returns>
        public bool UploadProjectImages(HttpPostedFileBase file, out string uploadedFileName, Int32 counter = 0)
        {
            try
            {
                ImageUpload projectImage = new ImageUpload { SavePath = DisplayProjectConstants.ProjectImageFolderPath };
                var fileName = Path.GetFileName(file.FileName);
                string finalFileName = "ProjectImage_" + ((counter).ToString()) + "_" + fileName;
                if (System.IO.File.Exists(HttpContext.Request.MapPath("~" + DisplayProjectConstants.ProjectImageFolderPath + finalFileName)))
                {
                    return UploadProjectImages(file, out uploadedFileName, ++counter);
                }
                ImageResult uploadedProjectImage = projectImage.UploadProductImage(file, finalFileName, 1000);
                uploadedFileName = uploadedProjectImage.ImageName;
                return true;
            }
            catch (Exception)
            {
                uploadedFileName = null;
                return false;
            }
        }

        /// <summary>
        /// Get list options for country dropdownlist and assign to Variable in ViewBag of view
        /// </summary>
        /// <param name="status"></param>
        private void PopulateCountryDropDownList(string country = null)
        {
            IEnumerable<SelectListItem> items = GetCountriesList(country);

            ViewBag.Country = items;
        }

        /// <summary>
        /// Get list options for event type dropdownlist and assign to Variable in ViewBag of view
        /// </summary>
        /// <param name="status"></param>
        private void PopulateEventTypeDropDownList(int? type)
        {
            IEnumerable<SelectListItem> items = GetEventTypeList(type);

            ViewBag.EventType = items;
        }

        /// <summary>
        /// Get list options for event topic dropdownlist and assign to Variable in ViewBag of view
        /// </summary>
        /// <param name="status"></param>
        private void PopulateEventTopicDropDownList(int? topic)
        {
            IEnumerable<SelectListItem> items = GetEventTopicList(topic);

            ViewBag.EventTopic = items;
        }

        /// <summary>
        /// Get list options for sale chanels dropdownlist and assign to Variable in ViewBag of view
        /// </summary>
        /// <param name="status"></param>
        private IList<SaleChanelOption> PopulateSaleChanelDropDownList()
        {
            IList<SaleChanelOption> saleChanels = new List<SaleChanelOption>
            {
                new SaleChanelOption() {Value=0,Text="Everywhere"},
                new SaleChanelOption() {Value=1,Text="Online only"},
                new SaleChanelOption() {Value=2,Text="At the door only"}
            };

            return saleChanels;
        }

        /// <summary>
        /// Get list options for ticket type dropdownlist and assign to Variable in ViewBag of view
        /// </summary>
        /// <param name="status"></param>
        private void PopulateTicketTypeDropDownList(string type = null)
        {
            IEnumerable<SelectListItem> items = GetTicketTypeList(type);

            ViewBag.TicketType = items;
        }

        #endregion

        #region controller actions

        #region Display Events

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
        public ActionResult SearchEvent(GetEventsWithFiltersRequest request)
        {
            GetEventsByCategoryRequest getEventRequest = GenarateGetEventsWithFiltersRequest(request);
            GetEventsByCategoryResponse response = service.GetEventsByCategory(getEventRequest);
            if (Request.IsAuthenticated)
            {
                string userName = HttpContext.User.Identity.Name;
                foreach (var item in response.Events)
                {
                    item.IsBookMarked = userService.CheckEventIsSavedOrNot(userName, (int)item.Id);
                }
            }
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

            EventDetailsResponse foundEvent = service.GetEventDetails((int)id);

            string userName = HttpContext.User.Identity.Name;

            bool isSavedEvent = userService.CheckEventIsSavedOrNot(userName, (int)id);

            ViewBag.SavedEvent = isSavedEvent;

            ViewBag.RelatedEvents = service.GetEventByTopic(foundEvent.EventTopic);

            return View("EventDetails", foundEvent);
        }

        /// <summary>
        /// Search event and return to search event view contain all matched events
        /// </summary>
        /// <param name="id">id of category</param>
        /// <returns></returns>
        public ActionResult SearchEvent(string City = "", string State = "", string Country = "", string SearchString = "",
            Portal.Infractructure.Utility.Define.DateFilterType DateFilterType = Portal.Infractructure.Utility.Define.DateFilterType.AllDates, 
            int? Topic = null,int? EventType = null)
        {

            GetEventsByCategoryRequest request = CreateInitialSearchRequest(City,State, Country, SearchString, DateFilterType,Topic,EventType);
            GetEventsByCategoryResponse response = service.GetEventsByCategory(request);
            if (Request.IsAuthenticated)
            {
                string userName = HttpContext.User.Identity.Name;
                foreach (var item in response.Events)
                {
                    item.IsBookMarked = userService.CheckEventIsSavedOrNot(userName, (int)item.Id);
                }
            }
            ViewBag.ListEventTopics = service.GetListEventTopics();
            ViewBag.ListEventTypes = service.GetListEventTypes();
            ViewBag.ListEventDateFilterRules = GetListEventFilterDate(DateFilterType);

            var filterModel = new Portal.Service.MessageModel.SearchFilterModel()
            {
                City = response.City,
                State = response.State,
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
            if (Request.IsAuthenticated)
            {
                string userName = HttpContext.User.Identity.Name;
                foreach (var item in response.Events)
                {
                    item.IsBookMarked = userService.CheckEventIsSavedOrNot(userName, (int)item.Id);
                }
            }
            return View("DisplayEvents", response);
        }

        /// <summary>
        /// Show list available events
        /// </summary>
        /// <returns></returns>
        public ActionResult DisplayEvents()
        {
            ViewBag.ListEventTopics = service.GetListEventTopics();
            ViewBag.ListEventTypes = service.GetListEventTypes();
            return View("DisplayEvents");
        }

        #endregion

        #region Order Tickets

        /// <summary>
        /// Navigate to order ticket page
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult OrderTicket(GetOrderTicketFormRequest orderTicketRequest)
        {
            if (!ModelState.IsValid)
            {
                if (orderTicketRequest.EventId == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                else
                {
                    EventDetailsResponse foundEvent = service.GetEventDetails(orderTicketRequest.EventId);
                    if (foundEvent == null)
                    {
                        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                    }
                    else
                    {
                        foreach (OrderTicketRequest ticket in orderTicketRequest.Tickets)
                        {
                            OrderEventTicketModel tk = foundEvent.Tickets.Where(t => t.Id == ticket.TicketId).FirstOrDefault();
                            if (tk != null)
                            {
                                tk.Quantity = ticket.TicketQuantity;
                            }
                        }
                        ViewBag.RelatedEvents = service.GetEventByTopic(foundEvent.EventTopic);
                        return View("EventDetails", foundEvent);
                    }
                }

            }

            // Check quantity of order tikcets is valid or not

            orderTicketRequest.Owner = HttpContext.User.Identity.Name;
            if (HttpContext.User.Identity.Name == null || HttpContext.User.Identity.Name == string.Empty)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Guid? guid = service.AddOrder(orderTicketRequest);

            if (guid ==null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            return RedirectToAction("OrderTicketPage", new { orderId = guid});
        }

        /// <summary>
        /// Redirect to Order ticket page with order details information and payment form
        /// </summary>
        /// <param name="orderId"></param>
        /// <returns></returns>
        public ActionResult OrderTicketPage(Guid orderId)
        {
            event_Order order = service.GetOrderByGuid(orderId);
            if (order == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            
            string message = String.Empty;
            bool result = service.CheckOrderSessionTimeOut(orderId, ref message);

            if (result)
            {
                EventDetailsResponse model = order.ConvertToOrderEventTicketModel();
                return View(model);
            }
            else
            {
                return RedirectToAction("EventDetails", new { Id = order.EventId });
            }
        }

        /// <summary>
        /// Confirm Order
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult ConfirmOrderTickets(ConfirmOrderTicketRequest request)
        {
            if (!ModelState.IsValid)
            {
                return RedirectToAction("OrderTicketPage", new { orderId = request.OrderId });
            }

            // Update submit time for request model
            request.SubmitTime = DateTime.Now;

            string message = String.Empty;
            bool result = service.ConfirmOrderTicket(request,ref message);

            return Json(new BaseResponseModel(){
            Success = result,
            Message = message
            },JsonRequestBehavior.AllowGet);
        }

        /// <summary>
        /// Return to Order tickets successful
        /// </summary>
        /// <returns></returns>
        public ActionResult OrderSuccessful()
        {
            return View();
        }

        /// <summary>
        /// Check status or order session and delete order if session time out
        /// </summary>
        /// <param name="orderId"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult CheckOrderSessionTimeOut(Guid orderId)
        {
            string message = String.Empty;
            bool result = service.CheckOrderSessionTimeOut(orderId, ref message);

            return Json(new BaseResponseModel()
            {
                Success = result,
                Message = message
            }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult OrderDetails(Guid orderId)
        {
            event_Order order = service.GetOrderByGuid(orderId);
            if (order == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            return View(order);
        }

        #endregion // End Order Tickets Region

        #region Events Management

        /// <summary>
        /// Return Create view to let user input information of new event
        /// </summary>
        /// <returns></returns>
        public ActionResult CreateEvent()
        {
            PopulateCountryDropDownList();
            PopulateEventTypeDropDownList(null);
            PopulateEventTopicDropDownList(null);
            PopulateTicketTypeDropDownList();
            PopulateStatusDropDownList();
            return View();
        }

        /// <summary>
        /// Create a project
        /// </summary>
        /// <param name="productRequest">information of new project</param>
        /// <returns></returns>
        [HttpPost, ValidateInput(false)]
        public ActionResult CreateEvent(CreateEventRequest requestModel, HttpPostedFileBase coverImage)
        {
            if (ModelState.IsValid)
            {
                var file = Request.Files["coverImage"];
                if (file != null && file.ContentLength > 0)
                {
                    if (file.ContentLength > 0)
                    {
                        ImageUpload imageUpload = new ImageUpload { Width = 600 };
                        ImageResult imageResult = imageUpload.RenameUploadFile(file);
                        if (imageResult.Success)
                        {
                            var photo = new share_Images
                            {
                                ImageName = imageResult.ImageName,
                                ImagePath = Path.Combine(ImageUpload.LoadPath, imageResult.ImageName)
                            };
                            var imageId = eventManagementService.AddImage(photo);
                            // Add product
                            requestModel.CoverImageId = imageId;
                            requestModel.OwnerId = HttpContext.User.Identity.Name;
                            eventManagementService.AddEvent(requestModel);
                            return RedirectToAction("Index","Home");
                        }
                        else
                        {
                            ViewBag.Error = imageResult.ErrorMessage;
                        }
                    }
                }

            }
            PopulateStatusDropDownList();
            return View(requestModel);
        }

        #endregion

        #endregion
    }
}