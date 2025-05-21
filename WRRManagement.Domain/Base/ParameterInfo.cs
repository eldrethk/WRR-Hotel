using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.Base
{
    public class ParameterInfo
    {
        public required string ParameterName { get; set; }
        public required object ParameterValue { get; set; }
    }
}
