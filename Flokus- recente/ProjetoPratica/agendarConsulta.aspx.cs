using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
               
            }
        }

        protected String dadosConsultaToString(String cpf_paciente)
        {
            //String nome_paciente, nome_medico, nome_secretaria, horario;
            //SqlCommand comando;



            //return "Bom dia, Sr(a). " + nome_paciente + "! \n" + "Este é um lembrete comunicando que está marcada uma consulta sua com o(a) Dr(a). " + nome_medico + "em dois dias a partir do envio deste " + " às " + horario + "\n" + "Atenciosamente, " + nome_secretaria + "ClinicaFlokus";
            return "";
        }
    }
}