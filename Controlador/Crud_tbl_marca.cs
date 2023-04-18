using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;


namespace Controlador
{

  public  class Crud_tbl_marca
    {
        public static DbActivosDataContext dc = new DbActivosDataContext();
        List<listar_marcaResult> objeto = new List<listar_marcaResult>();

        public static List<listar_marcaResult> Listar_Marca()
        {
            var list = dc.listar_marca();
            return list.ToList();
        }
        public static List <buscar_marcaResult> Buscar_Marca(string desc_marca)
        {
            var busqueda_marca = dc.buscar_marca(desc_marca);
            return busqueda_marca.ToList();
        }

        public static void Insertar_Marca (tbl_marca tm)
        {
            try
            {
                var insert = dc.insertar_marca(tm.desc_marca);
                   
            }
            catch (Exception ex)
            {

                throw new System.ArgumentException("los datos no han sido guardados <br/>" + ex.Message);
            }
        }
        
        public static void Editar_Marca(tbl_marca tm, int id_marca)
        {
            try
            {
                var edit = dc.actualizar_marca(id_marca, tm.desc_marca);
            }
            catch (Exception ex)
            {
                throw new System.ArgumentException("Error al actualizar <br/>" + ex.Message);
            }
        }

    }
}
