using Newtonsoft.Json;

using barberDLL.Users;
using Microsoft.AspNetCore.Mvc;

namespace barberApi.Controllers
{
    [Route("user")]
    public class UserController : Controller
    {
        [HttpGet]
        [Route("get-users")]
        public void Get()
        {
            UserDAO userDAO = new UserDAO();
            //return Ok(userDAO.Get());
        }
        [HttpPost]
        [Route("save-user")]
        public void Save()
        {
            User user = new User("norem", "1234", "alessandroeich@hotmail.com");
            UserDAO userDAO = new UserDAO();
            userDAO.Save(user);
            //return Ok();
        }
        [HttpPost]
        [Route("validate-user")]
        public void ValidateUser([FromBody]string teste)
        {
            //if (user == null) throw new ArgumentNullException(nameof(user));
            //UserDAO userDAO = new UserDAO();
            //userDAO.GetUser(user);
            //if (userDAO.GetUser(user) != null)
            //{
            //    return Ok();
            //}
        }


    }
}
