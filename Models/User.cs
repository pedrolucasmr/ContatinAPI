using System;

namespace contatinapi.Models
{
    public class User
    {
        public int Id{get;set;}
        public string LoginEmail{get;set;}
        public string UserName{get;set;}
        public DateTime CreatedAt{get;set;}
    }
}