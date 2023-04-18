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
    public partial class Departamento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
      
            if (!IsPostBack)
            {

                listar_departamento();
                form_departamento(1);
            }
        }
        public void listar_departamento()
        {
            List<listar_departamentoResult> lista = new List<listar_departamentoResult>();
            lista = Crud_tbl_departamento.Listar_Departamento();
            if (lista != null)
            {
                grid_departamento.DataSource = lista;
                grid_departamento.DataBind();
            }
        }
        public void buscar_departamento(string descripcion)
        {
            List<buscar_departamentoResult> search_depa = new List<buscar_departamentoResult>();
            search_depa = Crud_tbl_departamento.Buscar_Departamento(descripcion);
            if (search_depa != null)
            {
                grid_departamento.AutoGenerateSelectButton = true;
                grid_departamento.DataSource = search_depa;
                grid_departamento.DataBind();
            }
        }
        
        public void insertar_departamento()
        {
            tbl_departamento objeto = new tbl_departamento();
            objeto.desc_departamento = txt_descripcion.Text;
            Crud_tbl_departamento.Insertar_Departamento(objeto);

        }
        public void editar_departamento()
        {
            tbl_departamento data = new tbl_departamento();
            data.desc_departamento = txt_descripcion.Text;
            int id_departamento = Convert.ToInt32(Session["id_departamento"]);
            Crud_tbl_departamento.Editar_Departamento(data, id_departamento);

        }

        protected void bt_buscar_Click(object sender, EventArgs e)
        {
            buscar_departamento(txt_buscar.Text);
        }

        protected void btn_nuevo_Click(object sender, EventArgs e)
        {
            form_departamento(2);

        }

        protected void btn_guardar_Click(object sender, EventArgs e)
        {
            insertar_departamento();
            Response.Redirect("~/Departamento.aspx");

        }

        protected void btn_editar_Click(object sender, EventArgs e)
        {
            editar_departamento();
            Response.Redirect("~/Departamento.aspx");

        }

        protected void grid_departamento_SelectedIndexChanged(object sender, EventArgs e)
        {
            form_departamento(3);
            txt_descripcion.Text = HttpUtility.HtmlDecode(grid_departamento.SelectedRow.Cells[2].Text);
            int id = Convert.ToInt32(grid_departamento.SelectedRow.Cells[1].Text);
             Session["id_departamento"] = id;

        }
        public void form_departamento(int op)
        {
            switch (op)
            {
                case 1:
                    lbl_titulo.Text = "Lista departamentos";
                    txt_buscar.Visible = true;
                    bt_buscar.Visible = true;
                    grid_departamento.Visible = true;
                    btn_nuevo.Visible = true;
                    txt_descripcion.Visible = false;
                    lbl_descripcion.Visible = false;                    
                    btn_editar.Visible = false;
                    btn_guardar.Visible = false;
                    break;
                case 2:
                    lbl_titulo.Text = "Insertar departamento";
                    txt_buscar.Visible = false;
                    bt_buscar.Visible = false;
                    grid_departamento.Visible = false;
                    btn_nuevo.Visible = false;
                    txt_descripcion.Visible = true;
                    lbl_descripcion.Visible = true;                   
                    btn_editar.Visible = false;
                    btn_guardar.Visible = true;
                    break;
                case 3:
                    lbl_titulo.Text = "Editar departamento";
                    txt_buscar.Visible = false;
                    bt_buscar.Visible = false;
                    grid_departamento.Visible = false;
                    btn_nuevo.Visible = false;
                    txt_descripcion.Visible = true;
                    lbl_descripcion.Visible = true;
                    btn_editar.Visible = true;
                    btn_guardar.Visible = false;
                    break;

            }
        }

        protected void grid_departamento_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grid_departamento.PageIndex = e.NewPageIndex;
            listar_departamento();
        }
    }
}