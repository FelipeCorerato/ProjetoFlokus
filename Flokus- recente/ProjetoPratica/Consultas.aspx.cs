using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjetoPratica;

namespace ProjetoPratica
{
    public partial class Consultas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            EmailSender emailSender = new EmailSender("clinicaflokus@gmail.com", "Senha123");

            emailSender.sendEmail("fcorerato@gmail.com", "Ce tem consulta vei", "dados da consulta");
        }
<<<<<<< HEAD

        protected void btnAgendar_Click(object sender, EventArgs e)
        {
            Response.Redirect("agendarConsulta.aspx");
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("indexGeral.aspx");
        }
=======
>>>>>>> parent of e3583ed... bonito
    }
}