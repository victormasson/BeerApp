using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace BeerAPI.Middlewares
{
    public class ErrorHandlingMiddleware
    {
        private ILogger logger;
        private readonly RequestDelegate next;
        private IWebHostEnvironment env;
        public ErrorHandlingMiddleware(RequestDelegate next)
        {
            this.next = next;
        }

        public async Task Invoke(HttpContext context, ILogger<ErrorHandlingMiddleware> logger, IWebHostEnvironment env)
        {
            try
            {
                this.logger = logger;
                this.env = env;

                string path = context.Request.Path.HasValue ? context.Request.Path.Value : "";
                string query = context.Request.Query.Aggregate("", (acc, k) => $"{acc},{k.Key}={k.Value}").TrimStart(',');
                string message = string.Format("{0}|{1}|{2}", context.Request.Method, path, query);
                this.logger.LogInformation(message);
                await next(context);
            }
            catch (Exception ex)
            {
                await HandleExceptionAsync(context, ex);
            }
        }

        private Task HandleExceptionAsync(HttpContext context, Exception ex)
        {
            var code = HttpStatusCode.InternalServerError; // 500 if unexpected

            string message = string.Format("{0}. {1}", nameof(Exception), ex.Message);

            this.logger.LogError(ex, message);

            var result = JsonConvert.SerializeObject(new { error = message });
            context.Response.ContentType = "application/json";
            context.Response.StatusCode = (int)code;
            return context.Response.WriteAsync(result);
        }
    }
}
