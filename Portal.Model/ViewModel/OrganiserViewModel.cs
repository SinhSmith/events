using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Portal.Model.ViewModel
{
    public class OrganiserViewModel
    {
        public int Id { get; set; }
        public Nullable<System.Guid> UserId { get; set; }
        public Nullable<System.Int32> AvatarId { get; set; }
        public string AvatarPath { get; set; }
        public string OrganiserName { get; set; }
        public string About { get; set; }
        public string Website { get; set; }
        public string Facebook { get; set; }
        public string Twitter { get; set; }
        public Nullable<int> Status { get; set; }
    }
}
