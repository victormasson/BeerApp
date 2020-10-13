using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BeerAPI.Models.DTO
{
    public class ResultApi<T>
    {
        public T Data { get; set; }
        public ErrorApi ErrorApi { get; set; }

        public ResultApi()
        {
            Data = default(T);
            ErrorApi = null;
        }
    }
}
