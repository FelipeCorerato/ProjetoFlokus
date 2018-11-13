<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Consultas.aspx.cs" Inherits="ProjetoPratica.Consultas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="codConsulta" HeaderText="codConsulta" SortExpression="codConsulta" />
                    <asp:BoundField DataField="horario" HeaderText="horario" SortExpression="horario" />
                    <asp:BoundField DataField="cpf_secretaria" HeaderText="cpf_secretaria" SortExpression="cpf_secretaria" />
                    <asp:BoundField DataField="cpf_paciente" HeaderText="cpf_paciente" SortExpression="cpf_paciente" />
                    <asp:BoundField DataField="crm" HeaderText="crm" SortExpression="crm" />
                    <asp:BoundField DataField="agenda" HeaderText="agenda" SortExpression="agenda" />
                    <asp:ButtonField ButtonType="Button" HeaderText="enviar e-mail" Text="Botão" ControlStyle-CssClass="btn btn-primary"/>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBD %>" SelectCommand="SELECT [codConsulta], [horario], [cpf_secretaria], [cpf_paciente], [crm], [agenda] FROM [Consulta]"></asp:SqlDataSource>
            
            

        </div>
        <p>
            <asp:Button ID="btnEnviar" runat="server" OnClick="btnEnviar_Click" Text="Enviar" class="btn btn-primary"/>
            <asp:Button ID="btnAgendar" runat="server" OnClick="btnAgendar_Click" Text="Agendar Consulta" class="btn btn-primary"/>
            <asp:Button ID="btnVoltar" runat="server" OnClick="btnVoltar_Click" Text="Voltar" class="btn btn-primary"/>
        </p>
    </form>
</body>
</html>
