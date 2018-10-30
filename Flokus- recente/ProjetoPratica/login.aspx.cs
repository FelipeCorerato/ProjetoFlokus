using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjetoPratica
{
    public partial class login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session.IsNewSession && Session["Usuario"] == null) && (String)Session["Erro"] != "1")
            {

                TextBox txtAcesso = (TextBox)Page.Master.FindControl("txtAcesso");
                txtAcesso.Visible = false;
                TextBox txtSenha = (TextBox)Page.Master.FindControl("txtSenha");
                txtSenha.Visible = false;
                Button btnLogin = (Button)Page.Master.FindControl("btnLogin");
                btnLogin.Visible = false;
            }

       


        }
    }
}