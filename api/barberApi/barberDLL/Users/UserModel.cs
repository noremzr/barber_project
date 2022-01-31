using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;
using Newtonsoft.Json;

namespace barberDLL.Models.Users
{
    [Table("tUsers")]
    [JsonObject("UserModel")]
    public class UserModel
    {
        [JsonProperty()]
        [NotMapped()]
        public bool Existe { get; set; }

        [Column("userName", TypeName = "varchar(50)")]
        [JsonProperty()]
        public string UserName { get; set; }

        [Column("completeName", TypeName = "varchar(100)")]
        [JsonProperty()]
        public string? CompleteName { get; set; }

        [Column("password", TypeName = "varchar(50)")]
        [JsonProperty()]
        public string Password { get; set; }

        [Column("email", TypeName = "varchar(100)")]
        [JsonProperty()]
        public string Email { get; set; }

        [Column("isBarber", TypeName = "bit")]
        [JsonProperty()]
        public bool? IsBarber { get; set; }

        [Column("latitude", TypeName = "float")]
        [JsonProperty()]
        public double? Latitude { get; set; }

        [Column("longitude", TypeName = "float")]
        [JsonProperty()]
        public double? Longitude { get; set; }

        [Column("streetName", TypeName = "varchar(200)")]
        [JsonProperty()]
        public string? StreetName { get; set; }

        public UserModel() { }

        public UserModel(string userName,
            string password,
            string email) : this(true, userName, password, email, 0.0, 0.0, false, string.Empty, string.Empty)
        {
        }

        [JsonConstructor()]
        public UserModel(bool existe,
            string userName,
          string password,
          string email,
          double latitude,
          double longitude,
          bool isBarber,
          string completeName,
          string streetName
          )
        {
            Existe = existe;
            UserName = userName;
            Password = password;
            Email = email;
            Latitude = latitude;
            Longitude = longitude;
            IsBarber = isBarber;
            CompleteName = completeName;
            StreetName = streetName;
        }


    }
}
