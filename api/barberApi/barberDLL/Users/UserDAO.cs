﻿using barberDLL.Contexts;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace barberDLL.Users
{
    public class UserDAO
    {
        public void Save(User user) {
            using (Context context = new Context())
            {
                context.Users!.Add(user);
                context.SaveChanges();
            }
        }

        public List<User> Get()
        {
            List<User> users = new List<User>();
            using (Context context = new Context())
            {
                users = context.Users!.ToList();
            }
            return users;
        }

        public User? GetUser(User user)
        {
            User? users = null;
            using (Context context = new Context())
            {
                users = (from item in context.Users where user.UserName == item.UserName && user.Password ==item.Password select item).FirstOrDefault();
            }
            return user;
        }

    }
}
