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
            IList<event_TicketOrder> orderList = dbSet.Where(o => o.EventId == eventId && o.Status != (int)Portal.Infractructure.Utility.Define.Status.Delete).SelectMany(o => o.OrderTickets).Where(t => t.TicketId == ticketId).ToList();
            return orderList.Where(o => o.event_Order.Status == (int)Portal.Infractructure.Utility.Define.Status.Active || (o.event_Order.Status == (int)Portal.Infractructure.Utility.Define.Status.Deactive  && (DateTime.Now - (DateTime)o.event_Order.OrderTime).TotalSeconds < 480)).ToList();
        }

        public int GetNumberOrderedTicket(int eventId, int ticketId)
        {
            return GetOrderedTicket(eventId, ticketId).Count();
        }

        public int GetNumberOrderedTicketOfEvent(int eventId){
            return dbSet.Where(o => o.EventId == eventId && o.Status == (int)Portal.Infractructure.Utility.Define.Status.Active).SelectMany(o => o.OrderTickets).Count();
        }

        public int GetNumberPendingOrderTicketOfEvent(int eventId)
        {
            IList<event_TicketOrder> orderList = dbSet.Where(o => o.EventId == eventId && o.Status == (int)Portal.Infractructure.Utility.Define.Status.Deactive).SelectMany(o => o.OrderTickets).ToList();
            return orderList.Where(o => (DateTime.Now - (DateTime)o.event_Order.OrderTime).TotalSeconds < 480).Count();
        }

        #endregion
        
    }
}
