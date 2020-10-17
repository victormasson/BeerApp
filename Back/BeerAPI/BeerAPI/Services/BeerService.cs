using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text.Json;
using System.Threading.Tasks;
using BeerAPI.Models;
using BeerAPI.Models.DTO;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
//using Newtonsoft.Json;

namespace BeerAPI.Services
{
    public interface IBeerService
    {
        Task<ResultApi<IEnumerable<Beer>>> GetAllBeer(int page, int perPage);
    }

    public class BeerService : IBeerService
    {
        private IHttpClientFactory HttpClient { get; set; }
        private ILogger<BeerService> Logger { get; set; }
        private IConfiguration Configuration { get; set; }

        public BeerService(IHttpClientFactory _httpClient, ILogger<BeerService> _logger, IConfiguration _configuration)
        {
            this.HttpClient = _httpClient;
            this.Logger = _logger;
            this.Configuration = _configuration;
        }

        private HttpRequestMessage CreateRequest(HttpMethod verb, string url)
        {
            var request = new HttpRequestMessage(verb, url);
            request.Headers.Add("Accept", "application/json");

            return request;
        }

        public async Task<ResultApi<IEnumerable<Beer>>> GetAllBeer(int page, int perPage)
        {
            ResultApi<IEnumerable<Beer>> res = new ResultApi<IEnumerable<Beer>>();

            string url = $"{this.Configuration["ApiServices:BeerApi"]}/beers?page={page}&per_page={perPage}";

            var request = CreateRequest(HttpMethod.Get, url);
            this.Logger.LogInformation($"[{request.Method.Method}] {request.RequestUri.AbsoluteUri}");

            var client = this.HttpClient.CreateClient();
            var response = await client.GetAsync(request.RequestUri);

            if (!response.IsSuccessStatusCode)
            {
                if (response.StatusCode == System.Net.HttpStatusCode.BadRequest)
                {
                    var strContentError = await response.Content.ReadAsStringAsync();

                    ErrorApi errorApi = JsonSerializer.Deserialize<ErrorApi>(strContentError);
                    return new ResultApi<IEnumerable<Beer>>
                    {
                        ErrorApi = errorApi
                    };
                }

                string logError = $"{response.StatusCode}|{response.Content}";
                this.Logger.LogError(logError);
                throw new Exception(logError);
            }

            var strContent = await response.Content.ReadAsStringAsync();
            this.Logger.LogInformation($"{response.StatusCode}");
            IEnumerable<Beer> beers = JsonSerializer.Deserialize<IEnumerable<Beer>>(strContent);
            return new ResultApi<IEnumerable<Beer>>
            {
                Data = beers
            };
        }
    }
}
