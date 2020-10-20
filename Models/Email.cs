using System;

namespace contatinApi.Models
{
    public class Email
    {
        public int Id{get;set;}
        public string Adress{get;set;}
        public string Title{get;set;}
        public string SubHeading{get;set;}
        public bool IsComercial{get;set;}
        public int ContactId{get;set;}
    }
}