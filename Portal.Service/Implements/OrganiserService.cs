using Portal.Infractructure.Utility;
using Portal.Model.Context;
using Portal.Model.ViewModel;
using Portal.Service.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Portal.Service.Implements
{
    public class OrganiserService : IOrganiserService
    {
        public OrganiserViewModel GetOrganiserByUserId(Guid? userId)
        {
            if (userId == null)
                return null;

            using (var db = new PortalEntities())
            {
                var organiser = db.system_Organisers.FirstOrDefault(x => x.UserId == userId.Value);

                return new OrganiserViewModel
                {
                    Id = organiser.Id,
                    UserId = organiser.UserId,
                    OrganiserName = organiser.OrganiserName,
                    About = organiser.About,
                    Website = organiser.Website,
                    Facebook = organiser.Facebook,
                    Twitter = organiser.Twitter,
                    AvatarId = organiser.AvatarId,
                    AvatarPath = organiser.share_Images != null ? organiser.share_Images.ImagePath : string.Empty,
                    Status = organiser.Status
                };
            }
        }

        public bool AddOrganiser(OrganiserViewModel viewModel)
        {
            try
            {
                using (var db = new PortalEntities())
                {
                    var organiser = new system_Organisers
                    {
                        UserId = viewModel.UserId,
                        AvatarId = viewModel.AvatarId,
                        OrganiserName = viewModel.OrganiserName,
                        About = viewModel.About,
                        Website = viewModel.Website,
                        Facebook = viewModel.Facebook,
                        Twitter = viewModel.Twitter,
                        Status = (int)Define.Status.Active,
                        CreatedDate = DateTime.Now,
                        CreatedBy = viewModel.UserId
                    };
                    db.system_Organisers.Add(organiser);
                    db.SaveChanges();

                    return true;
                }
            }
            catch (DbEntityValidationException ex)
            {
                // Retrieve the error messages as a list of strings.
                var errorMessages = ex.EntityValidationErrors
                        .SelectMany(x => x.ValidationErrors)
                        .Select(x => x.ErrorMessage);

                // Join the list to a single string.
                var fullErrorMessage = string.Join("; ", errorMessages);

                // Combine the original exception message with the new one.
                var exceptionMessage = string.Concat(ex.Message, " The validation errors are: ", fullErrorMessage);

                // Throw a new DbEntityValidationException with the improved exception message.
                throw new DbEntityValidationException(exceptionMessage, ex.EntityValidationErrors);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool EditOrganiser(OrganiserViewModel viewModel)
        {
            try
            {
                using (var db = new PortalEntities())
                {
                    var organiser = db.system_Organisers.Find(viewModel.Id);
                    if (viewModel.AvatarId != null)
                    {
                        organiser.AvatarId = viewModel.AvatarId;
                    }
                    organiser.OrganiserName = viewModel.OrganiserName;
                    organiser.About = viewModel.About;
                    organiser.Website = viewModel.Website;
                    organiser.Facebook = viewModel.Facebook;
                    organiser.Twitter = viewModel.Twitter;
                    organiser.Status = (int)Define.Status.Active;
                    organiser.ModifiedDate = DateTime.Now;
                    organiser.ModifiedBy = viewModel.UserId;
                    db.SaveChanges();

                    return true;
                }
            }
            catch (DbEntityValidationException ex)
            {
                // Retrieve the error messages as a list of strings.
                var errorMessages = ex.EntityValidationErrors
                        .SelectMany(x => x.ValidationErrors)
                        .Select(x => x.ErrorMessage);

                // Join the list to a single string.
                var fullErrorMessage = string.Join("; ", errorMessages);

                // Combine the original exception message with the new one.
                var exceptionMessage = string.Concat(ex.Message, " The validation errors are: ", fullErrorMessage);

                // Throw a new DbEntityValidationException with the improved exception message.
                throw new DbEntityValidationException(exceptionMessage, ex.EntityValidationErrors);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
