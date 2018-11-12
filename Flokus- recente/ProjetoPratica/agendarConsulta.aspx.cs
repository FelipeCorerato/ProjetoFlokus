using ProjetoPratica.App_Start;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

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

            comando = new SqlCommand("INSERT INTO Consulta VALUES(@hora, @sec, @pac, @med, @age,)", con.getCon());
            comando.Parameters.AddWithValue("@hora", txtData.Text+txtHora.Text);
            comando.Parameters.AddWithValue("@sec", DropDownList1.SelectedIndex);
            comando.Parameters.AddWithValue("@pac", DropDownList2.SelectedIndex);
            comando.Parameters.AddWithValue("@med", ddl_medicos.SelectedIndex);
            comando.Parameters.AddWithValue("@age", "!");
            

            comando.ExecuteNonQuery();

            Response.Redirect("Consultas.aspx");
        }

    }
}