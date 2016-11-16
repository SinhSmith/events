using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Portal.Model.ViewModel
{
    public class ProfileViewModel
    {
        public System.Guid UserId { get; set; }
        [MaxLength(255)]
        public string UserName { get; set; }
        public string Emaill { get; set; }
        public string Password { get; set; }
        public Nullable<int> Status { get; set; }
        public int? Prefix { get; set; }
        [MaxLength(20)]
        public string HomePhone { get; set; }
        [MaxLength(20)]
        public string MobilePhone { get; set; }
        public string JobTitle { get; set; }
        [MaxLength(80)]
        public string Company { get; set; }
        [MaxLength(255)]
        public string Website { get; set; }
        [MaxLength(255)]
        public string Blog { get; set; }
        public string Home_Address { get; set; }
        public string Home_Address2 { get; set; }
        public int? Home_City { get; set; }
        public string Billing_Address { get; set; }
        public string Billing_Address2 { get; set; }
        public int? Billing_City { get; set; }
        public string Shipping_Address { get; set; }
        public string Shipping_Address2 { get; set; }
        public int? Shipping_City { get; set; }
        public string Work_Address { get; set; }
        public string Work_Address2 { get; set; }
        public int? Work_City { get; set; }
        public int? Gender { get; set; }
        public Nullable<System.DateTime> BirthDate { get; set; }
        public Nullable<int> Age { get; set; }
    }
}
