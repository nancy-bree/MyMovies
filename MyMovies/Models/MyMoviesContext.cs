using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace MyMovies.Models
{
    public class MyMoviesContext : DbContext
    {
        public DbSet<Movie> Movies { get; set; }

        public DbSet<Genre> Genres { get; set; }

        public MyMoviesContext() : base(nameOrConnectionString: "MyMoviesContext") { }
    }
}