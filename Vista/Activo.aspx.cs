using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controlador;
using Modelo;

namespace Vista
{
    public partial class Activo : System.Web.UI.Page
    {
        List<listar_activoResult> list_act = new List<listar_activoResult>();
        List<listar_marcaResult> list_marc = new List<listar_marcaResult>();
        List<listar_modeloResult> list_model = new List<listar_modeloResult>();
        List<listar_estadoAcResult> list_estAc = new List<listar_estadoAcResult>();
        List<buscaMasiva_activoResult> busqueda_act = new List<buscaMasiva_activoResult>();



        protected void Page_Load(object sender, EventArgs e)
        {
            /*Es una variable de tipo bool para identificar si la página ha sido cargada por primera vez o es una recarga. 
            Inicia en false, indicando que es la primera carga.*/
            if (!IsPostBack)
            {
                listar_activo();
                cargar_marca();
                cargar_modelo();
                cargar_estadoAc();
                cargar_estadoAc();
                cargar_estadoAc();
                form_activo(1);
            }
        }
        public void form_activo(int op)
        {
            switch (op)
            {
                case 1:
                    lbl_titulo.Text = "Lista de activos";
                    txt_act1.Visible = false;
                    lbl_act1.Visible = false;
                    txt_act2.Visible = false;
                    lbl_act2.Visible = false;
                    txt_tipoact.Visible = false;
                    lbl_tipoact.Visible = false;
                    lbl_marca.Visible = false;
                    drop_marca.Visible = false;
                    lbl_modelo.Visible = false;
                    drop_modelo.Visible = false;
                    lbl_serial.Visible = false;
                    txt_serial.Visible = false;
                    lbl_ubicacionact.Visible = false;
                    txt_ubicacionact.Visible = false;
                    lbl_estado.Visible = false;
                    drop_estadoact.Visible = false;
                    //lbl_observacion.Visible = false;
                    txt_observacion.Visible = false;
                    btn_guardar.Visible = false;
                    btn_editar.Visible = false;

                break;
                case 2:
                    lbl_titulo.Text = "Nuevo Activo";
                    txt_act1.Visible = true;
                    lbl_act1.Visible = true;
                    txt_act2.Visible = true;
                    lbl_act2.Visible = true;
                    txt_tipoact.Visible = true;
                    lbl_tipoact.Visible = true;
                    lbl_marca.Visible = true;
                    drop_marca.Visible = true;
                    lbl_modelo.Visible = true;
                    drop_modelo.Visible = true;
                    lbl_serial.Visible = true;
                    txt_serial.Visible = true;
                    lbl_ubicacionact.Visible = true;
                    txt_ubicacionact.Visible = true;
                    lbl_estado.Visible = true;
                    drop_estadoact.Visible = true;
                    //lbl_observacion.Visible = true;
                    txt_observacion.Visible = true;
                    btn_guardar.Visible = true;
                    btn_guardar.Visible = true;
                    grid_activo.Visible = false;
                    txt_buscar.Visible = false;
                    bt_buscar.Visible = false;
                    btn_nuevo.Visible = false;
                    break;
            }
        }
            
        public void listar_activo()
        {            
            list_act = Crud_tbl_activo.Listar_Activo();
            if (list_act != null)
            {

                grid_activo.DataSource = list_act;
                grid_activo.DataBind();
            }
        }
        private void prueba_obtener()
        {
            var marca = drop_marca.SelectedValue.ToString();
            txt_buscar.Text =Convert.ToString( marca);
        }
        private void cargar_marca()
        {

            list_marc = Crud_tbl_marca.Listar_Marca();
            list_marc.Insert(0, new listar_marcaResult() { desc_marca = "" });
            drop_marca.DataSource = list_marc;
            drop_marca.DataTextField = "desc_marca";
            drop_marca.DataValueField = "id_marca";
            drop_marca.DataBind();
        }
        private void cargar_modelo()
        {
            list_model = crud_tbl_modelo.Listar_Modelo();
            list_model.Insert(0, new listar_modeloResult() { desc_modelo = "" });
            drop_modelo.DataSource = list_model;
            drop_modelo.DataTextField = "desc_modelo";
            drop_modelo.DataValueField = "id_modelo";
            drop_modelo.DataBind();
        }

        private void cargar_estadoAc()
        {
            list_estAc = crud_tbl_estadoAc.Listar_estadoAc();
            list_estAc.Insert(0, new listar_estadoAcResult() { desc_estadoAc = "" });
            drop_estadoact.DataSource = list_estAc;
            drop_estadoact.DataTextField = "desc_estadoAc";
            drop_estadoact.DataValueField = "id_estadoAc";
            drop_estadoact.DataBind();
        }

        public void insertar_activo()
        {
            tbl_activo objeto = new tbl_activo();
            objeto.cod1_activo = txt_act1.Text;
            objeto.cod2_activo = txt_act2.Text;
            objeto.tipo_activo = txt_tipoact.Text;           
            objeto.id_marca = Convert.ToInt32(drop_marca.SelectedValue);
            objeto.id_modelo = Convert.ToInt32(drop_modelo.SelectedValue);
            objeto.serial_activo = txt_serial.Text;
            objeto.ubicacion_activo = txt_ubicacionact.Text;
            objeto.id_estadoAc =Convert.ToInt32(drop_estadoact.SelectedValue);
            objeto.observacion_activo = txt_observacion.Text;
            objeto.estado_uso =Convert.ToChar("0");
            Crud_tbl_activo.Insertar_Activo(objeto);            
    }

        public void buscar_tbl_activo(string descricion)
        {

            busqueda_act = Crud_tbl_activo.Buscar_Activo(descricion);
            if (busqueda_act != null)
            {
                //grid_activo.AutoGenerateSelectButton = true;
                grid_activo.DataSource = busqueda_act;
                grid_activo.DataBind();
            }
        }

        protected void grid_activo_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void bt_buscar_Click(object sender, EventArgs e)
        {
            buscar_tbl_activo(txt_buscar.Text);            
        }

        protected void btn_nuevo_Click(object sender, EventArgs e)
        {
            form_activo(2);
        }

        protected void btn_guardar_Click(object sender, EventArgs e)
        {
            insertar_activo();
            Response.Redirect("~/Activo.aspx");
        }

        protected void btn_editar_Click(object sender, EventArgs e)
        {

        }

        protected void grid_activo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grid_activo.PageIndex = e.NewPageIndex;
            listar_activo();
        }
    }
}