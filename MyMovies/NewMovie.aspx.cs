using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyMovies.Models;

namespace MyMovies
{
    public partial class NewMovie : System.Web.UI.Page
    {
        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
            if (Session["MyTheme"] == null)
            {
                Session.Add("MyTheme", "Skin1");
                Page.Theme = ((string)Session["MyTheme"]);
            }
            else
            {
                Page.Theme = ((string)Session["MyTheme"]);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            string movieAction = Request.QueryString["movieAction"];
            if (movieAction == "exist")
            {
                LabelStatus.Text = "This movie is already exists in database.";
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            bool isAlreadyExists;
            using (var context = new MyMoviesContext())
            {
                var movie = new Movie
                {
                    Title = tbTitle.Text,
                    Year = Int32.Parse(tbYear.Text),
                    Genre = context.Genres.Find(Int32.Parse(ddlGenre.SelectedItem.Value))
                };
                isAlreadyExists = context.Movies.FirstOrDefault(x => x.Title == movie.Title && x.Year == movie.Year && x.GenreId == movie.Genre.Id) != null;
                if (!isAlreadyExists)
                {
                    context.Movies.Add(movie);
                    context.SaveChanges();
                }
            }
            if (isAlreadyExists)
            {
                Response.Redirect(Request.Url.AbsoluteUri.Substring(0,
                    Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count()) + "?movieAction=exist");
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void strTheme_DataBound(object sender, EventArgs e)
        {
            strTheme.SelectedValue = Page.Theme;
        }
        protected void strTheme_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session.Add("MyTheme", strTheme.SelectedValue);
            Server.Transfer(Request.FilePath);
        }
    }
}