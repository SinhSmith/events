using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Portal.Model.ViewModel
{
    public class ShareCategoryViewModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public Nullable<int> Type { get; set; }
        public Nullable<int> SortOrder { get; set; }
        public Nullable<int> Status { get; set; }
    }
}
