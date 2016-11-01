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
    public class ProfileService : IProfileService
    {
        public IList<ProfileViewModel> GetProfiles(int pageNumber, int pageSize, out int totalItems)
        {
            using (var db = new PortalEntities())
            {
                totalItems = db.system_Profiles.Count(x => x.Status != (int)Portal.Infractructure.Utility.Define.Status.Delete);

                return db.system_Profiles.Where(x => x.Status != (int)Portal.Infractructure.Utility.Define.Status.Delete)
                    .OrderBy(x => x.UserName)
                    .Skip(pageSize * (pageNumber - 1)).Take(pageSize)
                    .Select(x => new ProfileViewModel
                    {
                        UserId = x.UserId,
                        UserName = x.UserName,
                        Emaill = x.Emaill,
                        Password = x.Password,
                        Status = x.Status
                    }).ToList();
            }
        }

        public bool AddProfile(ProfileViewModel profileViewModel)
        {
            try
            {
                using (var db = new PortalEntities())
                {
                    var profile = new system_Profiles
                    {
                        UserId = profileViewModel.UserId,
                        UserName = profileViewModel.UserName,
                        Emaill = profileViewModel.Emaill,
                        Password = profileViewModel.Password,
                    };
                    db.system_Profiles.Add(profile);
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

        public bool EditProfile(ProfileViewModel viewModel)
        {
            try
            {
                using (var db = new PortalEntities())
                {
                    var profile = db.system_Profiles.Find(viewModel.UserId);
                    profile.Prefix = viewModel.Prefix;
                    profile.HomePhone = viewModel.HomePhone;
                    profile.MobilePhone = viewModel.MobilePhone;
                    profile.JobTitle = viewModel.JobTitle;
                    profile.Company = viewModel.Company;
                    profile.Website = viewModel.Website;
                    profile.Blog = viewModel.Blog;
                    profile.Home_Address = viewModel.Home_Address;
                    profile.Home_Address2 = viewModel.Home_Address2;
                    profile.Home_City = viewModel.Home_City;
                    profile.Billing_Address = viewModel.Billing_Address;
                    profile.Billing_Address2 = viewModel.Billing_Address2;
                    profile.Billing_City = viewModel.Billing_City;
                    profile.Shipping_Address = viewModel.Shipping_Address;
                    profile.Shipping_Address2 = viewModel.Shipping_Address2;
                    profile.Shipping_City = viewModel.Shipping_City;
                    profile.Work_Address = viewModel.Work_Address;
                    profile.Work_Address2 = viewModel.Work_Address2;
                    profile.Work_City = viewModel.Work_City;
                    profile.Gender = viewModel.Gender;
                    profile.BirthDate = viewModel.BirthDate;
                    profile.Age = viewModel.Age;
                    profile.Status = viewModel.Status;
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

        public ProfileViewModel GetProfileByUserId(Guid? userId)
        {
            if (userId == null)
                return null;

            using (var db = new PortalEntities())
            {
                var profile = db.system_Profiles.Find(userId.Value);
                return new ProfileViewModel
                {
                    UserId= profile.UserId,
                    UserName = profile.UserName,
                    Emaill = profile.Emaill,
                    Prefix = profile.Prefix,
                    HomePhone = profile.HomePhone,
                    MobilePhone = profile.MobilePhone,
                    JobTitle = profile.JobTitle,
                    Company = profile.Company,
                    Website = profile.Website,
                    Blog = profile.Blog,
                    Home_Address = profile.Home_Address,
                    Home_Address2 = profile.Home_Address2,
                    Home_City = profile.Home_City,
                    Billing_Address = profile.Billing_Address,
                    Billing_Address2 = profile.Billing_Address2,
                    Billing_City = profile.Billing_City,
                    Shipping_Address = profile.Shipping_Address,
                    Shipping_Address2 = profile.Shipping_Address2,
                    Shipping_City = profile.Shipping_City,
                    Work_Address = profile.Work_Address,
                    Work_Address2 = profile.Work_Address2,
                    Work_City = profile.Work_City,
                    Gender = profile.Gender,
                    BirthDate = profile.BirthDate,
                    Age = profile.Age,
                    Status = profile.Status,
                };
            }
        }

        public bool DeleteProfile(Guid userId)
        {
            try
            {
                using (var db = new PortalEntities())
                {
                    //Lock
                    var user = db.AspNetUsers.FirstOrDefault(x => x.Id == userId.ToString());
                    user.LockoutEndDateUtc = DateTime.Parse("1/1/9999");

                    var profile = db.system_Profiles.Find(userId);
                    profile.Status = (int)Portal.Infractructure.Utility.Define.Status.Delete;
                    db.SaveChanges();

                    return true;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
