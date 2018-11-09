<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sec_med_add.aspx.cs" Inherits="ProjetoPratica.sec_med_add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:Button ID="btnCancelar" runat="server" OnClick="btnCancelar_Click" Text="Cancelar e Voltar" CausesValidation="False" />
            <br />
            <asp:Label ID="Label1" runat="server" Text="-"></asp:Label>
            <br />
            &quot;Os campos com * são obrigatórios&quot;<br />
            <br />
            *Nome:<br />
            <asp:TextBox ID="txtNome" runat="server" Width="248px" MaxLength="50"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtNome" ErrorMessage="Nome Obrigatório" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            *CRM:<br />
            <asp:TextBox ID="txtCRM" runat="server" Width="245px" MaxLength="10"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCRM" ErrorMessage="CRM Obrigatório" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            *e-mail:<br />
            <asp:TextBox ID="txtEmail" runat="server" Width="245px" MaxLength="50" TextMode="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail" ErrorMessage="E-mail Obrigatório" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            *Data de Nascimento:<br />
            <asp:TextBox ID="TextBox1" runat="server" TextMode="Date"></asp:TextBox>
            <br />
            *Especialidade:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            (Novas Especialidades podem ser registradas na aba de &quot;Especialidades&quot; da aba Anterior)<br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="dpdEspec" ErrorMessage="Especialidade Obrigatória" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:DropDownList ID="dpdEspec" runat="server" DataSourceID="SDS_Espe" DataTextField="nome" DataValueField="cod" Width="166px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SDS_Espe" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBD %>" DeleteCommand="DELETE FROM [Especialidade] WHERE [cod] = @cod" InsertCommand="INSERT INTO [Especialidade] ([nome]) VALUES (@nome)" SelectCommand="SELECT [nome], [cod] FROM [Especialidade]" UpdateCommand="UPDATE [Especialidade] SET [nome] = @nome WHERE [cod] = @cod">
                <DeleteParameters>
                    <asp:Parameter Name="cod" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="nome" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nome" Type="String" />
                    <asp:Parameter Name="cod" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            Telefone:<br />
            <asp:TextBox ID="txtTelefone" runat="server" Width="157px" MaxLength="15" TextMode="Phone"></asp:TextBox>
            <br />
            Celular<br />
            <asp:TextBox ID="txtCelular" runat="server" Width="155px" MaxLength="15" TextMode="Phone"></asp:TextBox>
            <br />
            <br />
            *Acesso:<br />
            <asp:TextBox ID="txtAcesso" runat="server" MaxLength="5" TextMode="Number"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtEmail" ErrorMessage="Acesso Obrigatório" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            *Senha<br />
            <asp:TextBox ID="txtSenha" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSenha" ErrorMessage="Senha Obrigatória" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            *Confirmar Senha<br />
            <asp:TextBox ID="txtConfSenha" runat="server" TextMode="Password"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtConfSenha" ControlToValidate="txtSenha" ErrorMessage="Senhas não Conferem" Font-Bold="True" Font-Italic="False" Font-Names="Book Antiqua" ForeColor="Red"></asp:CompareValidator>
            <br />
            <asp:Button ID="btnInserir" runat="server" OnClick="btnInserir_Click" Text="Inserir" />
        </div>
    </form>
</body>
</html>
