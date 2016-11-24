using Portal.Model.Context;
using Portal.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Portal.Service.Interfaces
{
    public interface IUserResourcesService
    {
        bool AddEventBookMark(int eventId,string userName, ref string message);
        bool RemoveEventBookMark(int eventId, string userName, ref string message);
        bool CheckEventIsSavedOrNot(string userName, int eventId);
        AspNetUser GetUserProfileByName(string userName);
        IEnumerable<DisplayEventSummaryView> GetListBookMarkEvent(string userName);
        IEnumerable<event_Order> GetListOrders(string userName);
    }
}
