using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjetoPratica.App_Start;

namespace ProjetoPratica
{
    public partial class sec_pac_add : System.Web.UI.Page
    {
        conexaoBD con = new conexaoBD();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("sec_pac.aspx");
        }

        protected void btnInserir_Click(object sender, EventArgs e)
        {
            try
            {
                String conString = WebConfigurationManager.ConnectionStrings["conexaoBD"].ConnectionString;
                con.Connection(conString);
                con.AbrirConexao();
            }
            catch (Exception erro)
            {
                txtAcesso.Text = "Erro: " + erro.Message;
            }

            SqlCommand comando;

            String consultar_nome = "SELECT * FROM Paciente where nome='" + txtNome.Text + "'";
            if (con.ExecutarConsulta(consultar_nome) == 1)
            {
                RequiredFieldValidator5.Text = "Nome já cadatrado";
                RequiredFieldValidator5.Visible = true;
                return;
            };
            String consultar_CPF = "SELECT * FROM Paciente where cpf='" + txtCPF.Text + "'";
            if (con.ExecutarConsulta(consultar_CPF) == 1)
            {
                RequiredFieldValidator5.Text = "CPF já cadatrado";
                RequiredFieldValidator5.Visible = true;
                return;
            };

            String consultar_email = "SELECT * FROM Paciente where email='" + txtEmail.Text + "'";
            if (con.ExecutarConsulta(consultar_email) == 1)
            {
                RequiredFieldValidator3.Text = "e-mail já cadatrado";
                RequiredFieldValidator3.Visible = true;
                return;
            };
            String consultar_acesso = "SELECT * FROM Usuario where codAcesso='" + txtAcesso.Text + "'";
            if (con.ExecutarConsulta(consultar_acesso) == 1)
            {
                RequiredFieldValidator6.Text = "Acesso já cadatrado";
                RequiredFieldValidator6.Visible = true;
                return;
            };

            comando = new SqlCommand("INSERT INTO Usuario VALUES(@nomeUsuario, @senha)", con.getCon());
            comando.Parameters.AddWithValue("@nomeUsuario", txtAcesso.Text);
            comando.Parameters.AddWithValue("@senha", txtSenha.Text);

            comando.ExecuteNonQuery();

            comando = new SqlCommand("INSERT INTO Paciente VALUES(@cpf, @nome, @nasc, @email, @celular, @tel , @acesso)", con.getCon());
            comando.Parameters.AddWithValue("@cpf", txtCPF.Text);
            comando.Parameters.AddWithValue("@nome", txtNome.Text);
            comando.Parameters.AddWithValue("@nasc", txtData.Text);
            comando.Parameters.AddWithValue("@email", txtEmail.Text);
            comando.Parameters.AddWithValue("@celular", txtCelular.Text);
            comando.Parameters.AddWithValue("@tel", txtTelefone.Text);
            comando.Parameters.AddWithValue("@acesso", txtAcesso.Text);

            comando.ExecuteNonQuery();

            Response.Redirect("sec_pac.aspx");
        }
    }
}