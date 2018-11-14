<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="agendarConsulta.aspx.cs" Inherits="ProjetoPratica.agendarConsulta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="estilo.css" rel="stylesheet" />
    <title></title>
    <link rel="stylesheet" href="Content/bootstrap.css"/>
    <script src="Content/bootstrap.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="background-color:#5b5b5b;">
            <center>
                <div style="width:38%; background-color:#ffffff;">
                    <br />
                    <div style="padding-left:3%;"><asp:Button ID="btnVoltar" runat="server" OnClick="btnVoltar_Click" Text="Cancelar e voltar" CausesValidation="False" CssClass="btn btn-danger float-left"/></div>

                    <br />

                    <br />




                    <br />
                    <br />
                    Secretaria:<br />
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="nome" DataValueField="Cpf"  Width="90%" EnableTheming="True">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBD %>" SelectCommand="SELECT [Cpf], [nome] FROM [Secretaria]"></asp:SqlDataSource>
                    <br />
                    <br />
                    <br />
                    Médico:<br />
                    <asp:DropDownList ID="ddl_medicos" runat="server"  Width="90%" DataSourceID="SqlDataSource1" DataTextField="nome" DataValueField="crm" OnSelectedIndexChanged="ddl_medicos_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBD %>" SelectCommand="SELECT [crm], [nome] FROM [Medico]"></asp:SqlDataSource>
                    <br />
                    Paciente:<br />
                    <asp:DropDownList ID="DropDownList2" runat="server"  Width="90%" DataSourceID="SqlDataSource3" DataTextField="nome" DataValueField="cpf">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBD %>" SelectCommand="SELECT [cpf], [nome] FROM [Paciente]"></asp:SqlDataSource>
                    <br />
                    <br />
                    <br />
                    Data:<br />
                    <asp:TextBox ID="txtData" runat="server" TextMode="Date" Width="90%"></asp:TextBox>
                    <br />
                    <br />
                    Horario:<br />
                    <asp:TextBox ID="txtHora" runat="server" TextMode="Time" Width="90%"></asp:TextBox>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnAgendar" runat="server" Text="Agendar" OnClick="btnAgendar_Click" CssClass="btn btn-success"/>
                    <br />
                    <br />
                </div>
            </center>
        </div>
    </form>
</body>
</html>
