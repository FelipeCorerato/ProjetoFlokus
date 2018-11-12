using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using ProjetoPratica.App_Start;
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
            //SqlCommand comando;

            //String email = "SELECT * FROM Paciente where cpf='" + "'";

            //String conteudo = emailToString();

            // EmailSender emailSender = new EmailSender("clinicaflokus@gmail.com", "Senha123");
            //emailSender.sendEmail(email, "Consulta em breve", conteudo);





            EmailSender emailSender = new EmailSender("clinicaflokus@gmail.com", "Senha123");

            emailSender.sendEmail("fcorerato@gmail.com", "Ce tem consulta vei", "dados da consulta");
        }

        protected String emailToString(String nome_paciente, String nome_medico, String horario, String nome_secretaria)
        {

            return "Bom dia, Sr(a). " + nome_paciente + "! \n" +
                   "Este é um lembrete comunicando que está marcada uma consulta sua com o(a) Dr(a). " + nome_medico +
                   "em dois dias a partir do envio deste " + " às " + horario + "\n" + "Atenciosamente, " + nome_secretaria + "ClinicaFlokus";
        }

        protected void btnAgendar_Click(object sender, EventArgs e)
        {
            Response.Redirect("agendarConsulta.aspx");
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("indexGeral.aspx");
        }
    }
}