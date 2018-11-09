using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Text.RegularExpressions;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using ProjetoPratica.App_Start;

namespace ProjetoPratica
{
    public partial class sec_med_add : System.Web.UI.Page
    {
        conexaoBD con = new conexaoBD();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("sec_med.aspx");
        }

        protected void btnInserir_Click(object sender, EventArgs e)
        {
            try
            {
                String conString = WebConfigurationManager.ConnectionStrings["conexaoBD"].ConnectionString;
                con.Connection(conString);
                con.AbrirConexao();
            }
            catch (Exception erro) {
                txtAcesso.Text = "Erro: " + erro.Message;
            }

            SqlCommand comando;

            String consultar_nome = "SELECT * FROM Medicos where nome='"+txtNome.Text+"'";
            if (con.ExecutarConsulta(consultar_nome) == 1)
            {
                RequiredFieldValidator5.Text = "Nome já cadatrado";
                RequiredFieldValidator5.Visible = true;
                return;
            };
            String consultar_crm = "SELECT * FROM Medicos where crm='" + txtCRM.Text + "'";
            if (con.ExecutarConsulta(consultar_crm) == 1)
            {
                RequiredFieldValidator4.Text = "CRM já cadatrado";
                RequiredFieldValidator4.Visible = true;
                return;
            };
            String consultar_email = "SELECT * FROM Medicos where email='" + txtEmail.Text + "'";
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

            comando = new SqlCommand("INSERT INTO Medico VALUES(@crm, @nome, @nasc, @email, @celular, @tel, @espec, @acesso)", con.getCon());
            comando.Parameters.AddWithValue("@crm", txtCRM.Text);
            comando.Parameters.AddWithValue("@nome", txtNome.Text);
            comando.Parameters.AddWithValue("@nasc", cldNasc.SelectedDate.ToString());
            comando.Parameters.AddWithValue("@email", txtEmail.Text);
            comando.Parameters.AddWithValue("@celular", txtCelular.Text);
            comando.Parameters.AddWithValue("@tel", txtTelefone.Text);
            comando.Parameters.AddWithValue("@espec", dpdEspec.SelectedValue);
            comando.Parameters.AddWithValue("@acesso", txtAcesso.Text);

            comando.ExecuteNonQuery();

            Response.Redirect("sec_med.aspx");
        }
    }
}