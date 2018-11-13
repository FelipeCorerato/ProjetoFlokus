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

            emailSender.sendEmail("fcorerato@gmail.com", "Você possui uma consulta na Flokus em breve!", "dados da consulta");
        }

        protected String emailToString(String nome_paciente, String nome_medico, String horario, String nome_secretaria)
        {

            return "Bom dia, Sr(a). " + nome_paciente + "! \n" +
                   "Este é um lembrete comunicando que está marcada uma consulta sua com o(a) Dr(a). " + nome_medico +
                   "em dois dias a partir do envio deste " + " às " + horario + "\n" + "Atenciosamente, " + nome_secretaria + "ClinicaFlokus";
        }

        protected String emailToString(String nome_medico, String horario, String nome_secretaria)
        {

            return "Bom dia, Sr(a). "  + "! \n" +
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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            SqlCommand comando;
            string nomeMedico, horarioConsulta;
            conexaoBD con = new conexaoBD();

            String conString = WebConfigurationManager.ConnectionStrings["conexaoBD"].ConnectionString;
            con.Connection(conString);
            con.AbrirConexao();

            comando = new SqlCommand("SELECT nome from Medico where crm IN (SELECT crm from Consulta where codConsulta = @COD)", con.getCon());

            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView1.Rows[index];
            //Convert.ToInt32(e.CommandArgument)
            comando.Parameters.AddWithValue("@COD", row.Cells[0].Text);
            nomeMedico = (string)comando.ExecuteScalar();

            horarioConsulta = row.Cells[1].Text;

            EmailSender emailSender = new EmailSender("clinicaflokus@gmail.com", "Senha123");

            emailSender.sendEmail("fcorerato@gmail.com", "Você possui uma consulta na Flokus em breve!", "Aqui estão os dados da sua consulta: \n \n" +
                                                                                                         "Nome do Médico: " + nomeMedico + " | \n" +
                                                                                                         "Horário da Consulta: " + horarioConsulta);


            //btnEnviar_Click(sender, e);
        }
    }
}