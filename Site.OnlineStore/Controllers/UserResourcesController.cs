using Portal.Model.Context;
using Portal.Model.MessageModel;
using Portal.Model.ViewModel;
using Portal.Service.Implements;
using Portal.Service.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace OnlineStoreMVC.Controllers
{
    public class UserResourcesController : Controller
    {
        #region Properties

        public IUserResourcesService service = new UserResourcesService();

        #endregion

        #region Constructures

        public UserResourcesController()
        {
            service = new UserResourcesService();
        }

        #endregion

        #region Public functions

        /// <summary>
        /// Bookmark selected event
        /// </summary>
        /// <param name="eventId">event id</param>
        /// <returns></returns>
        [Authorize]
        [HttpPost]
        public ActionResult AddEventBookMark(int eventId)
        {
            string message = String.Empty;
            string userName = HttpContext.User.Identity.Name;
            bool success = service.AddEventBookMark(eventId, userName, ref message);
            return Json(new BaseResponseModel()
            {
                Success = success,
                Message = message
            }, JsonRequestBehavior.AllowGet);
        }

        /// <summary>
        /// Remove bookmark of selected event
        /// </summary>
        /// <param name="eventId">event id</param>
        /// <returns></returns>
        [Authorize]
        [HttpPost]
        public ActionResult RemoveEventBookMark(int eventId)
        {
            string message = String.Empty;
            string userName = HttpContext.User.Identity.Name;
            bool success = service.RemoveEventBookMark(eventId, userName, ref message);
            return Json(new BaseResponseModel()
            {
                Success = success,
                Message = message
            }, JsonRequestBehavior.AllowGet);
        }

        /// <summary>
        /// Show List Saved Events and Order of current user 
        /// </summary>
        /// <param name="isOrder">active saved events tab or order tab</param>
        /// <returns></returns>
        [Authorize]
        public ActionResult DisplaySavedEventsAndTicket(bool isOrder = true)
        {
            string currentUserName = HttpContext.User.Identity.Name;
            ViewBag.UserInfor = service.GetUserProfileByName(currentUserName);
            ViewBag.ListUpComingEvents = service.GetListOrders(currentUserName);
            ViewBag.ListSavedEvents = service.GetListBookMarkEvent(currentUserName);
            ViewBag.IsOrderView = isOrder;
            return View();
        }

        public ActionResult EventManagement(string errorMessage = "")
        {
            string userName = HttpContext.User.Identity.Name;
            ViewBag.ListLiveEvents = service.GetListLiveEvents(userName);
            ViewBag.ListDraftEvents = service.GetListDraftEvents(userName);
            ViewBag.ListPassEvents = service.GetListPassEvents(userName);
            ViewBag.ErrorMessage = errorMessage;
            return View();
        }

        [Authorize]
        [HttpPost]
        public ActionResult SearchEventOfUser(string searchString,string type = "live")
        {
            string userName = HttpContext.User.Identity.Name;
            IEnumerable<EventManagementItem> events = service.FilterEvents(userName, searchString, type);
            @ViewBag.Type = type;

            return PartialView("ListEvents", events);
        }

        [Authorize]
        public ActionResult EventDashBoard(int eventId)
        {
            string userName = HttpContext.User.Identity.Name;
            if (service.CheckEventOwner(eventId, userName))
            {
                EventManagementModel eventDetails = service.GetEventInformation(eventId);
                return View(eventDetails);
            }
            else
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

        }

        [Authorize]
        public ActionResult OrderDetails(int orderId)
        {
            string userName = HttpContext.User.Identity.Name;
            if(service.CheckOrderAccessAuthentication(userName,orderId))
            {
                OrderInformationModel order = service.OrderDetails(orderId);
                return View(order);
            }else{
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
        }

        #endregion
    }
}