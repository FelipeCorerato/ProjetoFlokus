<%@ Page Title="" Language="C#" MasterPageFile="~/siples.Master" AutoEventWireup="true" CodeBehind="sec_med.aspx.cs" Inherits="ProjetoPratica.sec_med1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="estilo.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="Content/jquery-3.3.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Adicionar" />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="crm" DataSourceID="SDS_teste" AllowPaging="True" AllowSorting="True" Height="282px" Width="1175px">
        <Columns>
            <asp:BoundField DataField="acesso" HeaderText="Acesso" SortExpression="acesso" />
            <asp:BoundField DataField="crm" HeaderText="CRM" SortExpression="crm" ReadOnly="True" />
            <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
            <asp:BoundField DataField="especialidade" HeaderText="Especialidade" SortExpression="especialidade" ReadOnly="True" />
            <asp:BoundField DataField="nascimento" HeaderText="Nascimento" SortExpression="nascimento" />
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
            <asp:BoundField DataField="telefone" HeaderText="Telefone" SortExpression="telefone" />
            <asp:BoundField DataField="celular" HeaderText="Celular" SortExpression="celular" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SDS_teste" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBD %>" SelectCommand="SELECT [crm], [nome], [nascimento], [email], [telefone], [celular], [acesso],
        STUFF((
        SELECT ', ' + [nome] 
        FROM Especialidade
        WHERE (cod = Medico.especialidade) 
        FOR XML PATH(''),TYPE).value('(./text())[1]','VARCHAR(MAX)')
        ,1,2,'') AS especialidade 
        FROM [Medico]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SDS_Medico" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBD %>" DeleteCommand="DELETE FROM [Medico] WHERE [crm] = @crm" InsertCommand="INSERT INTO [Medico] ([crm], [nome], [nascimento], [email], [telefone], [celular], [especialidade], [acesso]) VALUES (@crm, @nome, @nascimento, @email, @telefone, @celular, @especialidade, @acesso)" SelectCommand="SELECT [crm], [nome], [nascimento], [email], [telefone], [celular], [especialidade], [acesso] FROM [Medico]" UpdateCommand="UPDATE [Medico] SET [nome] = @nome, [nascimento] = @nascimento, [email] = @email, [telefone] = @telefone, [celular] = @celular, [especialidade] = @especialidade, [acesso] = @acesso WHERE [crm] = @crm">
        <DeleteParameters>
            <asp:Parameter Name="crm" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="crm" Type="String" />
            <asp:Parameter Name="nome" Type="String" />
            <asp:Parameter DbType="Date" Name="nascimento" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="telefone" Type="String" />
            <asp:Parameter Name="celular" Type="String" />
            <asp:Parameter Name="especialidade" Type="Int32" />
            <asp:Parameter Name="acesso" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="nome" Type="String" />
            <asp:Parameter DbType="Date" Name="nascimento" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="telefone" Type="String" />
            <asp:Parameter Name="celular" Type="String" />
            <asp:Parameter Name="especialidade" Type="Int32" />
            <asp:Parameter Name="acesso" Type="String" />
            <asp:Parameter Name="crm" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
&nbsp;
</asp:Content>

