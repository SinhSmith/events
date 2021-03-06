﻿using OnlineStoreMVC.Models.Message;
using PagedList;
using Portal.Model.ViewModel;
using Portal.Service.Implements;
using Portal.Service.Interfaces;
using Portal.Service.MessageModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Site.OnlineStore.Controllers
{
    public class HomeController : BaseController
    {
        #region Properties

        IBannerService _bannerService = new BannerService();
        ICMSNewsService _cmsNewsService = new CMSNewsService();
        IDisplayProjectService _projectService = new DisplayProjectService();
        IDisplayEventService _eventService = new DisplayEventService();
        public IUserResourcesService _userService = new UserResourcesService();

        #endregion

        #region Constructures

        public HomeController()
        {
            _bannerService = new BannerService();
            _cmsNewsService = new CMSNewsService();
            _projectService = new DisplayProjectService();
            _eventService = new DisplayEventService();
            _userService = new UserResourcesService();
        }

        #endregion

        #region Private functions

        /// <summary>
        /// Genarate initial request object to get list events in selected location
        /// </summary>
        /// <param name="country">country name of selected location</param>
        /// <param name="city">city name of selected location</param>
        /// <returns></returns>
        private GetEventsByCategoryRequest CreateGetEventInLocationRequest(string country,string state,string city)
        {
            GetEventsByCategoryRequest request = new GetEventsByCategoryRequest()
            {
                Index = 1,
                NumberOfResultsPerPage = 12,
                SortBy = Portal.Infractructure.Utility.Define.EventSortBy.Date,
                SearchString = null,
                StartDate = DateTime.Now,
                Country = country,
                State = state,
                City = city,
                Price = Portal.Infractructure.Utility.Define.TicketPriceType.AllPrices
            };

            return request;
        }
        #endregion

        #region Actions

        public ActionResult Index()
        {
            
            ViewBag.FeaturedProjects = _projectService.GetFeaturedProjects(6).ToList();
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult BannerPartial()
        {
            return PartialView(_bannerService.GetBanners1ForHomePage());
        }

        public ActionResult BlogPartial()
        {
            return PartialView(_cmsNewsService.GetCMSNewsForHomePage());
        }

        public ActionResult Search(string keyword = "",int? page = 1)
        {
            ViewBag.SearchString = keyword;
            ViewBag.FeaturedProjects = _projectService.GetFeaturedProjects(6).ToList();
            SearchResultResponse result = SeachData(keyword, page);
            IPagedList<SearchResultViewModel> pageProjects = new StaticPagedList<SearchResultViewModel>(result.Items, (int)page, Portal.Infractructure.Utility.Define.DISPLAY_PROJECT_PAGE_SIZE, result.TotalItems);
            return View("Search", pageProjects);
        }

        [HttpPost]
        public ActionResult GetEventsInCurrentLocation(string country,string state,string city)
        {
            GetEventsByCategoryRequest request = CreateGetEventInLocationRequest(country,state,city);
            GetEventsByCategoryResponse result = _eventService.GetEventsByCategory(request);

            if (Request.IsAuthenticated)
            {
                string userName = HttpContext.User.Identity.Name;
                foreach (var item in result.Events)
                {
                    item.IsBookMarked = _userService.CheckEventIsSavedOrNot(userName, (int)item.Id);
                }
            }

            return PartialView("_ListEventItemSmall", result.Events);
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