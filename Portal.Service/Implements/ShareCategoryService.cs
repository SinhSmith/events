using Portal.Infractructure.Utility;
using Portal.Model.Context;
using Portal.Model.ViewModel;
using Portal.Service.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Portal.Service.Implements
{
    public class ShareCategoryService : IShareCategoryService
    {
        public IList<ShareCategoryViewModel> GetShareCategoriesByType(Define.ShareCategoryType type)
        {
            using (var db = new PortalEntities())
            {
                return db.share_Categories.Where(x => x.Type == (int)type && x.Status != (int)Portal.Infractructure.Utility.Define.Status.Delete)
                    .OrderBy(x => x.SortOrder).ThenBy(x => x.Id)
                    .Select(x => new ShareCategoryViewModel
                    {
                        Id = x.Id,
                        Name = x.Name,
                        Type = x.Type,
                        Status = x.Status
                    }).ToList();
            }
        }
    }
}
