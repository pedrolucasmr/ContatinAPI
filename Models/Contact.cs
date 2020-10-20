using System.Runtime.CompilerServices;
using System;
using contatinApi.Models;
using System.Collections.Generic;

namespace contatinApi.Models
{
    public class Contact
    {
        public int Id {get;set;}
        public string FirstName {get;set;}
        public string LastName {get;set;}
        public string NickName {get;set;}
        public string Company {get;set;}
        public bool IsComercial {get;set;}
        public DateTime CreatedAt{set;get;}
        private int UserId {get;set;}
        //public List<Email> Emails{get;set;} 
        //public List<Telephone> Telephones{get;set;}
    }
}