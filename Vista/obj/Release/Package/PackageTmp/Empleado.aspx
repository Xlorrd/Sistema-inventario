<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Empleado.aspx.cs" Inherits="Vista.Empleado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    
     <h2> <asp:Label ID="lbl_titulo" runat="server" Text=""></asp:Label>
            </h2>             
        
            <p>
                 <asp:TextBox class="form-control" ID="txt_buscar" runat="server"></asp:TextBox>
            </p>
            <p>
                <asp:Button ID="bt_buscar" class="btn btn-primary" runat="server" Text="Buscar" OnClick="bt_buscar_Click"  />
            </p>
            <p>
                <asp:GridView ID="grid_empleados" CssClass="table  table-sm table-bordered table-condensed table-responsive-sm table-hover " runat="server" OnSelectedIndexChanged="grid_empleados_SelectedIndexChanged" AllowPaging="True" OnPageIndexChanging="grid_empleados_PageIndexChanging1" OnSelectedIndexChanging="grid_empleados_SelectedIndexChanging">
                     <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="Primero" LastPageText="Último"/>
                               <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
                </asp:GridView> 

            </p>
            <p>
                <asp:Button class="btn btn-primary"  ID="btn_nuevo" runat="server" Text="Ingresar Nuevo" OnClick="btn_nuevo_Click" />
            </p>
   
      <asp:Label  ID="lbl_nombre" runat="server" Text="Nombres"></asp:Label>
      <asp:TextBox class="form-control" ID="txt_nombre" runat="server"></asp:TextBox>
      <asp:Label  ID="lbl_apellido" runat="server" Text="Apellidos"></asp:Label>
      <asp:TextBox class="form-control" ID="txt_apellido" runat="server"></asp:TextBox>       
      <asp:Label  ID="lbl_correo" runat="server" Text="Correo"></asp:Label>      
      <asp:TextBox class="form-control form-control-lg" ID="txt_correo" runat="server"></asp:TextBox>     
      <asp:Label  ID="lbl_departamento" runat="server" Text="Departamento"></asp:Label>      
      <asp:DropDownList class="form-control" ID="drop_departamento" runat="server"  OnSelectedIndexChanged="drop_departamento_SelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="desc_departamento" DataValueField="id_departamento">
      </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:inventario_activosConnectionString %>" SelectCommand="SELECT [id_departamento], [desc_departamento] FROM [tbl_departamento]"></asp:SqlDataSource>
      <asp:Label  ID="lbl_cedula" runat="server" Text="Cédula"></asp:Label>      
      <asp:TextBox class="form-control" ID="txt_cedula" runat="server"></asp:TextBox>

      <asp:Label  ID="lbl_contrasena" runat="server" Text="Contraseña"></asp:Label>      
      <asp:TextBox class="form-control" type="password" ID="txt_contrasena" runat="server" OnTextChanged="txt_contrasena_TextChanged"></asp:TextBox>
            <br />
      <%--<asp:RadioButton ID="RadioButton1" runat="server" />--%>

      <asp:Button class="btn btn-primary" ID="btn_guardar" runat="server" Text="Guardar" OnClick="btn_guardar_Click" />
      <asp:Button class="btn btn-primary" ID="btn_editar" runat="server" Text="Guardar" OnClick="btn_editar_Click"  />

            <br />

    </asp:Content>

