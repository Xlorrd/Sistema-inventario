<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Custodio.aspx.cs" Inherits="Presentacion.Custodio" %>
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
                  <asp:GridView ID="grid_custodio" CssClass="table  table-sm table-bordered table-condensed table-responsive-sm table-hover " runat="server" OnSelectedIndexChanged="grid_custodio_SelectedIndexChanged" AllowPaging="True" PageSize="15" OnPageIndexChanging="grid_custodio_PageIndexChanging"  >
                    <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="Primero" LastPageText="Último"/>
                    <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center"/>
                </asp:GridView>
            </p>
                                            

            <p>
                <asp:Button class="btn btn-primary"  ID="btn_nuevo" runat="server" Text="Ingresar Nuevo" OnClick="btn_nuevo_Click" />
            </p>
   
      <asp:Label  ID="lbl_activo" runat="server" Text=" N° Activo "></asp:Label>
      <br />
     <%--<asp:Button ID="btn_activoModal" type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg" runat="server" Text="Button" OnClick="btn_activoModal_Click" />--%>
     <%--<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">Large modal</button>--%>
    <asp:Button ID="btnMostrar" class="btn btn-link"  runat="server" Text="Seleccionar activo" OnClick="btnMostrar_Click" />

<div id="myModal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
          <asp:GridView ID="grid_activosDisponible" CssClass="table  table-sm table-bordered table-condensed table-responsive-sm table-hover " runat="server"  AllowPaging="True" OnPageIndexChanging="grid_activosDisponible_PageIndexChanging" OnSelectedIndexChanged="grid_activosDisponible_SelectedIndexChanged"   >
                    <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="Primero" LastPageText="Último"/>
                    <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center"/>
                </asp:GridView> 
          
                <asp:Button ID="btn_buscarModal"  class="btn btn-primary" runat="server" Text="Modal buscar" OnClick="btn_buscarModal_Click" />         
                <asp:TextBox class="form-control" ID="txt_buscarModal" runat="server"></asp:TextBox>    
    </div>
  </div>
</div>   
 
      <br />

           
   
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
 
      <asp:TextBox class="form-control" ID="txt_activo" runat="server"></asp:TextBox>
      <asp:Label  ID="lbl_empleado" runat="server" Text="Empleado"></asp:Label>
      <asp:TextBox class="form-control" ID="txt_empleado" runat="server"></asp:TextBox>       
      <asp:Label  ID="lbl_fechaEntrega" runat="server" Text="Fecha  entrega"></asp:Label>     
      <asp:TextBox class="form-control" TextMode="Date" ID="txt_fechaentrega" runat="server"></asp:TextBox>  
      <asp:Label  ID="lbl_fechaRecepcion" runat="server" Text="Fecha recepcion"></asp:Label>     
      <asp:TextBox class="form-control" TextMode="Date" ID="txt_fechaRecepcion" runat="server"></asp:TextBox>   
      <br />
      <asp:TextBox ID="txt_observacion" TextMode="multiline" Columns="50" Rows="5" runat="server" Width="434px" placeholder="Observación" />
 
      <asp:Button class="btn btn-primary" ID="btn_guardar" runat="server" Text="Guardar" OnClick="btn_guardar_Click" />
      <asp:Button class="btn btn-primary" ID="btn_editar" runat="server" Text="Guardar" OnClick="btn_editar_Click"  />

   

</asp:Content>
