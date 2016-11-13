using Portal.Infractructure.Helper;
using Portal.Infractructure.Utility;
using Portal.Model.Context;
using Portal.Model.Repository;
using Portal.Model.ViewModel;
using Portal.Service.Interfaces;
using Portal.Service.MessageModel;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Portal.Service.Implements
{
    public class EventManagementService : IEventManagementService
    {
        #region properties

        private static PortalEntities context = new PortalEntities();
        private EventRepository db = new EventRepository(context);
        private Repository<share_Images> imageRepository = new Repository<share_Images>(context);
        private Repository<AspNetUser> userRepository = new Repository<AspNetUser>(context);

        #endregion

        #region Constructures

        public EventManagementService()
        {
            context = new PortalEntities();
            db = new EventRepository(context);
            imageRepository = new Repository<share_Images>(context);
        }

        #endregion

        #region Public functions

        /// <summary>
        /// Get all events with status not is Delete
        /// </summary>
        /// <returns></returns>
        public IEnumerable<Model.ViewModel.EventSummaryViewModel> GetListEvents()
        {
            IEnumerable<EventSummaryViewModel> listProjects = db.GetAllEventsWithoutDelete().Select(e => new EventSummaryViewModel()
            {
                Id = e.Id,
                Title = e.Title,
                Description = e.Description,
                OrganizationName = e.OrganizationName,
                Location_StreetName = e.Location_StreetName,
                Location_Address = e.Location_Address,
                Location_Address2 = e.Location_Address2,
                Location_City = e.Location_City,
                Location_State = e.Location_State,
                ZipCode = e.ZipCode,
                Country = e.Country,
                SortOrder = e.SortOrder,
                Status = EnumHelper.GetDescriptionFromEnum((Define.Status)e.Status),
                CoverImage = e.CoverImage
            }).ToList();

            return listProjects;
        }

        /// <summary>
        /// Get list events with status is not Delete and belong to current page
        /// </summary>
        /// <param name="pageNumber"></param>
        /// <param name="pageSize"></param>
        /// <param name="totalItems"></param>
        /// <returns></returns>
        public IEnumerable<Model.ViewModel.EventSummaryViewModel> GetEvents(int pageNumber, int pageSize, out int totalItems)
        {
            IEnumerable<event_Event> projects = db.GetAllEventsWithoutDelete();
            totalItems = projects.Count();
            IEnumerable<EventSummaryViewModel> returnProjectList = projects.OrderBy(b => b.Title).Skip(pageSize * (pageNumber - 1)).Take(pageSize).Select(e => new EventSummaryViewModel()
            {
                Id = e.Id,
                Title = e.Title,
                Description = e.Description,
                OrganizationName = e.OrganizationName,
                Location_StreetName = e.Location_StreetName,
                Location_Address = e.Location_Address,
                Location_Address2 = e.Location_Address2,
                Location_City = e.Location_City,
                Location_State = e.Location_State,
                ZipCode = e.ZipCode,
                Country = e.Country,
                SortOrder = e.SortOrder,
                Status = EnumHelper.GetDescriptionFromEnum((Define.Status)e.Status),
                CoverImage = e.CoverImage,
                IsVerified = e.IsVerified
            }).ToList();

            return returnProjectList;
        }


        /// <summary>
        /// Delete event (set Status is Delete)
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool DeleteEvent(int id)
        {
            try
            {
                event_Event eventObject = db.GetEventById(id);
                eventObject.Status = (int)Define.Status.Delete;
                db.Save();

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        /// <summary>
        /// Add new event to database
        /// </summary>
        /// <returns></returns>
        public bool AddEvent(CreateEventRequest newEvent)
        {
            CultureInfo provider = CultureInfo.InvariantCulture;
            string ownerId = userRepository.GetByID("109b6373-4e29-4fec-bb53-e2cbee2416e9").Id;
            try
            {
                event_Event eventObject = new event_Event()
                {
                    Title = newEvent.Title,
                    StartDate = DateTime.ParseExact(newEvent.StartDate, EventConstants.DefaultDateTimeFormat, provider),
                    EndDate = DateTime.ParseExact(newEvent.EndDate, EventConstants.DefaultDateTimeFormat, provider),
                    Description = newEvent.Description,
                    OrganizationName = newEvent.OrganizationName,
                    OrganizationDescription = newEvent.OrganizationDescription,
                    CoverImageId = newEvent.CoverImageId,
                    PaymentEmail = newEvent.PaymentEmail,
                    EventType = newEvent.EventType,
                    EventTopic = newEvent.EventTopic,
                    IsShowRemainingNumberTicket = newEvent.IsShowRemainingNumberTicket,
                    Location_StreetName = newEvent.Location_StreetName,
                    Location_Address = newEvent.Location_Address,
                    Location_Address2 = newEvent.Location_Address2,
                    Location_City = newEvent.Location_City,
                    Location_State = newEvent.Location_State,
                    ZipCode = newEvent.ZipCode,
                    Country = newEvent.Country,
                    Status = 1,
                    SortOrder = 1,
                    IsVerified = false,
                    OwnerId = ownerId,
                    Guid = Guid.NewGuid()
                };

                foreach (var item in newEvent.Tickets)
                {
                    var ticketNumber = Guid.NewGuid();
                    event_Ticket ticket = new event_Ticket()
                    {
                        EventId = eventObject.Id,
                        Name = item.Name,
                        Quantity = item.Quantity,
                        Description = item.Description,
                        IsShowDescription = item.IsShowDescription,
                        SaleChanel = item.SaleChanel,
                        IsHide = item.IsHide,
                        MinimunTicketOrder = item.MinimunTicketOrder,
                        MaximunTicketOrder = item.MaximunTicketOrder,
                        StartSaleDateTime = DateTime.ParseExact(item.StartSaleDateTime, EventConstants.DefaultDateTimeFormat, provider),
                        EndSaleDateTime = DateTime.ParseExact(item.EndSaleDateTime, EventConstants.DefaultDateTimeFormat, provider),
                        Type = item.Type,
                        Guid = ticketNumber,
                        AvailableTicketQuantity = item.Quantity,
                        Price = item.Price,
                        SaleEndOption = 0,
                        Status = 1,
                        SortOrder = 1,
                        TicketCode = ticketNumber.ToString()
                    };

                    eventObject.Tickets.Add(ticket);
                }
                db.Insert(eventObject);
                db.Save();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        /// <summary>
        /// Add new image to database
        /// </summary>
        /// <param name="image"></param>
        /// <returns></returns>
        public int? AddImage(Model.Context.share_Images image)
        {
            try
            {
                image.Status = (int)Define.Status.Active;
                imageRepository.Insert(image);
                imageRepository.Save();
                return image.Id;
            }
            catch (Exception)
            {
                return null;
            }
        }

        /// <summary>
        /// Update project
        /// </summary>
        /// <param name="project"></param>
        /// <returns></returns>
        public bool UpdateEvent(CreateEventPostRequest eventViewModel)
        {
            CultureInfo provider = CultureInfo.InvariantCulture;
            event_Event eventObject = db.GetEventById((int)eventViewModel.Id);
            if (eventObject == null)
            {
                return false;
            }
            else
            {
                eventObject.Title = eventViewModel.Title;
                eventObject.StartDate = DateTime.ParseExact(eventViewModel.StartDate, EventConstants.DefaultDateTimeFormat, provider);
                eventObject.EndDate = DateTime.ParseExact(eventViewModel.EndDate, EventConstants.DefaultDateTimeFormat, provider);
                eventObject.Description = eventViewModel.Description;
                eventObject.OrganizationName = eventViewModel.OrganizationName;
                eventObject.OrganizationDescription = eventViewModel.OrganizationDescription;
                //eventObject.CoverImageId = eventViewModel.CoverImageId;
                eventObject.PaymentEmail = eventViewModel.PaymentEmail;
                eventObject.EventType = eventViewModel.EventType;
                eventObject.EventTopic = eventViewModel.EventTopic;
                eventObject.IsShowRemainingNumberTicket = eventViewModel.IsShowRemainingNumberTicket;
                eventObject.Location_StreetName = eventViewModel.Location_StreetName;
                eventObject.Location_Address = eventViewModel.Location_Address;
                eventObject.Location_Address2 = eventViewModel.Location_Address2;
                eventObject.Location_City = eventViewModel.Location_City;
                eventObject.Location_State = eventViewModel.Location_State;
                eventObject.ZipCode = eventViewModel.ZipCode;
                eventObject.Country = eventViewModel.Country;
                eventObject.Status = eventViewModel.Status;
                eventObject.SortOrder = eventViewModel.SortOrder;
                eventObject.IsVerified = eventViewModel.IsVerified;

                db.Save();
                // Update tickets of event
                if (eventViewModel.Tickets == null)
                {
                    eventObject.Tickets = new List<event_Ticket>();
                }
                else
                {
                    var selectedTicked = new HashSet<int?>(eventViewModel.Tickets.Where(c => c.Id != null).Select(c => c.Id));

                    foreach (var ticket in eventViewModel.Tickets)
                    {
                        if (ticket.Id == null)
                        {
                            // Add new ticket if its Id is null
                            event_Ticket newTicket = new event_Ticket()
                            {
                                Name = ticket.Name,
                                Quantity = ticket.Quantity,
                                Description = ticket.Description,
                                IsShowDescription = ticket.IsShowDescription,
                                SaleChanel = ticket.SaleChanel,
                                IsHide = ticket.IsHide,
                                MinimunTicketOrder = ticket.MinimunTicketOrder,
                                MaximunTicketOrder = ticket.MaximunTicketOrder,
                                StartSaleDateTime = DateTime.ParseExact(ticket.StartSaleDateTime, EventConstants.DefaultDateTimeFormat, provider),
                                EndSaleDateTime = DateTime.ParseExact(ticket.EndSaleDateTime, EventConstants.DefaultDateTimeFormat, provider),
                                Type = ticket.Type,
                                Guid = new Guid(),
                                AvailableTicketQuantity = ticket.Quantity,
                                Price = ticket.Price,
                                SaleEndOption = 0,
                                Status = 1,
                                SortOrder = 1,
                                TicketCode = "abc",
                            };

                            eventObject.Tickets.Add(newTicket);
                        }
                        else
                        {
                            // Update data of ticket if it already exist in list tickets of event
                            var existTicket = eventObject.Tickets.Where(t => t.Id == ticket.Id).First();
                            if (existTicket != null)
                            {
                                existTicket.Name = ticket.Name;
                                existTicket.Quantity = ticket.Quantity;
                                existTicket.Description = ticket.Description;
                                existTicket.IsShowDescription = ticket.IsShowDescription;
                                existTicket.SaleChanel = ticket.SaleChanel;
                                existTicket.IsHide = ticket.IsHide;
                                existTicket.MinimunTicketOrder = ticket.MinimunTicketOrder;
                                existTicket.MaximunTicketOrder = ticket.MaximunTicketOrder;
                                existTicket.StartSaleDateTime = DateTime.ParseExact(ticket.StartSaleDateTime, EventConstants.DefaultDateTimeFormat, provider);
                                existTicket.EndSaleDateTime = DateTime.ParseExact(ticket.EndSaleDateTime, EventConstants.DefaultDateTimeFormat, provider);
                                existTicket.Type = ticket.Type;
                                existTicket.Price = ticket.Price;
                            }
                        }
                    }

                    // Remove ticket if it not exist in request tickets list
                    foreach (var ticket in eventObject.Tickets.ToList())
                    {
                        if (!selectedTicked.Contains(ticket.Id))
                        {
                            eventObject.Tickets.Remove(ticket);
                        }
                    }
                }

                try
                {
                    db.Save();
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }

        /// <summary>
        /// Get event object by id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Model.Context.event_Event GetEventById(int id)
        {
            return db.GetEventById(id);
        }
        
        /// <summary>
        /// Update ticket of event
        /// </summary>
        /// <param name="eventId"></param>
        /// <param name="ticket"></param>
        /// <returns></returns>
        public bool UpdateTicket(int eventId, event_Ticket ticket)
        {
            event_Event eventObject = db.GetEventById(eventId);
            if (eventObject == null)
            {
                // Event not found
                return false;
            }
            else
            {
                foreach (var item in eventObject.Tickets)
                {
                    if (item.Id == ticket.Id)
                    {
                        item.Name = ticket.Name;
                        item.Quantity = ticket.Quantity;
                        item.AvailableTicketQuantity = ticket.AvailableTicketQuantity;
                        item.Description = ticket.Description;
                        item.IsShowDescription = ticket.IsShowDescription;
                        item.SaleChanel = ticket.SaleChanel;
                        item.IsHide = ticket.IsHide;
                        item.MinimunTicketOrder = ticket.MinimunTicketOrder;
                        item.MaximunTicketOrder = ticket.MaximunTicketOrder;
                        item.TicketCode = ticket.TicketCode;
                        item.Status = ticket.Status;
                        item.SortOrder = ticket.SortOrder;
                        item.Price = ticket.Price;
                        item.StartSaleDateTime = ticket.StartSaleDateTime;
                        item.EndSaleDateTime = ticket.EndSaleDateTime;
                        item.Type = ticket.Type;
                    }
                }

                try
                {
                    db.Save();
                    return true;

                }
                catch (Exception ex)
                {
                    return false;
                }

            }
        }

        public bool UpdateCoverImage(int eventId,int imageId,out string oldCoverImagePath)
        {
            try
            {
                event_Event eventObject = db.GetByID(eventId);
                // Delete old image out of database
                int? oldImageId = eventObject.CoverImageId;
                string deleteImagePath = null;
                if (oldImageId != null)
                {
                    DeleteImage((int)oldImageId, out deleteImagePath);
                }
                // Update new cover image for event
                eventObject.CoverImageId = imageId;
                db.Save();

                oldCoverImagePath = deleteImagePath;
                return true;
            }
            catch (Exception ex)
            {
                oldCoverImagePath = null;
                return false;
            }
           
        }

        /// <summary>
        /// Delete image in project
        /// </summary>
        /// <param name="projectId">project id</param>
        /// <param name="imageId">id of image need to delete</param>
        /// <param name="listImages">list images of project after do action</param>
        /// <param name="imagePath">path of deteled image(using for delete image in folder)</param>
        /// <returns>return true if action is success or false if action is fail</returns>
        public bool DeleteImage(int imageId, out string deleteImagePath)
        {
            try
            {
                // Delete image in table share_images
                var deleteImage = imageRepository.GetByID(imageId);
                deleteImagePath = deleteImage.ImagePath;
                imageRepository.Delete(deleteImage);
                imageRepository.Save();
                return true;
            }
            catch (Exception)
            {
                deleteImagePath = null;
                return false;
            }
        }

        #endregion
    }
}