﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Portal.Model.Context
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class PortalEntities : DbContext
    {
        public PortalEntities()
            : base("name=PortalEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<C__MigrationHistory> C__MigrationHistory { get; set; }
        public virtual DbSet<AspNetRole> AspNetRoles { get; set; }
        public virtual DbSet<AspNetUserClaim> AspNetUserClaims { get; set; }
        public virtual DbSet<AspNetUserLogin> AspNetUserLogins { get; set; }
        public virtual DbSet<AspNetUser> AspNetUsers { get; set; }
        public virtual DbSet<cms_Categories> cms_Categories { get; set; }
        public virtual DbSet<cms_News> cms_News { get; set; }
        public virtual DbSet<share_Categories> share_Categories { get; set; }
        public virtual DbSet<share_Images> share_Images { get; set; }
        public virtual DbSet<system_Banners> system_Banners { get; set; }
        public virtual DbSet<system_Config> system_Config { get; set; }
        public virtual DbSet<system_Menu> system_Menu { get; set; }
        public virtual DbSet<system_Profiles> system_Profiles { get; set; }
        public virtual DbSet<portal_Projects> portal_Projects { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
    }
}