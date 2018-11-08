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
            <asp:Button ID="btnVoltar" runat="server" OnClick="btnVoltar_Click" Text="Voltar" />
            <asp:Button ID="btnAgendar" runat="server" Text="Agendar" OnClick="btnAgendar_Click" />
        </div>
    </form>
</body>
</html>
