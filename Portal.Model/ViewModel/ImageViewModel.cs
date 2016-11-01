using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Portal.Model.ViewModel
{
    public class ImageViewModel
    {
        public int Id { get; set; }
        public string ImageName { get; set; }
        public string ImagePath { get; set; }
        public Nullable<int> Status { get; set; }
    }
}
