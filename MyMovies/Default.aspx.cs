using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyMovies
{
    public partial class _Default : Page
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