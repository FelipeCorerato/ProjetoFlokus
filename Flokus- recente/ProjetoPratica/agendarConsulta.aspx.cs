using ProjetoPratica.App_Start;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
using ProjetoPratica.App_Start;

namespace ProjetoPratica
{
    public partial class agendarConsulta : System.Web.UI.Page
    {
        conexaoBD con = new conexaoBD();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Consultas.aspx");
        }

        protected void btnAgendar_Click(object sender, EventArgs e)
        {
            try
            {
                String conString = WebConfigurationManager.ConnectionStrings["conexaoBD"].ConnectionString;
                con.Connection(conString);
                con.AbrirConexao();
            }
            catch (Exception erro)
            {
                txtData.Text = "Erro: " + erro.Message;
            }

            SqlCommand comando;

            //comando = new SqlCommand("INSERT INTO Agenda VALUES(@med)", con.getCon());
            //comando.Parameters.AddWithValue("@med", ddl_medicos.SelectedValue);
            //comando.ExecuteNonQuery();

            comando = new SqlCommand("INSERT INTO Consulta VALUES(@hora, @sec, @pac, @med, @age)", con.getCon());
            comando.Parameters.AddWithValue("@hora", txtData.Text+txtHora.Text);
            comando.Parameters.AddWithValue("@sec", DropDownList1.SelectedValue);
            comando.Parameters.AddWithValue("@pac", DropDownList2.SelectedValue);
            comando.Parameters.AddWithValue("@med", ddl_medicos.SelectedValue);
            comando.Parameters.AddWithValue("@age", null);

            comando.ExecuteNonQuery();

            Response.Redirect("Consultas.aspx");               
            
        }

        protected String dadosConsultaToString(String cpf_paciente)
        {
            //String nome_paciente, nome_medico, nome_secretaria, horario;
            //SqlCommand comando;



            //return "Bom dia, Sr(a). " + nome_paciente + "! \n" + "Este é um lembrete comunicando que está marcada uma consulta sua com o(a) Dr(a). " + nome_medico + "em dois dias a partir do envio deste " + " às " + horario + "\n" + "Atenciosamente, " + nome_secretaria + "ClinicaFlokus";
            return "";
        }

        protected void ddl_medicos_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}