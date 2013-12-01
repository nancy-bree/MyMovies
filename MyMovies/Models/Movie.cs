using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MyMovies.Models
{
    public class Movie
    {
        [Key]
        public int Id { get; set; }

        public string Title { get; set; }

        public int Year { get; set; }

        public int GenreId { get; set; }

        public virtual Genre Genre { get; set; }
    }
}