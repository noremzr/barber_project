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
        public string Save(UserModel user)
        {
            string erro = string.Empty;
            using (Context context = new Context())
            {
                erro = ValidateSave(context, user, erro);

                if (string.IsNullOrEmpty(erro) && string.IsNullOrWhiteSpace(erro))
                {
                    if (user.Existe)
                    {
                        context.Users!.Update(user);
                    }
                    else
                    {
                        context.Users!.Add(user);
                    }
                    context.SaveChanges();
                }
            }
            return erro;
        }

        private string ValidateSave(Context context, UserModel userToSave, string erro)
        {
            List<UserModel> users = (from item in context.Users where userToSave.UserName == item.UserName || userToSave.Email == item.Email select item).ToList();

            foreach (UserModel savedUser in users)
            {
                if (userToSave.Existe)
                {
                    if (ValidaEmail(savedUser.Email, userToSave.Email) && savedUser.UserName != userToSave.UserName)
                    {
                        erro = "Este email já está sendo utilizado! altere e tente novamnete!";
                    }
                }
                else
                {
                    if (savedUser.UserName == userToSave.UserName)
                    {
                        erro = "Este usuário está sendo utilizado! altere e tente novamente!";
                    }
                    else if (ValidaEmail(savedUser.Email, userToSave.Email))
                    {
                        erro = "Este email já está sendo utilizado! altere e tente novamnete!";
                    }
                }
            }
            return erro;
        }

        private bool ValidaEmail(string email, string outroEmail)
        {
            if (email == outroEmail)
            {
                return true;
            }
            else
            {
                return false;
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

        public UserModel? GetUser(UserModel userFilter)
        {
            UserModel? user = null;
            using (Context context = new Context())
            {
                user = (from item in context.Users where userFilter.UserName == item.UserName && userFilter.Password == item.Password select item).FirstOrDefault();
                if (user != null) { user.Existe = true; }
            }
            return user;
        }

        public List<UserModel> GetBarbers()
        {
            List<UserModel> users = new List<UserModel>();
            using (Context context = new Context())
            {
                users = (from item in context.Users where item.IsBarber == true select item).ToList();
                users.ForEach(x => x.Existe = true);
            }
            return users;
        }

        public List<UserModel> GetBarbersByDistancePaging(UserFilter userFilter)
        {
            List<UserModel> users = new List<UserModel>();
            using (Context context = new Context())
            {
                users = (from item in context.Users!
                         .OrderBy(x =>
                         Math.Sqrt(
                             Math.Pow(userFilter.Latitude!.Value + x.Latitude!.Value!, 2) +
                             Math.Pow(userFilter.Longitude!.Value - x.Longitude!.Value, 2)
                             ) * 111.19
                         )
                         where item.IsBarber == true
                         &&
                         Math.Sqrt(
                             Math.Pow(userFilter.Latitude!.Value + item.Latitude!.Value!, 2) +
                             Math.Pow(userFilter.Longitude!.Value - item.Longitude!.Value, 2)
                             ) * 111.19 > userFilter.UltimoCalculoFiltrado
                         select item).Take(10).ToList();
                users.ForEach(x => x.Existe = true);
            }
            return users;
        }

        //um calculo existente
        //  Math.Sqrt(Math.Pow(69.1 * (x.Latitude!.Value - userFilter.Latitude!.Value), 2.0) +
        //Math.Pow((69.1 * (userFilter.Longitude!.Value - x.Longitude!.Value) *
        //               Math.Cos((x.Latitude!.Value / 57.3))), 2))

        public UserModel? GetUserByUserNameOrEmail(UserModel userFiltered)
        {
            UserModel? user = null;
            using (Context context = new Context())
            {
                user = (from item in context.Users where userFiltered.UserName == item.UserName || userFiltered.Email == item.Email select item).FirstOrDefault();
                if (user != null) { user.Existe = true; }
            }
            return user;
        }


    }
}
