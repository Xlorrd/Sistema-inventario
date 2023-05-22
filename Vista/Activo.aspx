<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Activo.aspx.cs" Inherits="Vista.Activo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2> <asp:Label ID="lbl_titulo" runat="server" Text=""></asp:Label>
            </h2> 
            <p>
                 <asp:TextBox class="form-control" ID="txt_buscar" runat="server"></asp:TextBox>
            </p>
            <p>
                <asp:Button ID="bt_buscar" class="btn btn-primary" runat="server" Text="Buscar" OnClick="bt_buscar_Click"  />
                <asp:Button ID="btn_listar" class="btn btn-primary" runat="server" Text="TODOS LOS DATOS" OnClick="btn_listar_Click"  />

            </p>
            <p>
                <asp:GridView ID="grid_activo" CssClass="table  table-sm table-bordered table-condensed table-responsive-sm table-hover " runat="server" OnSelectedIndexChanged="grid_activo_SelectedIndexChanged" AllowPaging="True" OnPageIndexChanging="grid_activo_PageIndexChanging">
                <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="Primero" LastPageText="Último"/>
                               <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />

                    </asp:GridView>
            </p>
            <p>
                <asp:Button class="btn btn-primary"  ID="btn_nuevo" runat="server" Text="Ingresar Nuevo" OnClick="btn_nuevo_Click" />
            </p>
   
      <asp:Label  ID="lbl_act1" runat="server" Text="Activo #1"></asp:Label>
      <asp:TextBox class="form-control" ID="txt_act1" runat="server"></asp:TextBox>
      <asp:Label  ID="lbl_act2" runat="server" Text="Activo #2"></asp:Label>
      <asp:TextBox class="form-control" ID="txt_act2" runat="server"></asp:TextBox>       
      <asp:Label  ID="lbl_tipoact" runat="server" Text="Tipo"></asp:Label>      
      <asp:TextBox class="form-control form-control-lg" ID="txt_tipoact" runat="server"></asp:TextBox>     
      <asp:Label  ID="lbl_marca" runat="server" Text="Marca"></asp:Label>   
      <asp:DropDownList class="form-control" ID="drop_marca" runat="server"></asp:DropDownList>      
      <asp:Label  ID="lbl_modelo" runat="server" Text="Modelo"></asp:Label>
      <asp:DropDownList class="form-control" ID="drop_modelo" runat="server"></asp:DropDownList>      
      <asp:Label  ID="lbl_serial" runat="server" Text="Serial"></asp:Label>      
      <asp:TextBox class="form-control" ID="txt_serial" runat="server" ></asp:TextBox>
      <asp:Label  ID="lbl_ubicacionact" runat="server" Text="Ubicación"></asp:Label>      
      <asp:TextBox class="form-control" ID="txt_ubicacionact" runat="server" ></asp:TextBox> 
      <asp:Label  ID="lbl_estado" runat="server" Text="Estado del activo"></asp:Label>    

      <asp:DropDownList class="form-control" ID="drop_estadoact" runat="server"></asp:DropDownList>      
      <%--<br />--%>
      <%--<asp:Label  ID="lbl_observacion" runat="server" Text="Observación"></asp:Label>--%> 
      <%--<br />--%>
     <asp:TextBox ID="txt_observacion" TextMode="multiline" Columns="50" Rows="5" runat="server" Width="434px" placeholder="Detalle" />
      <%--<br />--%>   

      <asp:Button class="btn btn-primary" ID="btn_guardar" runat="server" Text="Guardar" OnClick="btn_guardar_Click" />
      <asp:Button class="btn btn-primary" ID="btn_editar" runat="server" Text="Guardar" OnClick="btn_editar_Click"  />
                <%--<br />--%>
</asp:Content>
