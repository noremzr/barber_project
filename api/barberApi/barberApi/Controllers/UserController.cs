using Newtonsoft.Json;

using barberDLL.Models.Users;
using Microsoft.AspNetCore.Mvc;
using barberDLL.Models.Barbers;

namespace barberApi.Controllers
{
    [Route("user")]
    public class UserController : Controller
    {
        [HttpGet]
        [Route("get-users")]
        public List<UserModel> Get()
        {
            UserDAO userDAO = new UserDAO();
            return userDAO.Get();
        }

        [HttpPost]
        [Route("save-user")]
        public string Save([FromBody] UserModel user)
        {
            UserDAO userDAO = new UserDAO();
            return userDAO.Save(user);
        }

        [HttpPost]
        [Route("validate-user")]
        public string ValidateUser([FromBody] UserModel user)
        {
            if (user == null) throw new ArgumentNullException(nameof(user));
            UserDAO userDAO = new UserDAO();
            UserModel? userSalvo = userDAO.GetUserByUserNameOrEmail(user);
            if (userSalvo == null)
            {
                return "Usuario Não Encontrado!";
            }
            else if (user.Password != userSalvo.Password)
            {
                return "Senhas Não Coincidem!";
            }
            return string.Empty;
        }


    }
}
