﻿using Portal.Model.Context;
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
                return user.Orders.ToList();
            }
            else
            {
                return null;
            }
        }

        public AspNetUser GetUserByName(string userName)
        {
            return dbSet.Where(u => u.UserName == userName).FirstOrDefault();
        }

        #endregion
    }
}