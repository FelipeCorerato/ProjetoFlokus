<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sec_pac.aspx.cs" Inherits="ProjetoPratica.sec_pac" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnVoltar" runat="server" OnClick="btnVoltar_Click" Text="Voltar" />
            <asp:Button ID="btnAdicionar" runat="server" OnClick="btnAdicionar_Click" Text="Adicionar" />
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="cpf" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="cpf" HeaderText="cpf" ReadOnly="True" SortExpression="cpf" />
                <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
                <asp:BoundField DataField="nascimento" HeaderText="nascimento" SortExpression="nascimento" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="telefone" HeaderText="telefone" SortExpression="telefone" />
                <asp:BoundField DataField="celular" HeaderText="celular" SortExpression="celular" />
                <asp:BoundField DataField="acesso" HeaderText="acesso" SortExpression="acesso" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBD %>" SelectCommand="SELECT [cpf], [nome], [nascimento], [email], [telefone], [celular], [acesso] FROM [Paciente]"></asp:SqlDataSource>
    </form>
</body>
</html>
