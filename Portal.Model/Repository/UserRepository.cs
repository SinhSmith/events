using Portal.Infractructure.Utility;
using Portal.Model.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Portal.Model.Repository
{
    public class UserRepository : Repository<AspNetUser>
    {
        #region Constructures

        public UserRepository(PortalEntities context): base(context)
        {
        }

        #endregion

        #region Public functions

        /// <summary>
        /// Get list bookmarked events of user
        /// </summary>
        /// <param name="userId">id of user</param>
        /// <returns>List bookmarked events</returns>
        public IList<event_Event> GetListBookMarkEvents(string userName)
        {
            AspNetUser user = this.Get(u => u.UserName == userName, null, "BookMarkEvents").SingleOrDefault();
            if (user != null)
            {
                return user.BookMarkEvents.ToList();
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// Get list event ticket orders of selected user
        /// </summary>
        /// <param name="userId">id of user</param>
        /// <returns>List Orders</returns>
        public IList<event_Order> GetEventTicketOrders(string userName)
        {
            AspNetUser user = this.Get(u => u.UserName == userName, null, "Orders").SingleOrDefault();
            if (user != null)
            {
                return user.Orders.Where(o => o.Status == (int)Define.Status.Active).ToList();
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// Get User information by user name
        /// </summary>
        /// <param name="userName">user name</param>
        /// <returns></returns>
        public AspNetUser GetUserByName(string userName)
        {
            return dbSet.Where(u => u.UserName == userName).FirstOrDefault();
        }

        /// <summary>
        /// Check a event is bookmarked of a specific user or not
        /// </summary>
        /// <param name="userName">user name</param>
        /// <param name="eventId">event id</param>
        /// <returns></returns>
        public bool CheckEventIsSavedOrNot(string userName, int eventId)
        {
            AspNetUser user = this.Get(u => u.UserName == userName, null, "BookMarkEvents").SingleOrDefault();
            if (user != null)
            {
                return user.BookMarkEvents.Any(e => e.Id == eventId);
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// Get list live event of a specific user
        /// </summary>
        /// <param name="userName">user name</param>
        /// <returns>list live events</returns>
        public IEnumerable<event_Event> GetListLiveEventsOfUser(string userName,string searchString = "")
        {
            AspNetUser user = this.Get(u => u.UserName == userName, null, "Tickets").SingleOrDefault();
            if (user != null)
            {
                if (searchString != null && searchString != string.Empty)
                {
                    return user.Events.Where(e => e.IsVerified && e.StartDate >= DateTime.Now && e.Title.Contains(searchString)).ToList();
                }
                else
                {
                    return user.Events.Where(e => e.IsVerified && e.StartDate >= DateTime.Now).ToList();
                }
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// Get list event not be verified by admin
        /// </summary>
        /// <param name="userName">user name</param>
        /// <returns></returns>
        public IEnumerable<event_Event> GetListDraftEventsOfUser(string userName, string searchString = "")
        {
            AspNetUser user = this.Get(u => u.UserName == userName, null, "Tickets").SingleOrDefault();
            if (user != null)
            {
                if (searchString != null && searchString != string.Empty)
                {
                    return user.Events.Where(e => e.IsVerified == false && e.Title.Contains(searchString)).ToList();
                }
                else
                {
                    return user.Events.Where(e => e.IsVerified == false).ToList();
                }
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// Get list events were passed
        /// </summary>
        /// <param name="userName">user name</param>
        /// <returns></returns>
        public IEnumerable<event_Event> GetListPassEventsOfUser(string userName, string searchString = "")
        {
            AspNetUser user = this.Get(u => u.UserName == userName, null, "Tickets").SingleOrDefault();
            if (user != null)
            {
                if (searchString != null && searchString != string.Empty)
                {
                    return user.Events.Where(e => e.IsVerified && e.StartDate < DateTime.Now && e.Title.Contains(searchString)).ToList();
                }
                else
                {
                    return user.Events.Where(e => e.IsVerified && e.StartDate < DateTime.Now).ToList();
                }
            }
            else
            {
                return null;
            }
        }

        #endregion
    }
}
