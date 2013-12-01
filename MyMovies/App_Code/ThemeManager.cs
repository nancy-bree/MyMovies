using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace MyMovies
{
    public class ThemeManager
    {
        public static List<Theme> GetThemes()
        {
            var dInfo = new DirectoryInfo(
              System.Web.HttpContext.Current.Server.MapPath("App_Themes"));
            DirectoryInfo[] dArrInfo = dInfo.GetDirectories();
            var list = new List<Theme>();
            foreach (DirectoryInfo sDirectory in dArrInfo)
            {
                var temp = new Theme(sDirectory.Name);
                list.Add(temp);
            }
            return list;
        }
    }
}