using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modelo;
using Controlador;

namespace Presentacion
{
    public partial class Custodio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                listar_custodio();
            }
        }

        public void listar_custodio()
        {
            List<listar_custodioResult> list_custodio = new List<listar_custodioResult>();

            list_custodio = Crud_tbl_custodio.Listar_Custodio();

            if (list_custodio != null)
            {
                grid_custodio.DataSource = list_custodio;
                grid_custodio.DataBind();
            }        
        }

        public void listar_activos()// Lista los activos disponibles con valo 0 en el grid view
        {
            List<Activos_disponiblesResult> lista = new List<Activos_disponiblesResult>();
            lista = Crud_tbl_activo.Activo_disponible();
            if (lista != null)
            {
                grid_activosDisponible.DataSource = lista;
                grid_activosDisponible.DataBind();

            }
            
        }


        public void insertar_custodio()
        {
            tbl_custodio obj_custodio = new tbl_custodio();
            obj_custodio.id_activo = Convert.ToInt16(txt_activo.Text);
            obj_custodio.id_empleado = Convert.ToInt16(txt_empleado.Text);
            obj_custodio.fecha_entrega = Convert.ToDateTime(txt_fechaentrega.Text);
            obj_custodio.observacion = txt_observacion.Text;
            Crud_tbl_custodio.Insertar_Custodio(obj_custodio);
        }

        public void buscar_activoDisponible(string descripcion)
        {
            List<buscar_AcDisponibleResult> lista = new List<buscar_AcDisponibleResult>();
            lista = Crud_tbl_activo.Buscar_ActivoDiponible(descripcion);

            grid_activosDisponible.AutoGenerateSelectButton = true;
            grid_activosDisponible.DataSource = lista;
            grid_activosDisponible.DataBind();

        }

        protected void bt_buscar_Click(object sender, EventArgs e)
        {

        }

        protected void btn_nuevo_Click(object sender, EventArgs e)
        {

        }

        protected void grid_custodio_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btn_guardar_Click(object sender, EventArgs e)
        {
            insertar_custodio();
        }

        protected void btn_editar_Click(object sender, EventArgs e)
        {

        }

        protected void grid_custodio_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            grid_custodio.PageIndex = e.NewPageIndex;
            listar_custodio();
        }

        protected void btn_buscarModal_Click(object sender, EventArgs e)
        {
            
            buscar_activoDisponible(txt_buscarModal.Text);
            activar_modal();

        }

        protected void btn_activoModal_Click(object sender, EventArgs e)
        {
        }
    
      
        protected void btnMostrar_Click(object sender, EventArgs e)
        {
            activar_modal();
            buscar_activoDisponible(""); 

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
      
        protected void grid_activosDisponible_SelectedIndexChanged(object sender, EventArgs e)
        {
            
                if (grid_activosDisponible.SelectedRow != null)
                {
                    string guardado = grid_activosDisponible.SelectedRow.Cells[4].Text;
                    //grid_activosDisponible.AutoGenerateSelectButton = false;
                    lbl_activo.Text = guardado;
                   
            }

    //Session["dec_activo"] = (HttpUtility.HtmlDecode(grid_activosDisponible.SelectedRow.Cells[4].Text));


    //if (lbl_activo.Text !=Convert.ToString( Session["dec_activo"]))
    //{
    //    Session["dec_activo"] = ("Activo:  " + HttpUtility.HtmlDecode(grid_activosDisponible.SelectedRow.Cells[4].Text));

    //    lbl_activo.Text = Convert.ToString(Session["dec_activo"]);
    //}
    //else
    //{                
    //    listar_activos();
    //    activar_modal();
    //    Session["dec_activo"] = null;
    //}
    //grid_activosDisponible.SelectedIndexChanged += grid_activosDisponible_SelectedIndexChanged;

    //txt_activo.Enabled = false;
    
        }


        protected void grid_activosDisponible_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grid_activosDisponible.PageIndex = e.NewPageIndex;            
            
            //listar_activos();

            buscar_activoDisponible("");

            activar_modal();
        }

        public void activar_modal()
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);

            //listar_activos();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            lbl_activo.Text = null;
            grid_activosDisponible.Columns.Clear();  
        }
    }
}