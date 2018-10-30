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
    public partial class Cabecalho : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.IsNewSession || Session["user"] == null)
            {

            }

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // associando a string de conexao com o BD com o configurado no WebConfig
            String conString = WebConfigurationManager.ConnectionStrings["conexaoBD"].ConnectionString;

            // instanciar a classe conexaoBD
            conexaoBD acessoBD = new conexaoBD();
            acessoBD.Connection(conString);
            acessoBD.AbrirConexao();

            // checar se o usuario digitou dados para o LOGIN e SENHA
            if ((txtAcesso.Text == "") || (txtSenha.Text == ""))
            {
                //digite todo os campos
                Session["Erro"] = "1";
                lblMsg.Text = "Digite todos os campos!";
                txtAcesso.Text = "";
                txtSenha.Text = "";
            }
            else
            {
                // consultando no BD se existe o LOGIN e SENHA digitados
                String sqlAcesso = "select * from Usuario where codAcesso='" + txtAcesso.Text + "' and senha='" + txtSenha.Text + "'";
                int achouReg = acessoBD.ExecutarConsulta(sqlAcesso);
                if (achouReg <= 0)
                {
                    //Session["Erro"] = "2";
                    //ACESSO NEGADO! Vc nao tem CADASTRO!
                    Response.Redirect("login.aspx");

                }
                else
                {
                    // criando variavel de sessao
                    Session["Usuario"] = txtAcesso.Text;

                    if (Convert.ToInt32(txtAcesso.Text) <= 9999)
                    {//e secretaria
                        Session["tipo"] = "Sec";
                    }
                    else if (Convert.ToInt32(txtAcesso.Text) >= 10000 && Convert.ToInt32(txtAcesso.Text) <= 19999)
                    {//e medico
                        Session["tipo"] = "Med";
                    }
                    else
                    {//e paciente
                        Session["tipo"] = "Pac";
                    }
                    Response.Redirect("indexGeral.aspx");
                }
                acessoBD.FecharConexao();
            }
        }
    }
}