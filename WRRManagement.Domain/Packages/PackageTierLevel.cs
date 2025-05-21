using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.Packages
{
    public class PackageTierLevel
    {
        public int TierLevelID { get; set; }
        [Required]
        public DateTime TierDate { get; set; }
        [Required]
        public char Tier { get; set; }
        [Required]
        public int PackageID { get; set; }

        #region Constructors

        public PackageTierLevel()
        {
        }

        public PackageTierLevel(IDataReader reader)
            : this()
        {
            TierLevelID = Convert.ToInt32(reader["TierLevelID"]);
            TierDate = Convert.ToDateTime(reader["TierDate"]);
            string temp = reader["TierLevel"].ToString();
            Tier = Convert.ToChar(temp.Trim());

            PackageID = Convert.ToInt32(reader["PackageID"]);
        }
        #endregion
    }


}


public class PackageTierEventViewModel
{
    public int eventID { get; set; }
    public string title { get; set; }
    public DateTime start { get; set; }

    public DateTime end { get; set; }
    public bool allDay { get; set; }

    public string color { get; set; }

    public string description { get; set; }

    public PackageTierEventViewModel() { }

    public PackageTierEventViewModel(IDataReader rd) : this()
    {
        eventID = Convert.ToInt32(rd["TierLevelID"]);    
        string temp = rd["TierLevel"].ToString();
        char charTemp = Convert.ToChar(temp.Trim());
        string tier = charTemp.ToString();
        title = tier.ToLower();
        start = Convert.ToDateTime(rd["TierDate"]);
        end = Convert.ToDateTime(rd["TierDate"]);
        int packageid = Convert.ToInt32(rd["PackageID"]);
        description = packageid.ToString();
        allDay = true;
        if (charTemp == 'a')
            color = "#008cba";
        else if (charTemp == 'b')
            color = "#5bc0de";
        else if (charTemp == 'c')
            color = "#43ac6a";
        else
            color = "#008cba";




    }
}