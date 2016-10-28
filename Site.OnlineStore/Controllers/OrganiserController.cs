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
using Site.OnlineStore.Controllers;
using Portal.Model.ViewModel;
using Site.OnlineStore.Models.ImageModels;

namespace OnlineStoreMVC.Controllers
{
    public class OrganiserController : BaseController
    {
        private PortalEntities db;
        private IOrganiserService _organiserService;
        private IImageService _imageService;

        public OrganiserController()
        {
            db = new PortalEntities();
            _organiserService = new OrganiserService();
            _imageService = new ImageService();
        }

        // GET: Organiser
        public ActionResult Index()
        {
            return View(db.system_Organisers.ToList());
        }

        // GET: Organiser/Details
        //[Authorize]
        public ActionResult Details()
        {
            var organiser = _organiserService.GetOrganiserByUserId(GetUserId());
            if (organiser == null)
            {
                return HttpNotFound();
            }

            return View(organiser);
        }

        // POST: Organiser/Details
        [Authorize]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Details(OrganiserViewModel model, HttpPostedFileBase avatar)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    if (avatar != null && avatar.ContentLength > 0)
                    {
                        ImageUpload imageUpload = new ImageUpload { IsScale = false, SavePath = ImageUpload.LoadPathOrganisers };
                        ImageResult imageResult = imageUpload.RenameUploadFile(avatar);

                        if (imageResult.Success)
                        {
                            // Add new image to database
                            var photo = new ImageViewModel
                            {
                                ImageName = imageResult.ImageName,
                                ImagePath = imageResult.ImagePath
                            };
                            var imageId = _imageService.AddImage(photo);
                            
                            // Add banner
                            model.AvatarId = imageId;
                        }
                        else
                        {
                            ViewBag.Error = imageResult.ErrorMessage;
                        }
                    }

                    _organiserService.EditOrganiser(model);

                    return RedirectToAction("Index", "Home");
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", ex.Message);
                }
            }

            return View(model);
        }

        // GET: Organiser/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Organiser/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,UserId,OrganiserName,About,Website,Facebook,Avatar,Status,CreatedBy,CreatedDate,ModifiedBy,ModifiedDate")] system_Organisers system_Organisers)
        {
            if (ModelState.IsValid)
            {
                db.system_Organisers.Add(system_Organisers);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(system_Organisers);
        }

        // GET: Organiser/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            system_Organisers system_Organisers = db.system_Organisers.Find(id);
            if (system_Organisers == null)
            {
                return HttpNotFound();
            }
            return View(system_Organisers);
        }

        // POST: Organiser/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,UserId,OrganiserName,About,Website,Facebook,Avatar,Status,CreatedBy,CreatedDate,ModifiedBy,ModifiedDate")] system_Organisers system_Organisers)
        {
            if (ModelState.IsValid)
            {
                db.Entry(system_Organisers).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(system_Organisers);
        }

        // GET: Organiser/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            system_Organisers system_Organisers = db.system_Organisers.Find(id);
            if (system_Organisers == null)
            {
                return HttpNotFound();
            }
            return View(system_Organisers);
        }

        // POST: Organiser/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            system_Organisers system_Organisers = db.system_Organisers.Find(id);
            db.system_Organisers.Remove(system_Organisers);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
