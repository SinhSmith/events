using Portal.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Portal.Service.MessageModel
{
    public class GetEventsByCategoryRequest
    {
        public GetEventsByCategoryRequest()
        {
            Topics = new List<int>();
            EventTypes = new List<int>();
        }

        public List<int> Topics { get; set; }
        public List<int> EventTypes { get; set; }
        public Portal.Infractructure.Utility.Define.EventSortBy SortBy { get; set; }
        public Portal.Infractructure.Utility.Define.TicketPriceType Price { get; set; }
        public Nullable<DateTime> StartDate { get; set; }
        public Nullable<DateTime> EndDate { get; set; }
        public int Index { get; set; }
        public string SearchString { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
        public int NumberOfResultsPerPage { get; set; }
        public Portal.Infractructure.Utility.Define.DateFilterType DateFilterType { get; set; }
    }

    public class GetEventsByCategoryResponse
    {
        public GetEventsByCategoryResponse()
        {
            Events = new List<DisplayEventSummaryView>();
            ListTopics = new List<EventTopicModel>();
            ListEventTypes = new List<EventTypeModel>();
            Topics = new List<int>();
            EventTypes = new List<int>();
        }
        public List<int> Topics { get; set; }
        public List<int> EventTypes { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public int NumberOfTitlesFound { get; set; }
        public int TotalNumberOfPages { get; set; }
        public int CurrentPage { get; set; }
        public string SearchString { get; set; }
        public int TotalEvents { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
        public Portal.Infractructure.Utility.Define.EventSortBy SortBy { get; set; }
        public Portal.Infractructure.Utility.Define.TicketPriceType Price { get; set; }
        public IEnumerable<DisplayEventSummaryView> Events { get; set; }
        public IEnumerable<EventTopicModel> ListTopics { get; set; }
        public IEnumerable<EventTypeModel> ListEventTypes { get; set; }
    }

    public class SearchEventRequest
    {
        public SearchEventRequest()
        {
        }
        public int Index { get; set; }
        public string SearchString { get; set; }
        public int NumberOfResultsPerPage { get; set; }
        public Portal.Infractructure.Utility.Define.EventSortBy SortBy { get; set; }
    }

    public class SearchEventResponse
    {
        public int NumberOfTitlesFound { get; set; }
        public int TotalNumberOfPages { get; set; }
        public int CurrentPage { get; set; }
        public string SearchString { get; set; }
        public Portal.Infractructure.Utility.Define.EventSortBy SortBy { get; set; }
        public IEnumerable<EventSummaryViewModel> Events { get; set; }
    }

    public class GetEventsByAjaxResponse
    {
        public bool Success { get; set; }
        public object ListEventView { get; set; }
        public GetEventsByCategoryResponse Model { get; set; }
    }

    public class GetEventsWithFiltersRequest
    {
        public GetEventsWithFiltersRequest()
        {
            Topics = new List<int>();
            EventTypes = new List<int>();
        }
        public List<int> Topics { get; set; }
        public List<int> EventTypes { get; set; }
        public Portal.Infractructure.Utility.Define.EventSortBy SortBy { get; set; }
        public Portal.Infractructure.Utility.Define.TicketPriceType Price { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public int Index { get; set; }
        public string SearchString { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
        public int NumberOfResultsPerPage { get; set; }
        public Portal.Infractructure.Utility.Define.DateFilterType DateFilterType { get; set; }
    }

    public class EventTopicModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

    public class EventTypeModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

    public class EventFilterDate
    {
        public string Name { get; set; }
        public int Id { get; set; }
        public bool IsSelected { get; set; }
    }
}
