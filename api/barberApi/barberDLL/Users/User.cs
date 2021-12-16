using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;
using Newtonsoft.Json;

namespace barberDLL.Users
{
    [Table("tUsers")]
    [JsonObject("UserModel")]
    public class User
    {
        [Column("userName", TypeName = "varchar(50)")]
        [JsonProperty()]
        public string? UserName { get; set; }

        [Column("password", TypeName = "varchar(50)")]
        [JsonProperty()]
        public string? Password { get; set; }

        [Column("email", TypeName = "varchar(100)")]
        [JsonProperty()]
        public string? Email { get; set; }

        [JsonConstructor]
        private User() { }

        [JsonConstructor]
        public User(string userName,
            string password,
            string email)
        {
            UserName = userName;
            Password = password;
            Email = email;
        }
    }
}
