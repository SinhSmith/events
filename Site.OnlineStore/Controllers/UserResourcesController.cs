using Portal.Model.MessageModel;
using Portal.Service.Implements;
using Portal.Service.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
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

        public ActionResult DisplaySavedEventsAndTicket()
        {
            string currentUserName = HttpContext.User.Identity.Name;
            ViewBag.UserProfile = service.GetUserProfileByName(currentUserName);
            ViewBag.ListUpComingEvents = service.GetListOrders(currentUserName);
            ViewBag.ListSavedEvents = service.GetListBookMarkEvent(currentUserName);
            return View();
        }

        #endregion
    }
}