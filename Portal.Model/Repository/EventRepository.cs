using Portal.Infractructure.Utility;
using Portal.Model.Context;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Portal.Model.Repository
{
    public class EventRepository : Repository<event_Event>
    {
        #region Constructures

        public EventRepository(PortalEntities context)
            : base(context)
        {
        }

        #endregion

        #region Public functions

        /// <summary>
        /// Get all events except which one have status is Delete(Just Active and Deactive)
        /// </summary>
        /// <returns></returns>
        public IEnumerable<event_Event> GetAllEventsWithoutDelete()
        {
            return dbSet.Include("CoverImage").Where(c => c.Status != (int)Define.Status.Delete).ToList();
        }

        /// <summary>
        /// Find event by id with status not equal to Delete
        /// </summary>
        /// <returns></returns>
        public event_Event GetEventById(int id)
        {
            return dbSet.Include("CoverImage").Include("AspNetUser").Include("Tickets").Where(c => c.Id == id && c.Status != (int)Define.Status.Delete).FirstOrDefault();
        }

        #endregion
    }
}
