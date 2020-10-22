using System;

namespace contatinApi.Models
{
    public class Telephone
    {
        public int Id{get;set;}
        public string DDD{get;set;}
        public string DDI{get;set;}
        public string Number{get;set;}
        public string Title{get;set;}
        public string SubTitle{get;set;}
        public int ContactId{get;set;}
        public Contact Contact{get;set;}
    }
}