
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

            double maxDistance = Math.Sqrt(Math.Pow(69.1 * (lastBarber.Latitude!.Value - barberFilter.Latitude!.Value), 2.0) +
                       Math.Pow((69.1 * (barberFilter.Longitude!.Value - lastBarber.Longitude!.Value) *
                       Math.Cos((lastBarber.Latitude!.Value / 57.3))), 2));

            return new BarberResponse(listBarbers, maxDistance);
        }

    }
}
