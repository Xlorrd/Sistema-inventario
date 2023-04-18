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
    public partial class Rol : System.Web.UI.Page
    {
        List<listar_rolResult> lista_rol = new List<listar_rolResult>();
        List<buscar_rolResult> search_rol = new List<buscar_rolResult>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                form_rol(1);
                listar_rol();
             
            }
        }

   
        public void listar_rol()
        {
            lista_rol = Crud_tbl_rol.Listar_Rol();
            if(lista_rol != null)
            {
                grid_rol.DataSource = lista_rol;
                grid_rol.DataBind();
            }
        }

        public void buscar_rol(string descripcion)
        {
            search_rol = Crud_tbl_rol.Buscar_Rol(descripcion);
            if (search_rol != null)
            {
                grid_rol.AutoGenerateSelectButton = true;
                grid_rol.DataSource = search_rol;
                grid_rol.DataBind();
            }

        }

        public void insertar_rol()
        {
            tbl_rol obj_rol = new tbl_rol();
            obj_rol.descripcion_rol = txt_descripcion.Text;
            obj_rol.estado_rol =Convert.ToChar(txt_estado.Text);
            Crud_tbl_rol.Insertar_Rol(obj_rol);

        }

        public void editar_rol()
        {
            tbl_rol data = new tbl_rol();
            data.descripcion_rol = txt_descripcion.Text;
            data.estado_rol = Convert.ToChar(txt_estado.Text);
            int id_rol = Convert.ToInt32(Session["id_rol"]);
            Crud_tbl_rol.Editar_Rol(data, id_rol);
        }
        protected void bt_buscar_Click(object sender, EventArgs e)
        {
            buscar_rol(txt_buscar.Text);
        }

        protected void grid_rol_SelectedIndexChanged(object sender, EventArgs e)
        {
            form_rol(3);
            int id = Convert.ToInt32(grid_rol.SelectedRow.Cells[1].Text);
            txt_descripcion.Text = HttpUtility.HtmlDecode(grid_rol.SelectedRow.Cells[2].Text);
            txt_estado.Text = HttpUtility.HtmlDecode(grid_rol.SelectedRow.Cells[3].Text);

            Session["id_rol"] = id;

        }

        protected void btn_nuevo_Click(object sender, EventArgs e)
        {
            form_rol(2);
        }

        protected void btn_guardar_Click(object sender, EventArgs e)
        {
            insertar_rol();
            Response.Redirect("~/Rol.aspx");

        }

        protected void btn_editar_Click(object sender, EventArgs e)
        {
            editar_rol();

            Response.Redirect("~/Rol.aspx");
        }

        public void form_rol(int op)
        {
            switch (op)
            {
                case 1:
                    lbl_titulo.Text = "Lista roles sistema";
                    txt_buscar.Visible = true;
                    bt_buscar.Visible = true;
                    grid_rol.Visible = true;
                    btn_nuevo.Visible = true;
                    txt_descripcion.Visible = false;
                    lbl_descripcion.Visible = false;
                    txt_estado.Visible = false;
                    lbl_estado.Visible = false;
                    btn_editar.Visible = false;
                    btn_guardar.Visible = false;

                    break;
                case 2:
                    lbl_titulo.Text = "Insertar Rol";
                    txt_buscar.Visible = false;
                    bt_buscar.Visible = false;
                    grid_rol.Visible = false;
                    btn_nuevo.Visible = false;
                    txt_descripcion.Visible = true;
                    lbl_descripcion.Visible = true;
                    txt_estado.Visible = true;
                    lbl_estado.Visible = true;
                    btn_editar.Visible = false;
                    btn_guardar.Visible = true;

                    break;
                case 3:
                    lbl_titulo.Text = "Editar Rol";
                    txt_buscar.Visible = false;
                    bt_buscar.Visible = false;
                    grid_rol.Visible = false;
                    btn_nuevo.Visible = false;
                    txt_descripcion.Visible = true;
                    lbl_descripcion.Visible = true;
                    txt_estado.Visible = true;
                    lbl_estado.Visible = true;
                    btn_editar.Visible = true;
                    btn_guardar.Visible = false;
                    break;
            }

        }

        protected void grid_rol_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grid_rol.PageIndex = e.NewPageIndex;
            listar_rol();

        }
    }
}