<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sec_pac.aspx.cs" Inherits="ProjetoPratica.sec_pac" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="Content/bootstrap.css"/>
    <script src="Content/bootstrap.js"></script>
</head>
<body style="background-color:#5b5b5b">
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnVoltar" runat="server" OnClick="btnVoltar_Click1" Text="Voltar" class="btn btn-primary"/>
            <br />
            <br />
            <div class="table-responsive">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="cpf" DataSourceID="SqlDataSource1" CssClass="table table-hover table-dark">
                    <Columns>
                        <asp:BoundField DataField="cpf" HeaderText="cpf" ReadOnly="True" SortExpression="cpf" />
                        <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        <asp:BoundField DataField="nascimento" HeaderText="nascimento" SortExpression="nascimento" />
                        <asp:BoundField DataField="telefone" HeaderText="telefone" SortExpression="telefone" />
                        <asp:BoundField DataField="celular" HeaderText="celular" SortExpression="celular" />
                        <asp:BoundField DataField="acesso" HeaderText="acesso" SortExpression="acesso" />
                    </Columns>
                </asp:GridView>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBD %>" SelectCommand="SELECT [cpf], [nome], [email], [nascimento], [telefone], [celular], [acesso] FROM [Paciente]"></asp:SqlDataSource>
            <br />
            <asp:Button ID="btnAdicionar" runat="server" OnClick="btnAdicionar_Click1" Text="Adicionar" class="btn btn-primary"/>
        </div>
    </form>
</body>
</html>
