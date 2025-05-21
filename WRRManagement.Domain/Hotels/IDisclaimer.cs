using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.Hotels
{
    public interface IDisclaimer
    {
        void Update(Disclaimer disclaimer);
        Disclaimer GetDisclaimer(int hotelId);
    }
}
