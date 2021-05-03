using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace Pocs.HealthCheck.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class TestController : ControllerBase
    {

        [Produces("application/json")]
        [HttpGet]
        [Route("")]
        public IActionResult Get()
        {
            return Ok(true);
        }
    }
}
