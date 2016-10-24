using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Portal.Model.Context;
using Portal.Service.Interfaces;
using Portal.Service.Implements;
using Site.OnlineStore.Models.ImageModels;
using Portal.Infractructure.Utility;
using System.IO;
using Portal.Model.ViewModel;
using PagedList;
using Site.OnlineStore.Areas.Admin.Controllers;
using Portal.Service.MessageModel;
using Portal.Model.Mapper;

namespace Site.OnlineStore.Areas.Admin.Controllers
{
    public class EventController : BaseManagementController
    {

        #region Properties

        protected IEventManagementService service = new EventManagementService();

        #endregion

        #region Constructures

        public EventController()
        {

        }

        #endregion

        #region Private functions

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
        private void PopulateEventTypeDropDownList(string type = null)
        {
            IEnumerable<SelectListItem> items = GetEventTypeList(type);

            ViewBag.EventType = items;
        }

        /// <summary>
        /// Get list options for event topic dropdownlist and assign to Variable in ViewBag of view
        /// </summary>
        /// <param name="status"></param>
        private void PopulateEventTopicDropDownList(string topic = null)
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

        #region Actions

        /// <summary>
        /// Return view with list events
        /// </summary>
        /// <param name="keyword"></param>
        /// <param name="page"></param>
        /// <returns></returns>
        public ActionResult Index(string keyword, int page = 1)
        {
            int totalItems = 0;
            var events = service.GetEvents(page, Portal.Infractructure.Utility.Define.PAGE_SIZE, out totalItems);

            IPagedList<EventSummaryViewModel> pageEvents = new StaticPagedList<EventSummaryViewModel>(events, page, Portal.Infractructure.Utility.Define.PAGE_SIZE, totalItems);
            return View(pageEvents);
        }

        /// <summary>
        /// Return Create view to let user input information of new event
        /// </summary>
        /// <returns></returns>
        public ActionResult Create()
        {
            PopulateStatusDropDownList();
            return View();
        }

        /// <summary>
        /// Create a project
        /// </summary>
        /// <param name="productRequest">information of new project</param>
        /// <returns></returns>
        [HttpPost, ValidateInput(false)]
        public ActionResult Create(CreateEventRequest requestModel, HttpPostedFileBase coverImage)
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
                            var imageId = service.AddImage(photo);
                            // Add product
                            requestModel.CoverImageId = imageId;
                            service.AddEvent(requestModel);
                            return RedirectToAction("Index");
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

        /// <summary>
        /// Get information of event and return Edit View for user update data for event
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            event_Event eventObject = service.GetEventById((int)id);

            if (eventObject == null)
            {
                return HttpNotFound();
            }

            // Populate status dropdownlist
            PopulateCountryDropDownList(eventObject.Country);
            PopulateEventTypeDropDownList(eventObject.EventType);
            PopulateEventTopicDropDownList(eventObject.EventTopic);
            PopulateStatusDropDownList((Define.Status)eventObject.Status);
            EventFullView retValue = eventObject.ConvertToEventFullView();
            string ticketType = null;
            foreach (var ticket in retValue.Tickets)
            {
                ticketType = ticket.Type.ToString();
                ticket.SaleChanelOptions = PopulateSaleChanelDropDownList();
            }
            PopulateTicketTypeDropDownList(ticketType);

            return View(retValue);
        }

        /// <summary>
        /// Update event
        /// </summary>
        /// <param name="product">information of event need to updated</param>
        /// <returns></returns>
        [HttpPost, ValidateInput(false)]
        public ActionResult Edit(CreateEventPostRequest eventRequest)
        {
            if (ModelState.IsValid)
            {
                bool isSuccess = service.UpdateEvent(eventRequest);
                if (isSuccess)
                {
                    return RedirectToAction("Index");
                }
            }
            return View(eventRequest);
        }

        /// <summary>
        /// Delete event 
        /// </summary>
        /// <param name="id">id of event</param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Delete(int id)
        {
            bool isSuccess = service.DeleteEvent(id);
            if (!isSuccess)
            {
                ModelState.AddModelError("ServerError", "Delete event fail!");
            }

            return RedirectToAction("Index");
        }

        /// <summary>
        /// Upload image to server
        /// </summary>
        /// <param name="files"></param>
        /// <param name="IdProject"></param>
        /// <returns></returns>
        [HttpPost, ValidateInput(false)]
        public ActionResult UpdateCoverImage(IEnumerable<HttpPostedFileBase> files, int eventId)
        {
            var file = Request.Files["coverImage"];
            if (file != null && file.ContentLength > 0)
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

                    var imageId = service.AddImage(photo);
                    string oldImagePath = null;

                    bool isSuccess = service.UpdateCoverImage(eventId, (int)imageId, out oldImagePath);
                    if (isSuccess)
                    {
                        DeleteImageInFolder(oldImagePath);
                        return Json(new { success = true, newImagePath = photo.ImagePath }, JsonRequestBehavior.AllowGet);
                    }
                    else
                    {
                        return Json(new { success = false, newImagePath = "" }, JsonRequestBehavior.AllowGet);
                    }

                }
            }

            return Json(new { success = false, newImagePath = "" }, JsonRequestBehavior.AllowGet);
        }

        #endregion

        #region Release resources

        /// <summary>
        /// Dispose database connection
        /// </summary>
        /// <param name="disposing"></param>
        protected override void Dispose(bool disposing)
        {
            base.Dispose(disposing);
        }

        #endregion

    }
}
