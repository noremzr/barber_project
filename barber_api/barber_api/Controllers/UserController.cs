using Microsoft.AspNetCore.Mvc;
using barberDLL.Models.Users;

namespace barber_api.Controllers
{
    [ApiController]
    [Route("User")]
    public class UserController : ControllerBase
    {


        private readonly ILogger<UserController> _logger;

        public UserController(ILogger<UserController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        [Route("get-users")]
        public IEnumerable<UserModel> GetUsers()
        {
            return new UserDAO().Get();
        }

        [HttpPost]
        [Route("save")]
        public void Save(UserModel u)
        {

        }

        [HttpPost]
        [Route("validate-user")]
        public bool ValidateUser(UserModel u)
        {
            //return new UserDAO().GetUser(u) != null;
            return true;
        }
    }
}
