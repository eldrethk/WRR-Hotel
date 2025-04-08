using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Domain.Reservation;
using WRRManagement.Domain.Base;
using WRRManagement.Infrastructure.Data;
using WRRManagement.Domain.RoomTypes;
using Dapper;
using System.Data;
using Microsoft.Extensions.Logging;

namespace WRRManagement.Infrastructure.ReservationRepository
{
    public class ReservationRepository : IReservation
    {
        protected WRRContext context;
        private readonly IRoomAllocation roomAllocationRepository;
        private readonly ILogger<ReservationRepository> _logger;
        private ParameterInfo P(string name, object value) => new ParameterInfo() { ParameterName = name, ParameterValue = value };
        public ReservationRepository(WRRContext context, IRoomAllocation roomAllocation, ILogger<ReservationRepository> logger)
        {
            this.context = context;
            this.roomAllocationRepository = roomAllocation;
            this._logger = logger;
        }

        public int AddReservation(Reservation reservation)
        {
            if (reservation.ArrivalDate < reservation.DepartureDate)
            {
                int id = 0;
                bool available = false;
                return DapperHelper.ExecuteWithTransaction((conn, transaction) =>
                {
                    try
                    {
                        foreach (DateTime dteTemp in EachDay(reservation.ArrivalDate, reservation.DepartureDate))
                        {
                            List<ParameterInfo> parameters = new List<ParameterInfo>();
                            parameters.Add(P("RoomID", reservation.RoomTypeID));
                            parameters.Add(P("Date", dteTemp));
            
                            //tran.commit() and rollback if not available
                            int result = conn.ExecuteScalar<int>("dbo.genReserveRoom", parameters, transaction, commandType: CommandType.StoredProcedure);

                            if (result <= 0)
                            {
                                throw new Exception($"Failed to reserve room ~ {reservation.RoomTypeID} / {dteTemp}");
                            }

                            available = true;
                            //if (!available) { return -1; }                         
                        }
                        if (available)
                        {                           
                            List<ParameterInfo> parameters2 = new List<ParameterInfo>()
                                {
                                    P("HotelID", reservation.HotelID),
                                    P("RoomTypeID", reservation.RoomTypeID),
                                    P("ArrivalDate", reservation.ArrivalDate),
                                    P("DepartureDate", reservation.DepartureDate),
                                    P("TotalNights", reservation.TotalNights),
                                    P("Adults", reservation.Adults),
                                    P("Children", reservation.Children),
                                    P("AvgDailyRate", reservation.AvgDailyRate),
                                    P("SubTotal", reservation.SubTotal),
                                    P("ExtraAdultCharge", reservation.ExtraAdultCharge),
                                    P("ExtraChildCharge", reservation.ExtarChildCharge),
                                    P("WeekendFees", reservation.WeekendFees),
                                    P("ResortFees", reservation.ResortFees),
                                    P("TotalFees", reservation.TotalFees),
                                    P("Taxes", reservation.Taxes),
                                    P("TotalCharge", reservation.TotalCharge),
                                    P("Deposit", reservation.Deposit),
                                    P("Comments", reservation.Comments ?? string.Empty),
                                    P("CardHolderName", reservation.CardHolderName),
                                    P("CardExpireDate", reservation.CardExpirationDate),
                                    P("CardNumber", reservation.CardNumber),
                                    P("SecureCode", reservation.CardSecureCode),
                                    P("FirstName", reservation.CusFirstName),
                                    P("LastName", reservation.CusLastName),
                                    P("Address1", reservation.CusAddress1),
                                    P("Address2", reservation.CusAddress2 ?? string.Empty),
                                    P("City", reservation.CusCity),
                                    P("State", reservation.CusState),
                                    P("ZipCode", reservation.CusZip),
                                    P("PhoneNumber", reservation.CusDayPhone),
                                    P("Email", reservation.CusEmail),
                                    P("UserInitals", reservation.UserInitals)
                                };

                            id = DapperHelper.ExecuteQuery("dbo.genInsReservation", parameters2, context);
                        }
                    }
                    catch (Exception ex)
                    {
                        //add room allocation back
                        _logger.LogError(ex, "Error occurred while adding reservation: {@reservation}", reservation);

                    }
                    return available ? id : -1;

                }, context);
            }
            return -1;
        }

        private static IEnumerable<DateTime> EachDay(DateTime start, DateTime end)
        {
            for (var day = start; day < end; day = day.AddDays(1))
            {
                yield return day;
            }
        }

        public void AddReservationDailyRate(AvailableRackRoom rackRoom, int ReservationID)
        {
            try
            {
                if (rackRoom.ratesDate != null && rackRoom.rates != null)
                {
                    for (int i = 0; i < rackRoom.ratesDate.Count; i++)
                    {
                        List<ParameterInfo> parameters = new List<ParameterInfo>();
                        parameters.Add(P("ReservationID", ReservationID));
                        parameters.Add(P("ReservationDate", rackRoom.ratesDate[i]));
                        parameters.Add(P("DailyRate", rackRoom.rates[i]));

                        DapperHelper.ExecuteQuery("dbo.genInsDailyRate", parameters, context);
                    }
                }
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while adding daily rate for reservation ID {ReservationID}", ReservationID);
            }
        }
    }
}
