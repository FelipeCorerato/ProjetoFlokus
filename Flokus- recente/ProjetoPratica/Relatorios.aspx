<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Relatorios.aspx.cs" Inherits="ProjetoPratica.Relatorios" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

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
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSourceConsultasPorMedico" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBD %>" SelectCommand="SELECT m.nome, count(c.codConsulta) as consultas FROM medico m, consulta c WHERE m.crm = c.crm AND MONTH(GETDATE()) = MONTH(c.horario) GROUP BY m.nome
"></asp:SqlDataSource>
            <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSourceConsultasPorMedico">
                <series>
                    <asp:Series Name="Series1" XValueMember="nome" YValueMembers="consultas">
                    </asp:Series>
                </series>
                <chartareas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </chartareas>
            </asp:Chart>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            <br />
            <asp:Chart ID="Chart2" runat="server">
                <series>
                    <asp:Series Name="Series1" ChartType="Pie">
                    </asp:Series>
                </series>
                <chartareas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </chartareas>
            </asp:Chart>
            <br />
            <asp:SqlDataSource ID="SqlDataSourcePacientePorMedico" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBD %>" SelectCommand="SELECT m.nome, count(distinct c.cpf_paciente) as pacientes FROM medico m, consulta c, paciente p WHERE 
m.crm = c.crm GROUP BY m.nome

"></asp:SqlDataSource>
            <br />
            <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSourcePacientePorMedico">
                <series>
                    <asp:Series Name="Series1" XValueMember="nome" YValueMembers="pacientes" ChartType="Bar">
                    </asp:Series>
                </series>
                <chartareas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </chartareas>
            </asp:Chart>
            <br />
            <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
            <asp:Chart ID="Chart4" runat="server">
                <series>
                    <asp:Series Name="Series1">
                    </asp:Series>
                </series>
                <chartareas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </chartareas>
            </asp:Chart>
            <br />
        </div>
    </form>
</body>
</html>
