<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="antigo.aspx.cs" Inherits="ProjetoPratica.sec_med" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="crm" DataSourceID="SDS_Medico">
                <Columns>
                    <asp:BoundField DataField="crm" HeaderText="crm" ReadOnly="True" SortExpression="crm" />
                    <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
                    <asp:BoundField DataField="nascimento" HeaderText="nascimento" SortExpression="nascimento" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:BoundField DataField="telefone" HeaderText="telefone" SortExpression="telefone" />
                    <asp:BoundField DataField="celular" HeaderText="celular" SortExpression="celular" />
                    <asp:BoundField DataField="especialidade" HeaderText="especialidade" SortExpression="especialidade" />
                    <asp:BoundField DataField="acesso" HeaderText="acesso" SortExpression="acesso" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SDS_Medico" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBD %>" SelectCommand="SELECT * FROM [Medico]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
