<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Consultas.aspx.cs" Inherits="ProjetoPratica.Consultas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Listar consultas
            
            

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="horario" HeaderText="horario" SortExpression="horario" />
                    <asp:BoundField DataField="cpf_secretaria" HeaderText="Secretaria" SortExpression="cpf_secretaria" />
                    <asp:BoundField DataField="cpf_paciente" HeaderText="Paciente" SortExpression="cpf_paciente" />
                    <asp:BoundField DataField="crm" HeaderText="Médico" SortExpression="crm" />
                    <asp:BoundField DataField="agenda" HeaderText="agenda" SortExpression="agenda" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBD %>" SelectCommand="SELECT [horario], [cpf_secretaria], [cpf_paciente], [crm], [agenda] FROM [Consulta]"></asp:SqlDataSource>
            
            

        </div>
        <p>
            <asp:Button ID="btnEnviar" runat="server" OnClick="btnEnviar_Click" Text="Enviar" />
            <asp:Button ID="btnAgendar" runat="server" OnClick="btnAgendar_Click" Text="Agendar Consulta" />
            <asp:Button ID="btnVoltar" runat="server" OnClick="btnVoltar_Click" Text="Voltar" />
        </p>
    </form>
</body>
</html>
