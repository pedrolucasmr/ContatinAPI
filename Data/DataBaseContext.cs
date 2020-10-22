using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using MySql.Data.EntityFrameworkCore;
using contatinApi.Models;


namespace ContatinApi.Data
{
    public class DataBaseContext:DbContext
    {
        IConfiguration _configuration;
        public DataBaseContext(IConfiguration configuration){
           _configuration=configuration;
        }
        public DbSet<Contact> Contacts{get;set;}
        public DbSet<Email> Emails{get;set;}
        public DbSet<Telephone> Telephones{get;set;}   
        public DbSet<ContactList> ContactLists{get;set;}
        public DbSet<User> Users{get;set;}      
        protected override void OnModelCreating(ModelBuilder modelBuilder){
            modelBuilder.Entity<Contact>()
            .HasMany(c=>c.Emails)
            .WithOne(e=>e.Contact)
            .HasForeignKey(e=>e.ContactId)
            .HasPrincipalKey(c=>c.Id);
            modelBuilder.Entity<Contact>()
            .HasMany(c=>c.Telephones)
            .WithOne(t=>t.Contact)
            .HasForeignKey(t=>t.ContactId)
            .HasPrincipalKey(c=>c.Id);
            modelBuilder.Entity<ContactList>()
            .HasMany(l=>l.Contacts)
            .WithMany(c=>c.ContactLists)
            .UsingEntity(j=>j.ToTable("contactOfAList"));
            modelBuilder.Entity<Contact>()
            .HasOne(c=>c.User)
            .WithMany(u=>u.Contacts)
            .HasForeignKey(c=>c.UserId)
            .HasPrincipalKey(u=>u.Id);
            modelBuilder.Entity<ContactList>()
            .HasOne(l=>l.User)
            .WithMany(u=>u.ContactLists)
            .HasForeignKey(l=>l.UserId)
            .HasPrincipalKey(u=>u.Id);
        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseMySQL(_configuration["db:connectionString"]);
        }

    }
}