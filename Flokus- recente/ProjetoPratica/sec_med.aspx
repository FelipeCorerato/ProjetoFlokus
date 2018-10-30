<%@ Page Title="" Language="C#" MasterPageFile="~/siples.Master" AutoEventWireup="true" CodeBehind="sec_med.aspx.cs" Inherits="ProjetoPratica.sec_med1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="estilo.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="Content/jquery-3.3.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <div class="container">
  <h2>Modal Example</h2>
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <div>
            <br />
            &quot;Os campos com * são obrigatórios&quot;<br />
            <br />
            *Nome:<br />
            <asp:TextBox ID="txtNome" runat="server" Width="248px" MaxLength="50"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtNome" ErrorMessage="Nome Obrigatório" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            *CRM:<br />
            <asp:TextBox ID="txtCRM" runat="server" Width="245px" MaxLength="10"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCRM" ErrorMessage="CRM Obrigatório" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            *e-mail:<br />
            <asp:TextBox ID="txtEmail" runat="server" Width="245px" MaxLength="50" TextMode="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail" ErrorMessage="E-mail Obrigatório" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            *Data de Nascimento:<br />
            <asp:Calendar ID="cldNasc" runat="server"></asp:Calendar>
            <br />
            *Especialidade:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            (Novas Especialidades podem ser registradas na aba de &quot;Especialidades&quot; da aba Anterior)<br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="dpdEspec" ErrorMessage="Especialidade Obrigatória" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:DropDownList ID="dpdEspec" runat="server" DataSourceID="SDS_Espe" DataTextField="nome" DataValueField="cod" Width="166px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SDS_Espe" runat="server" ConnectionString="<%$ ConnectionStrings:conexaoBD %>" DeleteCommand="DELETE FROM [Especialidade] WHERE [cod] = @cod" InsertCommand="INSERT INTO [Especialidade] ([nome]) VALUES (@nome)" SelectCommand="SELECT [nome], [cod] FROM [Especialidade]" UpdateCommand="UPDATE [Especialidade] SET [nome] = @nome WHERE [cod] = @cod">
                <DeleteParameters>
                    <asp:Parameter Name="cod" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="nome" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nome" Type="String" />
                    <asp:Parameter Name="cod" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            Telefone:<br />
            <asp:TextBox ID="txtTelefone" runat="server" Width="157px" MaxLength="15" TextMode="Phone"></asp:TextBox>
            <br />
            Celular<br />
            <asp:TextBox ID="txtCelular" runat="server" Width="155px" MaxLength="15" TextMode="Phone"></asp:TextBox>
            <br />
            <br />
            *Acesso:<br />
            <asp:TextBox ID="txtAcesso" runat="server" MaxLength="5" TextMode="Number"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtEmail" ErrorMessage="Acesso Obrigatório" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            *Senha<br />
            <asp:TextBox ID="txtSenha" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSenha" ErrorMessage="Senha Obrigatória" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            *Confirmar Senha<br />
            <asp:TextBox ID="txtConfSenha" runat="server" TextMode="Password"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtConfSenha" ControlToValidate="txtSenha" ErrorMessage="Senhas não Conferem" Font-Bold="True" Font-Italic="False" Font-Names="Book Antiqua" ForeColor="Red"></asp:CompareValidator>
            <br />
        </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>
    <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Adicionar" />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="crm" DataSourceID="SDS_teste" GridLines="None" AllowPaging="True" AllowSorting="True" Height="282px" Width="1175px">
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
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />
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
