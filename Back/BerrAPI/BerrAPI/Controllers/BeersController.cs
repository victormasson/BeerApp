using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BerrAPI.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace BerrAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BeersController : ControllerBase
    {
        private readonly IBeerService beerService;

        public BeersController(IBeerService beerService)
        {

        }

        //[HttpGet]
        //public IList<>
    }
}