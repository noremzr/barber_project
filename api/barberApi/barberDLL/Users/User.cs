using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;

namespace barberDLL.Users
{
    [Table("tUsers")]
    public class User
    {
        [Column("userName",TypeName = "varchar(50)")]
        public string? UserName { get; set; }

        [Column("password",TypeName ="varchar(50)")]
        public string? Password { get; set; }

        [Column("email",TypeName = "varchar(100)")]
        public string? Email { get; set; }


        public User(string userName,
            string password,
            string email)
        {
            UserName = userName;
            Password   =password;
            Email =email;
        }
    }
}
