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
    public partial class sec_med_add : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("sec_med.aspx");
        }

        protected void btnInserir_Click(object sender, EventArgs e)
        {
            // associando a string de conexao com o BD com o configurado no WebConfig
            String conString = WebConfigurationManager.ConnectionStrings["conexaoBD"].ConnectionString;

            // instanciar a classe conexaoBD
            conexaoBD acessoBD = new conexaoBD();
            acessoBD.Connection(conString);
            acessoBD.AbrirConexao();

          
                // consultando no BD se existe o LOGIN e SENHA digitados
                String sqlAcesso = "select * from Usuario where codAcesso='" + txtAcesso.Text + "'";
                int achouReg = acessoBD.ExecutarConsulta(sqlAcesso);
                if (achouReg > 0)
                {
                RequiredFieldValidator6.Text = "Acesso já cadatrado";
                RequiredFieldValidator6.Visible = true;
                }
                else
                {
                String sqlCRM = "select * from Medico where crm='" + txtCRM.Text + "'";
                achouReg = acessoBD.ExecutarConsulta(sqlCRM);
                if (achouReg > 0)
                {
                    RequiredFieldValidator6.Text = "Acesso já cadatrado";
                    RequiredFieldValidator6.Visible = true;
                }
                // criando variavel de sessao
                Session["Usuario"] = txtAcesso.Text;

                    SqlCommand comando;
                    string nome;

                    if (Convert.ToInt32(txtAcesso.Text) <= 9999)
                    {//e secretaria
                        Session["tipo"] = "Sec";

                        comando = new SqlCommand("select nome from Secretaria where acesso=@ACESSO", acessoBD.getCon());
                        comando.Parameters.AddWithValue("@ACESSO", txtAcesso.Text);

                        nome = (string)comando.ExecuteScalar();
                        Session["Nome"] = nome;
                    }
                    else if (Convert.ToInt32(txtAcesso.Text) >= 10000 && Convert.ToInt32(txtAcesso.Text) <= 19999)
                    {//e medico
                        Session["tipo"] = "Med";

                        comando = new SqlCommand("select nome from Medico where acesso=@ACESSO", acessoBD.getCon());
                        comando.Parameters.AddWithValue("@ACESSO", txtAcesso.Text);

                        nome = (string)comando.ExecuteScalar();
                        Session["Nome"] = nome;
                    }
                    else
                    {//e paciente
                        Session["tipo"] = "Pac";

                        comando = new SqlCommand("select nome from Paciente where acesso=@ACESSO", acessoBD.getCon());
                        comando.Parameters.AddWithValue("@ACESSO", txtAcesso.Text);

                        nome = (string)comando.ExecuteScalar();
                        Session["Nome"] = nome;
                    }
                    Response.Redirect("indexGeral.aspx");
                }
                acessoBD.FecharConexao();
            }






























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