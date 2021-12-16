using barberDLL.Contexts;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace barberDLL.Models.Users
{
    public class UserDAO
    {
        public void Save(UserModel user)
        {
            using (Context context = new Context())
            {
                context.Users!.Add(user);
                context.SaveChanges();
            }
        }

        public List<UserModel> Get()
        {
            List<UserModel> users = new List<UserModel>();
            using (Context context = new Context())
            {
                users = context.Users!.ToList();
            }
            return users;
        }

        public UserModel? GetUser(UserModel user)
        {
            UserModel? users = null;
            using (Context context = new Context())
            {
                users = (from item in context.Users where user.UserName == item.UserName && user.Password == item.Password select item).FirstOrDefault();
            }
            return user;
        }

    }
}
