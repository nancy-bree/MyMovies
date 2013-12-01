using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyMovies.Models;

namespace MyMovies
{
    public partial class NewGenre : System.Web.UI.Page
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
            string genreAction = Request.QueryString["genreAction"];
            if (genreAction == "exist")
            {
                LabelStatus.Text = "This genre is already exists in database.";
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            bool isAlreadyExists;
            using (var context = new MyMoviesContext())
            {
                var genre = new Genre
                {
                    Name = tbName.Text,
                };
                isAlreadyExists = context.Genres.FirstOrDefault(x => x.Name == genre.Name) != null;
                if (!isAlreadyExists)
                {
                    context.Genres.Add(genre);
                    context.SaveChanges();
                }
            }
            if (isAlreadyExists)
            {
                Response.Redirect(Request.Url.AbsoluteUri.Substring(0,
                    Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count()) + "?genreAction=exist");
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