using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;
using Newtonsoft.Json;
using barberDLL.Models.Users;

namespace barberDLL.Models.Barbers
{
    [JsonObject("BarberResponse")]
    public class BarberResponse
    {
        [JsonProperty()]
        public List<UserModel> ListBarbeiros { get; set; }

        [JsonProperty()]
        public double MaiorDistanciaFiltrada { get; set; }

        public BarberResponse(List<UserModel> listaBarbeiros, double maiorDistanciaFiltrada)
        {
            this.ListBarbeiros = listaBarbeiros;
            this.MaiorDistanciaFiltrada = maiorDistanciaFiltrada;
        }
    }
}
