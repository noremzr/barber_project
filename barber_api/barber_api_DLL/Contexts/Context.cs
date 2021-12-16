using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using barberDLL.Models.Users;

namespace barberDLL.Contexts
{
    public class Context : DbContext
    {

        public DbSet<UserModel>? Users { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<UserModel>()
                .HasKey(c => new { c.UserName });
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Server=localhost\SQLEXPRESS;Database=Dev;uid=norem;pwd=1234;Trusted_Connection=True;");
        }
    }
}
