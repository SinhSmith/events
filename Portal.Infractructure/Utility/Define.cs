using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Portal.Infractructure.Utility
{
    public class Define
    {
        public const int DISPLAY_PROJECT_PAGE_SIZE = 9;
        public const int PAGE_SIZE = 10;
        public const int ID_PAGE_INTRODUCTION = 18;
        public enum SystemConfig
        {
            TotalVisitors
        }

        public enum Status
        {
            [Description("Ngưng hoạt động")]
            Deactive = 0,

            [Description("Đang hoạt động")]
            Active = 1,

            [Description("Xóa")]
            Delete = 2
        }

        public enum MenuEnum
        {
            [Description("Admin")]
            Admin = 1,

            [Description("User")]
            User = 2,
        }

        public enum BannerTypes
        {
            [Description("Banner 1 - Slide")]
            Banner1 = 1,

            [Description("Banner 2 - Mùa Xuân")]
            SpringSeason = 2,

            [Description("Banner 2 - Mùa Hạ")]
            SummerSeason = 3,

            [Description("Banner 2 - Mùa Thu")]
            AutumnSeason = 4,

            [Description("Banner 2 - Mùa Đông")]
            WinterSeason = 5,

            [Description("Popup")]
            Popup = 10
        }

        public enum Region
        {
            [Description("Miền bắc")]
            North = 0,
            [Description("Miền trung")]
            Central = 1,
            [Description("Miền nam")]
            South = 2,
            [Description("Nước ngoài")]
            Foreign = 3
        }

        public enum ProgressStatus
        {
            [Description("Đang thi công")]
            InProgress = 0,
            [Description("Hoàn thành")]
            Completed = 1
        }

        public enum ProjectType
        {
            [Description("Thiết kế và thi công")]
            DesignAndConstruction = 0,
            [Description("Dân dụng")]
            CivilEngineering = 1,
            [Description("Công nghiệp")]
            Industry = 2,
            [Description("Hạ tầng")]
            Infrastructure = 3
        }

        public enum CategoryType
        {
            All,
            Region,
            ProjectType,
            ProgressStatus
        }

        public enum SearchItemType
        {
            News,
            Project
        }

        public enum TicketType
        {
            Free,
            Paid,
            Donation
        }
        public enum TicketPriceType
        {
            AllPrices = 2,
            Paid = 1,
            Free = 0
        }

        public enum DateFilterType
        {
            [Description("All Dates")]
            AllDates = 0,
            [Description("Today")]
            Today = 1,
            [Description("Tomorrow")]
            Tomorrow = 2,
            [Description("This Week")]
            ThisWeek = 3,
            [Description("This Weekend")]
            ThisWeekend = 4,
            [Description("Next Week")]
            NextWeek = 5,
            [Description("Next Month")]
            NextMonth = 6,
            [Description("Custom Date")]
            CustomDate = 7
        }

        public enum EventSortBy
        {
            [Description("Sort by Event Title")]
            Name = 1,
            [Description("Sort by Date")]
            Date = 2
        }

        public enum Prefix
        {
            [Description("Mr.")]
            Mr = 1,
            [Description("Mrs.")]
            Mrs = 2,
            [Description("Ms.")]
            Ms = 3,
            [Description("Miss")]
            Miss = 4,
            [Description("Mx.")]
            Mx = 5,
            [Description("Dr.")]
            Dr = 6,
            [Description("Prof.")]
            Prof = 7,
            [Description("Rev.")]
            Rev = 8
        }

        public enum ShareCategoryType
        {
            City = 1,
            District = 2
        }

        public enum Gender
        {
            Male = 1,
            Female = 2,
            Other = 3
        }
    }
}
