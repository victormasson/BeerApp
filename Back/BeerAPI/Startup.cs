using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Serilog;
using Microsoft.OpenApi.Models;
using Microsoft.OpenApi;
using System.IO;
using System.Reflection;
using BeerAPI.Services;
using BeerAPI.Middlewares;
using Serilog.Sinks.Elasticsearch;

namespace BeerAPI
{
    public class Startup
    {
        public IConfiguration Configuration { get; }
        public IWebHostEnvironment HostingEnvironment { get; }

        public Startup(IConfiguration configuration, IWebHostEnvironment environment)
        {
            this.Configuration = configuration;
            this.HostingEnvironment = environment;

            var conf = new ConfigurationBuilder()
                .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
                .Build();

            //Init Serilog configuration
            Serilog.Core.Logger logger = new LoggerConfiguration()
                .WriteTo.Elasticsearch(ConfigureElasticSink(conf, environment.IsDevelopment() ? "Development" : "production"))
                //.WriteTo.Elasticsearch("http://localhost:9200", "back-api-dotnet-{0:yyyy.MM.dd}", "{Timestamp:yyyy-MM-dd HH:mm:ss.fff zzz}|{Level}|{Message:l}|{Exception}|{NewLine}")
                //.WriteTo.File("log.txt", rollingInterval: RollingInterval.Hour)
                .ReadFrom.Configuration(configuration)
                .CreateLogger();
            Log.Logger = logger;

            logger.Information("ApiUser (v2) is running!");
        }

        private static ElasticsearchSinkOptions ConfigureElasticSink(IConfigurationRoot configuration, string environment)
        {
            return new ElasticsearchSinkOptions(new Uri(configuration["ElasticConfiguration:Uri"]))
            {
                AutoRegisterTemplate = true,
                IndexFormat = $"back-api-dotnet-{environment?.ToLower().Replace(".", " - ")}-{DateTime.UtcNow:yyyy-MM-dd}",
            };
        }


        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddLogging(
                loggingBuilder => loggingBuilder.AddSerilog(dispose: true)
            );

            services.AddCors();
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "BeerApi", Version = "v1" });
                string xmlFile = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
                string xmlPath = Path.Combine(AppContext.BaseDirectory, xmlFile);
            });

            services.AddControllers();
            services.AddHttpClient();
            this.ConfigureDependencyInjection(services);
        }

        private void ConfigureDependencyInjection(IServiceCollection services)
        {
            services.Configure<BeerService>(this.Configuration);
            services.AddScoped<IBeerService, BeerService>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, ILoggerFactory loggerFactory)
        {
            //app.UseSerilogRequestLogging();

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseHttpsRedirection();

            app.UseCors(builder => builder.WithOrigins("*").WithHeaders("*").WithMethods("*"));

            app.UseRouting();

            app.UseAuthorization();

            app.UseSwagger()
                .UseSwaggerUI(c =>
                {
                    c.SwaggerEndpoint("/swagger/v1/swagger.json", "v1");
                });

            app.UseMiddleware(typeof(ErrorHandlingMiddleware));

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
