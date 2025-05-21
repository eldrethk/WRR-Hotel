using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Domain.Base;

namespace WRRManagement.Infrastructure
{
    public interface IGenericRepository<T>
    {
        int Add(string spName, List<ParameterInfo> parameters);
        void Update(string spName, List<ParameterInfo> parameters);
        T GetById(string spName, List<ParameterInfo> parameters);
        IEnumerable<T> GetAll(string spName, List<ParameterInfo> parameters);

        void Delete(string spName, List<ParameterInfo> parameters);
       
    }
}
