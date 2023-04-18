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
    public partial class Marca : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                form_marca(1);
                listar_marca();

            }
            
        }
        public void listar_marca()
        {

            List<listar_marcaResult> lista = new List<listar_marcaResult>();

            lista = Crud_tbl_marca.Listar_Marca();
            if (lista != null)
            {
                
                grid_marca.DataSource = lista;
                grid_marca.DataBind();
            }
        }
        public void insertar_marca()
        {
            tbl_marca objeto_marca = new tbl_marca();
            objeto_marca.desc_marca = txt_descMarca.Text;
           Crud_tbl_marca.Insertar_Marca(objeto_marca);
        }
        public void buscar_marca(string desc_marca)
        {
            List<buscar_marcaResult> lista_marca = new List<buscar_marcaResult>();
            lista_marca = Crud_tbl_marca.Buscar_Marca(desc_marca);
            if (lista_marca != null)
            {
                grid_marca.AutoGenerateSelectButton = true;
                grid_marca.DataSource = lista_marca;
                grid_marca.DataBind();
            }
        }

        public void editar_marca()
        {
            tbl_marca data = new tbl_marca();
            data.desc_marca = txt_descMarca.Text;
            int id_marca = Convert.ToInt32(Session["id_marca"]);
            Crud_tbl_marca.Editar_Marca(data, id_marca);
        }

        public  void form_marca(int op)
        {
            switch (op)
            {
                case 1:
                    // Caso para mostrar la carga de pantalla se utilizará como primera carga o cuando se actualice o guarde un dato

                    lbl_titulo.Text = "Lista de Marca";
                    grid_marca.Visible = true;
                    lbl_descMarca.Visible = false;
                    txt_descMarca.Visible = false;
                    btn_guardar.Visible = false;
                    btn_editar.Visible = false;
                    btn_nuevo.Visible = true;

                    break;

                case 2:
                    //caso para ingresar nuevo
                    lbl_titulo.Text = "Ingresar Marca";
                    btn_nuevo.Visible = false;
                    grid_marca.Visible = false;
                    txt_buscar.Visible = false;
                    lbl_descMarca.Visible = true;
                    txt_descMarca.Visible = true;
                    bt_buscar.Visible = false;                    
                    btn_guardar.Visible = true;
                    btn_editar.Visible = false;
                    break;
                case 3:
                    // caso para editar 
                    lbl_titulo.Text = "Editar Marca";
                    btn_nuevo.Visible = false;
                    grid_marca.Visible = false;
                    txt_buscar.Visible = false;
                    lbl_descMarca.Visible = true;
                    txt_descMarca.Visible = true;
                    bt_buscar.Visible = false;
                    btn_guardar.Visible = false;
                    btn_editar.Visible = true;
                    break;
            }
        }
        protected void grid_marca_SelectedIndexChanged(object sender, EventArgs e)
        {
            txt_descMarca.Text = HttpUtility.HtmlDecode(grid_marca.SelectedRow.Cells[2].Text);
            int id = Convert.ToInt32(grid_marca.SelectedRow.Cells[1].Text);
            form_marca(3);
            Session["id_marca"] = id;
        }

        protected void bt_buscar_Click(object sender, EventArgs e)
        {
            buscar_marca(txt_buscar.Text);
        }

        protected void btn_nuevo_Click(object sender, EventArgs e)
        {
            form_marca(2);
        }

        protected void btn_guardar_Click(object sender, EventArgs e)
        {
            insertar_marca();
            Response.Redirect("~/Marca.aspx");
        }

        protected void btn_editar_Click(object sender, EventArgs e)
        {
            editar_marca();
            Response.Redirect("~/Marca.aspx");
        }

        protected void txt_buscar_TextChanged(object sender, EventArgs e)
        {

        }

        protected void grid_marca_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grid_marca.PageIndex = e.NewPageIndex;
            listar_marca();


        }
    }
}