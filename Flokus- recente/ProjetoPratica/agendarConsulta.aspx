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
            <asp:TextBox ID="txb_cpf_sec" runat="server">cpf secretaria</asp:TextBox>
            <br />
            <br />
            <asp:TextBox ID="txb_cpf_pac" runat="server">cpf paciente</asp:TextBox>
            <br />
            <br />
            <asp:DropDownList ID="ddl_medicos" runat="server" DataSourceID="SqlDataSource1" DataTextField="nome" DataValueField="crm">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBD %>" SelectCommand="SELECT [crm], [nome] FROM [Medico]"></asp:SqlDataSource>
            <br />
            <br />
            <asp:TextBox ID="txb_horario" runat="server" TextMode="Time"></asp:TextBox>
            <br />
            <br />
        </div>
        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
        <br />
            <asp:Button ID="btnAgendar" runat="server" Text="Agendar" OnClick="btnAgendar_Click" />
    </form>
</body>
</html>
