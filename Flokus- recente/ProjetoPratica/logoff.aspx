<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logoff.aspx.cs" Inherits="ProjetoPratica.logoff" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Deslogando...</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%
                Session["Usuario"] = null;
                Session["tipo"] = null;
                Session["Erro"]    = null;


                Response.Redirect("indexGeral.aspx");
            %>
        </div>
    </form>
</body>
</html>
