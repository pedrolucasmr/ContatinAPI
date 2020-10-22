using System;
using System.Collections.Generic;

namespace contatinApi.Models
{
    public class ContactList
    {
        public int Id{get;set;}
        public DateTime CreatedAt{get;set;}
        public int UserId{get;set;}
        public User User{get;set;}
        public List<Contact> Contacts{get;set;}
    }
}