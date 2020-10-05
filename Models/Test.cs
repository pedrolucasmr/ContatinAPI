using System;
using System.Collections.Generic;

namespace contatinApi.Models
{
    public class Test
    {
        public string Name{get;set;}
        public string Email{get;set;}
        public List<string> Friends{get;set;}
        public Test(){
            this.Name="Cléber";
            this.Email="clebinho@gmail.com";
            this.Friends=new List<string>();
            this.Friends.Add("Ana");
            this.Friends.Add("Christian");
            this.Friends.Add("Lucas");
        }
    }
}