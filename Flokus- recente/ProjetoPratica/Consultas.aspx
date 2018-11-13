<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Consultas.aspx.cs" Inherits="ProjetoPratica.Consultas" %>

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
        <asp:Button ID="btnVoltar" runat="server" OnClick="btnVoltar_Click" Text="Voltar" class="btn btn-primary"/>
        <br />
        <br />
        <div>
            <div class="table-responsive">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table table-hover table-dark">
                    <Columns>
                        <asp:BoundField DataField="codConsulta" HeaderText="codConsulta" SortExpression="codConsulta" />
                        <asp:BoundField DataField="horario" HeaderText="horario" SortExpression="horario" />
                        <asp:BoundField DataField="cpf_secretaria" HeaderText="cpf_secretaria" SortExpression="cpf_secretaria" />
                        <asp:BoundField DataField="cpf_paciente" HeaderText="cpf_paciente" SortExpression="cpf_paciente" />
                        <asp:BoundField DataField="crm" HeaderText="crm" SortExpression="crm" />
                        <asp:BoundField DataField="agenda" HeaderText="agenda" SortExpression="agenda" />
                        <asp:ButtonField ButtonType="Button" HeaderText="enviar e-mail" Text="Enviar" ControlStyle-CssClass="btn btn-primary">
                        <ControlStyle CssClass="btn btn-primary"></ControlStyle>
                        </asp:ButtonField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBD %>" SelectCommand="SELECT [codConsulta], [horario], [cpf_secretaria], [cpf_paciente], [crm], [agenda] FROM [Consulta]"></asp:SqlDataSource>
            </div>
        </div>
        <asp:Button ID="btnAgendar" runat="server" OnClick="btnAgendar_Click" Text="Agendar Consulta" class="btn btn-primary"/>
    </form>
</body>
</html>
