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
    public class ImageService : IImageService
    {
        public int AddImage(ImageViewModel viewModel)
        {
            try
            {
                using (var db = new PortalEntities())
                {
                    var image = new share_Images
                    {
                        ImageName = viewModel.ImageName,
                        ImagePath = viewModel.ImagePath,
                        Status = (int)Infractructure.Utility.Define.Status.Active,
                        CreatedDate = DateTime.Now
                    };
                    db.share_Images.Add(image);
                    db.SaveChanges();

                    return image.Id;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
