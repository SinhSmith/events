using Portal.Model.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Portal.Model.Repository
{
    public class TicketRepository : Repository<event_Ticket>
    {
        #region Constructures

        public TicketRepository(PortalEntities context)
            : base(context)
        {
        }

        #endregion

        #region Public functions

        /// <summary>
        /// Get all Order
        /// </summary>
        /// <returns></returns>
        public IEnumerable<event_Ticket> GetAllTicket()
        {
            return dbSet.Where(t => t.Status == (int)Portal.Infractructure.Utility.Define.Status.Active).ToList();
        }

        /// <summary>
        /// Find event by id with status not equal to Delete
        /// </summary>
        /// <returns></returns>
        public event_Ticket GetTicketById(int id)
        {
            return dbSet.Include("Event").Where(o => o.Id == id).FirstOrDefault();
        }

        #endregion
        
    }
}
