<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="agendarConsulta.aspx.cs" Inherits="ProjetoPratica.agendarConsulta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnVoltar" runat="server" OnClick="btnVoltar_Click" Text="Cancelar e voltar" />
            <br />
            <br />
            Secretaria:<br />
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="nome" DataValueField="Cpf">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBD %>" SelectCommand="SELECT [Cpf], [nome] FROM [Secretaria]"></asp:SqlDataSource>
            <br />
            Médico:<br />
            <asp:DropDownList ID="ddl_medicos" runat="server" DataSourceID="SqlDataSource1" DataTextField="nome" DataValueField="crm" OnSelectedIndexChanged="ddl_medicos_SelectedIndexChanged">
            </asp:DropDownList>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBD %>" SelectCommand="SELECT [crm], [nome] FROM [Medico]"></asp:SqlDataSource>
            <br />
            <br />
            Paciente:<br />
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="nome" DataValueField="cpf">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBD %>" SelectCommand="SELECT [cpf], [nome] FROM [Paciente]"></asp:SqlDataSource>
            <br />
            <br />
            Data:<br />
            <asp:TextBox ID="txtData" runat="server" TextMode="Date"></asp:TextBox>
            <br />
            <br />
            Horario:<br />
            <asp:TextBox ID="txtHora" runat="server" TextMode="Time"></asp:TextBox>
            <br />
        </div>
        <br />
            <asp:Button ID="btnAgendar" runat="server" Text="Agendar" OnClick="btnAgendar_Click" />
    </form>
</body>
</html>
