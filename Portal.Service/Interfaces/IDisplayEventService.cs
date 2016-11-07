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
    public interface IDisplayEventService:IDisposable
    {
        GetEventsByCategoryResponse GetEventsByCategory(GetEventsByCategoryRequest request);
        EventDetailsResponse GetEventDetails(int id);
        IEnumerable<DisplayEventSummaryView> GetAllNearestEvent();
        GetEventsByCategoryResponse SearchByEventName(GetEventsByCategoryRequest request);
        event_Event GetEventById(int id);
        IEnumerable<EventTopicModel> GetListEventTopics();
        IEnumerable<EventTypeModel> GetListEventTypes();
        IEnumerable<DisplayEventSummaryView> GetEventByTopic(int topicId);
    }
}
