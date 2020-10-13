using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BeerAPI.Models.DTO
{
    public class BeerDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Tagline { get; set; }
        public string FirstBrewed { get; set; }
        public string Description { get; set; }
        public string ImageUrl { get; set; }

        /// <summary>
        /// Pourcentage d'alcool
        /// </summary>
        public decimal Abv { get; set; }

        public string Twist { get; set; }
    }
}
