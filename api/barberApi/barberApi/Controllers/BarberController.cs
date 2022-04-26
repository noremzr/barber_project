
using Newtonsoft.Json;

using barberDLL.Models.Users;
using Microsoft.AspNetCore.Mvc;
using barberDLL.Models.Barbers;

namespace barberApi.Controllers
{
    [Route("barber")]
    public class BarberController : Controller
    {
        [HttpPost]
        [Route("get-barbers-distance-pagining")]
        public BarberResponse GetBarbersByDistancePagining([FromBody] UserFilter barberFilter)
        {
            ArgumentNullException.ThrowIfNull(barberFilter);

            List<UserModel> listBarbers = new UserDAO().GetBarbersByDistancePaging(barberFilter);
            UserModel lastBarber = listBarbers.Last();

            double maxDistance = Math.Sqrt(
                             Math.Pow(barberFilter.Latitude!.Value + lastBarber.Latitude!.Value!, 2) +
                             Math.Pow(barberFilter.Longitude!.Value - lastBarber.Longitude!.Value, 2)
                             ) * 111.19;


            return new BarberResponse(listBarbers, maxDistance);
        }

    }
}
