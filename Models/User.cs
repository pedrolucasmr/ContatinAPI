using System;
using System.Collections.Generic;

namespace contatinApi.Models
{
    public class User
    {
        public int Id{get;set;}
        public string LoginEmail{get;set;}
        public string UserName{get;set;}
        public DateTime CreatedAt{get;set;}
        public List<Contact> Contacts {get;set;}
        public List<ContactList> ContactLists{get;set;}
    }
}