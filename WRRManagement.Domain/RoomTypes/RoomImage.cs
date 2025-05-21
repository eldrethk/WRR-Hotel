using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Web;
using System.IO;

namespace WRRManagement.Domain.RoomTypes
{
    public class RoomImage
    {
        public int ImageID { get; set; }
        [Required]
        public int RoomTypeID { get; set; }
        public string? Description { get; set; }
        [Display(Name = "Set as Main Image")]
        public bool MainImage { get; set; }
        public bool Visible { get; set; }
        public float ContentLength { get; set; }
        
        public required string ContentType { get; set; }
        [Required]
        [Display(Name = "File Name")]
        public required string FileName { get; set; }

        

        public RoomImage() { }

        public RoomImage(IDataReader reader)
           : this()
        {
            ImageID = Convert.ToInt32(reader["ImageID"]);
            RoomTypeID = Convert.ToInt32(reader["RoomTypeID"]);
            Description = reader["Description"].ToString();
            try
            {
                MainImage = Convert.ToBoolean(reader["MainImage"]);
            }
            catch
            {
                MainImage = false;
            }
            Visible = Convert.ToBoolean(reader["Visible"]);
            ContentLength = Convert.ToSingle(reader["ContentLength"]);
            ContentType = reader["ContentType"].ToString() ?? string.Empty;
            FileName = reader["FileName"].ToString() ?? string.Empty;

        }
    }

    
}