using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controlador;
using Modelo;
using System.IO;

namespace Vista
{
    public partial class Empleado : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                listar_empleado();
                form_empleado(1);
            }
        }

      
        public void listar_empleado()
        {
            List<listar_empleadoResult> lista = new List<listar_empleadoResult>();

            lista = Crud_tbl_empleado.Listar_Empleado();
            if (lista != null)
            {
                //grid_empleados.AutoGenerateSelectButton = true;
                grid_empleados.DataSource = lista;
                grid_empleados.DataBind();              
            }
        }

        public void editar_empleado()
        {
            tbl_empleado data = new tbl_empleado();
            data.nombre_empleado = txt_nombre.Text;
            data.apellido_empleado = txt_apellido.Text;
            data.correo_empleado = txt_correo.Text;
            data.dni_empleado = txt_cedula.Text;
            int id_empleado = Convert.ToInt32(Session["id_empleado"]);
            Crud_tbl_empleado.Editar_Empleado(data,id_empleado);
            

        }
        public void buscar_tbl_empleados(string descricion)
        {
            List<buscaMasiva_empleadoResult> lista = new List<buscaMasiva_empleadoResult>();
            
            lista = Crud_tbl_empleado.Buscar_Empleado(descricion);
            if (lista != null)  {
                grid_empleados.AutoGenerateSelectButton = true;
                grid_empleados.DataSource = lista;
                grid_empleados.DataBind();
            }
        }
        public void form_empleado(int  op)
        {
            switch (op)
            {
                //ingresar nuevo empleado
                case 2:
                    lbl_titulo.Text = "Nuevo Empleado";
                    txt_nombre.Visible = true;
                    lbl_nombre.Visible = true;
                    txt_apellido.Visible = true;
                    lbl_apellido.Visible = true;
                    txt_correo.Visible = true;
                    lbl_correo.Visible = true;
                    drop_departamento.Visible = true;
                    lbl_departamento.Visible = true;
                    txt_cedula.Visible = true;
                    lbl_cedula.Visible = true;
                    txt_contrasena.Visible = true;
                    lbl_contrasena.Visible = true;
                    btn_guardar.Visible = true;
                    txt_buscar.Visible = false;
                    bt_buscar.Visible = false;
                    btn_nuevo.Visible = false;
             break;
                    //Mostrar empleado
            case 1:
                    lbl_titulo.Text = "Lista Empleados";
                    txt_nombre.Visible = false;
                    lbl_nombre.Visible = false;
                    txt_apellido.Visible = false;
                    lbl_apellido.Visible = false;
                    txt_correo.Visible = false;
                    lbl_correo.Visible = false;
                    drop_departamento.Visible = false;
                    lbl_departamento.Visible = false;
                    txt_cedula.Visible = false;
                    lbl_cedula.Visible = false;
                    txt_contrasena.Visible = false;
                    lbl_contrasena.Visible = false;
                    btn_guardar.Visible = false;
                    btn_editar.Visible = false;
            break;
                    //Editar Empleado
                case 3:
                    lbl_titulo.Text = "Editar Empleado";
                    txt_nombre.Visible = true;
                    lbl_nombre.Visible = true;
                    txt_apellido.Visible = true;
                    lbl_apellido.Visible = true;
                    txt_correo.Visible = true;
                    lbl_correo.Visible = true;
                    //drop_departamento.Visible = true;
                    grid_empleados.Visible = false;
                    bt_buscar.Visible = false;
                    txt_buscar.Visible = false;
                    txt_cedula.Visible = true;
                    lbl_cedula.Visible = true;
                    btn_nuevo.Visible = false;
                    btn_editar.Visible = true;
                    break;
            }
                        

        }

        public void insertar_empleado()
        {

            tbl_empleado objeto = new tbl_empleado();
            objeto.nombre_empleado =txt_nombre.Text;
            objeto.apellido_empleado = txt_apellido.Text;
            objeto.correo_empleado = Convert.ToString(txt_correo.Text);
            objeto.id_departamento =Convert.ToInt32( drop_departamento.SelectedValue);
            objeto.id_rol = 2;
            objeto.dni_empleado = txt_cedula.Text;
            objeto.contrasena_empleado = txt_contrasena.Text;
            objeto.estado_empleado = Convert.ToChar("1");
            Crud_tbl_empleado.Insertar_Empleado(objeto);

        }

        protected void grid_empleados_SelectedIndexChanged(object sender, EventArgs e)
        {

            form_empleado(3);
            txt_nombre.Text = HttpUtility.HtmlDecode(grid_empleados.SelectedRow.Cells[2].Text);
            txt_apellido.Text = HttpUtility.HtmlDecode(grid_empleados.SelectedRow.Cells[3].Text);
            txt_correo.Text = HttpUtility.HtmlDecode(grid_empleados.SelectedRow.Cells[4].Text);
            txt_cedula.Text = HttpUtility.HtmlDecode(grid_empleados.SelectedRow.Cells[7].Text);
            //drop_departamento.SelectedItem.Text = HttpUtility.HtmlDecode(grid_empleados.SelectedRow.Cells[5].Text);
            int id = Convert.ToInt32(grid_empleados.SelectedRow.Cells[1].Text);
            Session["id_empleado"] = id;

        }

        protected void drop_departamento_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        

        protected void grid_empleados_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
             grid_empleados.PageIndex = e.NewPageIndex;
            listar_empleado();
        }

        protected void btn_guardar_Click(object sender, EventArgs e)
        {
            insertar_empleado();
            Response.Redirect("~/Empleado.aspx");
        }

        protected void btn_nuevo_Click(object sender, EventArgs e)
        {
            form_empleado(2);
            grid_empleados.Visible = false;
        }

        protected void bt_buscar_Click(object sender, EventArgs e)
        {
            buscar_tbl_empleados(txt_buscar.Text);
        }
        

        protected void grid_empleados_RowEditing(object sender, GridViewEditEventArgs e)
        {
            
           
        }

        protected void grid_empleados_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void btn_editar_Click(object sender, EventArgs e)
        {
            editar_empleado();
            Response.Redirect("~/Empleado.aspx");
        }

        protected void txt_contrasena_TextChanged(object sender, EventArgs e)
        {

        }

        protected void grid_empleados_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
           

        }

        protected void grid_empleados_PageIndexChanging1(object sender, GridViewPageEventArgs e)
        {
            grid_empleados.PageIndex = e.NewPageIndex;
            listar_empleado();
        }
    }
}