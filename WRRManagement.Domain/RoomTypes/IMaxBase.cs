using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Infrastructure;

namespace WRRManagement.Domain.RoomTypes
{
    public  interface IMaxBase 
        //: IGenericRepository<MaxBase>
    {
        MaxBase GetByRoomID(int roomid);
        int Add(MaxBase entity);
    }
}
