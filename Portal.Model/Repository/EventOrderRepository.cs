using Portal.Model.Context;
using Portal.Model.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Portal.Model.Repository
{
    public class EventOrderRepository : Repository<event_Order>
    {
         #region Constructures

        public EventOrderRepository(PortalEntities context)
            : base(context)
        {
        }

        #endregion

        #region Public functions

        /// <summary>
        /// Get all Order
        /// </summary>
        /// <returns></returns>
        public IEnumerable<event_Order> GetAllOrder()
        {
            return dbSet.Include("AspNetUser").Include("Event").Include("OrderTickets").ToList();
        }

        /// <summary>
        /// Find event by id with status not equal to Delete
        /// </summary>
        /// <returns></returns>
        public event_Order GetOrderById(int id)
        {
            return dbSet.Include("AspNetUser").Include("Event").Include("OrderTickets").Where(o => o.Id == id).FirstOrDefault();
        }

        /// <summary>
        /// Get Order by uid
        /// </summary>
        /// <param name="orderGuid"></param>
        /// <returns></returns>
        public event_Order getEventByGuid(Guid orderGuid)
        {
            return dbSet.Include("AspNetUser").Include("Event").Include("OrderTickets").Where(o => o.Guid == orderGuid).FirstOrDefault();
        }

        public List<event_TicketOrder> GetOrderedTicket(int eventId, int ticketId)
        {
            return dbSet.Where(o => o.EventId == eventId && o.Status == (int)Portal.Infractructure.Utility.Define.Status.Active).SelectMany(o => o.OrderTickets).Where(t => t.TicketId == ticketId).ToList();
        }

        #endregion
        
    }
}
