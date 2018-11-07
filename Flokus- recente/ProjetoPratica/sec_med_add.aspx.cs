using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
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
            String consultar_acesso = "SELECT * FROM Medicos where acesso='" + txtAcesso.Text + "'";
            if (con.ExecutarConsulta(consultar_acesso) == 1)
            {
                RequiredFieldValidator6.Text = "Acesso já cadatrado";
                RequiredFieldValidator6.Visible = true;
                return;
            };



            String cmd_a = "INSERT INTO Usuario VALUES('" + txtAcesso.Text + "','" + txtSenha.Text + "')";
            con.ExecutaInsUpDel(cmd_a);


            String cmd_m="INSERT INTO Medico VALUES('"+txtCRM.Text + "','" +
                                                   txtNome.Text + "','" +
                                                   cldNasc.SelectedDate.ToString() + "','" +
                                                   txtEmail.Text + "','" +
                                                   txtCelular.Text + "','" +
                                                   txtTelefone.Text +"'," +
                                                   dpdEspec.SelectedValue + "','" +
                                                   txtAcesso.Text+"')";
            con.ExecutaInsUpDel(cmd_m);
        }
    }
}