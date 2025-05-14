using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using WRRManagement.Domain.RoomTypes;

namespace WRRManagement.Infrastructure.Data
{
    public class WRRContext: IWRRContext
    {
            private readonly IConfiguration _configuration;
            private readonly string _connectionString;    
        
            public WRRContext(IConfiguration configuration)
            {
                _configuration = configuration ?? throw new ArgumentNullException(nameof(configuration));
            _connectionString = _configuration.GetConnectionString("WRRDBConnection") ?? throw new InvalidOperationException("Connection string is not found");
            }

        public IDbConnection CreateConnection() => new SqlConnection(_connectionString);
       

     
    }

    public interface IWRRContext
    {
        IDbConnection CreateConnection();
    }
}
