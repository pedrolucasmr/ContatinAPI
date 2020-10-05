using System.Collections.Generic;
using System;
using System.Collections;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using System.Text.Json;
using contatinApi.Models;

namespace contatinApi.Controllers
{
    [ApiController]
    [Route("Contact")]
    public class ContactController
    {
        [Route("Test")]
        public JsonResult GetAContact(){
        Test test=new Test();
            return new JsonResult(test);
        }
    }
}