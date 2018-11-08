using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjetoPratica
{
    public partial class sec_pac : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnVoltar_Click1(object sender, EventArgs e)
        {
            Response.Redirect("indexGeral.aspx");
        }

        protected void btnAdicionar_Click1(object sender, EventArgs e)
        {
            Response.Redirect("sec_pac_add.aspx");
        }
    }
}