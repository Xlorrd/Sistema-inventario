<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rol.aspx.cs" Inherits="Presentacion.Rol" %>
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
                <asp:GridView ID="grid_rol" CssClass="table  table-sm table-bordered table-condensed table-responsive-sm table-hover " runat="server" OnSelectedIndexChanged="grid_rol_SelectedIndexChanged" AllowPaging="True" OnPageIndexChanging="grid_rol_PageIndexChanging" >
                 <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="Primero" LastPageText="Último"/>
                               <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
                </asp:GridView>
            </p>
            <p>
                <asp:Button class="btn btn-primary"  ID="btn_nuevo" runat="server" Text="Ingresar Nuevo" OnClick="btn_nuevo_Click" />
            </p>
          <asp:Label  ID="lbl_descripcion" runat="server" Text="Descripción Rol"></asp:Label>
          <asp:TextBox class="form-control" ID="txt_descripcion" runat="server"></asp:TextBox>
        <asp:Label  ID="lbl_estado" runat="server" Text="Estado Rol"></asp:Label>
          <asp:TextBox class="form-control" ID="txt_estado" runat="server"></asp:TextBox>

    
      <asp:Button class="btn btn-primary" ID="btn_guardar" runat="server" Text="Guardar" OnClick="btn_guardar_Click" />
      <asp:Button class="btn btn-primary" ID="btn_editar" runat="server" Text="Guardar" OnClick="btn_editar_Click"  />

</asp:Content>
