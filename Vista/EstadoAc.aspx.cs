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
    public partial class EstadoAc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                form_estadoAC(1);
                listar_estadoAc();
            }
        }
        public void listar_estadoAc()
        {
            List<listar_estadoAcResult> lista = new List<listar_estadoAcResult>();
            lista = crud_tbl_estadoAc.Listar_estadoAc();
            if (lista!= null)
            {
                grid_estadoAc.DataSource = lista;
                grid_estadoAc.DataBind();
            }

        }
        public void insertar_estadoAc()
        {
            tbl_estadoAc obj_estado = new tbl_estadoAc();
            obj_estado.desc_estadoAc = txt_descripcion.Text;
            crud_tbl_estadoAc.Insertar_estadoAc(obj_estado);
        }

        public void editar_estadoAc()
        {
            tbl_estadoAc obj_estado = new tbl_estadoAc();
            obj_estado.desc_estadoAc = txt_descripcion.Text;
            int id_estadoAC =Convert.ToInt32(Session["id_estadoAc"]);
            crud_tbl_estadoAc.Editar_estadoAc(obj_estado, id_estadoAC);


        }

        public void buscar_estadoAc(string descripcion)
        {
            List<buscar_estadoAcResult> search_estado = new List<buscar_estadoAcResult>();
            search_estado = crud_tbl_estadoAc.Buscar_estadoAc(descripcion);
            if(search_estado != null)
            {
                grid_estadoAc.AutoGenerateSelectButton = true;
                grid_estadoAc.DataSource = search_estado;
                grid_estadoAc.DataBind();
            }

        }


        protected void bt_buscar_Click(object sender, EventArgs e)
        {
            buscar_estadoAc(txt_buscar.Text);
        }

        protected void grid_estadoAc_SelectedIndexChanged(object sender, EventArgs e)
        {
            form_estadoAC(3);
            int id = Convert.ToInt32(grid_estadoAc.SelectedRow.Cells[1].Text);
            txt_descripcion.Text = HttpUtility.HtmlDecode(grid_estadoAc.SelectedRow.Cells[2].Text);
            Session["id_estadoAc"] = id;

        

        }

        protected void btn_nuevo_Click(object sender, EventArgs e)
        {
            form_estadoAC(2);
        }

        protected void btn_guardar_Click(object sender, EventArgs e)
        {
            insertar_estadoAc();
            Response.Redirect("~/EstadoAc.aspx");
        }

        protected void btn_editar_Click(object sender, EventArgs e)
        {
            editar_estadoAc();
            Response.Redirect("~/EstadoAc.aspx");

        }

        public void form_estadoAC(int op)
        {
            switch (op)
            {
                case 1://LISTAR ESTADO ACTIVO
                    lbl_titulo.Text = "Lista estado activos ";
                    txt_buscar.Visible = true;
                    bt_buscar.Visible = true;
                    grid_estadoAc.Visible = true;
                    btn_nuevo.Visible = true;
                    txt_descripcion.Visible = false;
                    lbl_descripcion.Visible = false;                    
                    btn_editar.Visible = false;
                    btn_guardar.Visible = false;
                    break;
                case 2:
                    lbl_titulo.Text = "Insertar estado activos ";
                    txt_buscar.Visible = false;
                    bt_buscar.Visible = false;
                    grid_estadoAc.Visible = false;
                    btn_nuevo.Visible = false;
                    txt_descripcion.Visible = true;
                    lbl_descripcion.Visible = true;
                    btn_editar.Visible = false;
                    btn_guardar.Visible = true;
                    break;
                case 3:
                    lbl_titulo.Text = "Editar estado activos ";
                    txt_buscar.Visible = false;
                    bt_buscar.Visible = false;
                    grid_estadoAc.Visible = false;
                    btn_nuevo.Visible = false;
                    txt_descripcion.Visible = true;
                    lbl_descripcion.Visible = true;
                    btn_editar.Visible = true;
                    btn_guardar.Visible = false;
                    break;
            
            }
        }

        protected void grid_estadoAc_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grid_estadoAc.PageIndex = e.NewPageIndex;
            listar_estadoAc();
        }
    }
}