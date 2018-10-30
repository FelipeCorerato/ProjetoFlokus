using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjetoPratica
{
    public partial class siples : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnVoltar_Click1(object sender, EventArgs e)
        {
            Response.Redirect("indexGeral.aspx");
        }
    }
}