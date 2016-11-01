using Portal.Model.Context;
using Portal.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Portal.Service.Interfaces
{
    public interface IOrganiserService
    {
        OrganiserViewModel GetOrganiserByUserId(Guid? userId);
        bool AddOrganiser(OrganiserViewModel viewModel);
        bool EditOrganiser(OrganiserViewModel viewModel);
    }
}
