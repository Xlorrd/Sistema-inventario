using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controlador;
using Modelo;

namespace Presentacion
{
    public partial class Modelo : System.Web.UI.Page
    {
          List<listar_modeloResult> list_model = new List<listar_modeloResult>();
        List<buscar_modeloResult> search_model = new List<buscar_modeloResult>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack){
                listar_modelo();
                form_modelo(1);
            }
        }
        public void listar_modelo()
        {
            // de mi objeto lista modelo llamo a la funcion listar modelo 
            list_model = crud_tbl_modelo.Listar_Modelo();
            // si lista modelo es diferente a null hacer
            if (list_model != null)
            {
                //cargar la data y mostrarla en el grid view
                grid_modelo.DataSource = list_model;
                grid_modelo.DataBind();
            }
        }

        public void insertar_modelo()
        {
            tbl_modelo objeto_modelo = new tbl_modelo();
            objeto_modelo.desc_modelo = txt_descripcion.Text;
            crud_tbl_modelo.Insertar_Modelo(objeto_modelo);

        }
        public void editar_modelo()
        {
            tbl_modelo data = new tbl_modelo();
            data.desc_modelo = txt_descripcion.Text;
            int id_modelo = Convert.ToInt32(Session["id_modelo"]);
            crud_tbl_modelo.Editar_Modelo(data, id_modelo);

        }
        public void buscar_modelo(string descripcion)
        {
            search_model = crud_tbl_modelo.Buscar_Modelo(descripcion);
            if (search_model !=null)
            {
                grid_modelo.AutoGenerateSelectButton = true;
                grid_modelo.DataSource = search_model;
                grid_modelo.DataBind();
            }
        }

        public void form_modelo(int op)
        {
            switch (op)
            {
                case 1:

                    lbl_titulo.Text = "Lista Modelo";
                    txt_buscar.Visible = true;
                    bt_buscar.Visible = true;
                    grid_modelo.Visible = true;
                    btn_nuevo.Visible = true;
                    lbl_descripcion.Visible = false;
                    txt_descripcion.Visible = false;
                    btn_guardar.Visible = false;
                    btn_editar.Visible = false;

                    break;

                case 2:
                    lbl_titulo.Text = "Añadir Modelo";
                    txt_buscar.Visible = false;
                    bt_buscar.Visible = false;
                    grid_modelo.Visible = false;
                    btn_nuevo.Visible = false;
                    lbl_descripcion.Visible = true;
                    txt_descripcion.Visible = true;
                    btn_guardar.Visible = true;
                    btn_editar.Visible = false;

                    break;

                case 3:
                    lbl_titulo.Text = "Editar Modelo";
                    txt_buscar.Visible = false;
                    bt_buscar.Visible = false;
                    grid_modelo.Visible = false;
                    btn_nuevo.Visible = false;
                    lbl_descripcion.Visible = true;
                    txt_descripcion.Visible = true;
                    btn_guardar.Visible = false;
                    btn_editar.Visible = true;
                    break;
            }
        }


        protected void bt_buscar_Click(object sender, EventArgs e)
        {
            form_modelo(1);
            buscar_modelo(txt_buscar.Text);
        }

        protected void grid_modelo_SelectedIndexChanged(object sender, EventArgs e)
        {
            form_modelo(3);
            txt_descripcion.Text = HttpUtility.HtmlDecode(grid_modelo.SelectedRow.Cells[2].Text);
            int id = Convert.ToInt32(grid_modelo.SelectedRow.Cells[1].Text);
            Session["id_modelo"] = id;
        }

        protected void btn_nuevo_Click(object sender, EventArgs e)
        {
            form_modelo(2);
        }

        protected void btn_guardar_Click(object sender, EventArgs e)
        {
            insertar_modelo();
            Response.Redirect("~/Modelo.aspx");
        }

        protected void btn_editar_Click(object sender, EventArgs e)
        {
            editar_modelo();
            Response.Redirect("~/Modelo.aspx");
        }

        protected void grid_modelo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grid_modelo.PageIndex = e.NewPageIndex;
            listar_modelo();
            
        }
    }
}