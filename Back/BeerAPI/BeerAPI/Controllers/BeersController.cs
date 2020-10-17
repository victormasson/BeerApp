using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BeerAPI.Models;
using BeerAPI.Models.DTO;
using BeerAPI.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace BeerAPI.Controllers
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

            var beerDto = beers.Data.Select(d => new BeerDto()
            {
                Id = d.Id,
                Abv = d.Abv,
                Description = d.Description,
                FirstBrewed = d.FirstBrewed,
                ImageUrl = d.ImageUrl,
                Name = d.Name,
                Tagline = d.Tagline,
                Twist = d.Method.Twist
            });
            return this.Ok(beerDto);
        }
    }
}