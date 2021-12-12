using Microsoft.AspNetCore.Mvc;
using barberDLL.Users;

namespace barberApi.Controllers
{
    [Route("user")]
    public class UserController : Controller
    {
    [HttpGet]
    [Route("get-users")]
        public IActionResult Get()
        {
            UserDAO userDAO = new UserDAO();
            return Ok(userDAO.Get());
        }
    [HttpPost]
    [Route("save-user")]
        public IActionResult Save()
        {
            User user = new User("norem","1234","alessandroeich@hotmail.com");
            UserDAO userDAO = new UserDAO();
                userDAO.Save(user);
            return Ok();
        }
    }
}
