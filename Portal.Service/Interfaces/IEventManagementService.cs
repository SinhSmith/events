using Portal.Model.Context;
using Portal.Model.ViewModel;
using Portal.Service.MessageModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Portal.Service.Interfaces
{
    public interface IEventManagementService
    {
        /// <summary>
        /// Get events
        /// </summary>
        /// <returns></returns>
        IEnumerable<EventSummaryViewModel> GetListEvents();

        /// <summary>
        /// Get events with paging
        /// </summary>
        /// <param name="pageNumber"></param>
        /// <param name="pageSize"></param>
        /// <param name="totalItems"></param>
        /// <returns></returns>
        IEnumerable<EventSummaryViewModel> GetEvents(int pageNumber, int pageSize, out int totalItems);

        /// <summary>
        /// Delete event by id - change status of event to 'Delete'
        /// </summary>
        /// <param name="id">id of event</param>
        /// <returns>return true if delete action success and false if delete fail</returns>
        bool DeleteEvent(int id);

        /// <summary>
        /// Add new event to database
        /// </summary>
        /// <param name="newProduct"></param>
        /// <returns></returns>
        bool AddEvent(CreateEventRequest newEvent);

        /// <summary>
        /// Add new image to database
        /// </summary>
        /// <param name="image"></param>
        /// <returns></returns>
        int? AddImage(Model.Context.share_Images image);

        /// <summary>
        /// Get event by id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        Model.Context.event_Event GetEventById(int id);

        /// <summary>
        /// Update project
        /// </summary>
        /// <param name="project"></param>
        /// <returns></returns>
        bool UpdateEvent(CreateEventPostRequest eventViewModel);

        /// <summary>
        /// Update ticket of event
        /// </summary>
        /// <param name="eventId"></param>
        /// <param name="ticket"></param>
        /// <returns></returns>
        bool UpdateTicket(int eventId, event_Ticket ticket);

        /// <summary>
        /// Delete corver image of event
        /// </summary>
        /// <param name="eventId"></param>
        /// <param name="imageId"></param>
        /// <param name="deleteImagePath"></param>
        /// <returns></returns>
        bool DeleteImage(int imageId, out string deleteImagePath);

        /// <summary>
        /// Update cover image for event
        /// </summary>
        /// <param name="eventId"></param>
        /// <param name="imageId"></param>
        /// <param name="oldCoverImagePath"></param>
        /// <returns></returns>
        bool UpdateCoverImage(int eventId, int imageId, out string oldCoverImagePath);

        /// <summary>
        /// Check selected event is orderd or not
        /// </summary>
        /// <param name="eventId"></param>
        /// <returns></returns>
        bool CheckEventWasOrder(int eventId);

        /// <summary>
        /// Public event
        /// </summary>
        /// <param name="eventId"></param>
        /// <returns></returns>
        bool PublicEvent(int eventId);
        /// <summary>
        /// UnPublic event
        /// </summary>
        /// <param name="eventId"></param>
        /// <returns></returns>
        bool UnPublicEvent(int eventId);
    }
}
