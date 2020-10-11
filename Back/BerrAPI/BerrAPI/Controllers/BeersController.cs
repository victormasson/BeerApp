using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BerrAPI.Models;
using BerrAPI.Models.DTO;
using BerrAPI.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace BerrAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BeersController : ControllerBase
    {
        public IBeerService BeerService { get; }

        public BeersController(IBeerService _beerService)
        {
            this.BeerService = _beerService;
        }

        [HttpGet]
        public async Task<ActionResult<ResultApi<IEnumerable<Beer>>>> Get([FromQuery] int page, int perPage)
        {
            var beers = await this.BeerService.GetAllBeer(page, perPage);
            return this.Ok(beers);
        }
    }
}