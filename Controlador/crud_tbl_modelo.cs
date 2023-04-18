using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;
namespace Controlador
{
   public class crud_tbl_modelo
    {
        public static DbActivosDataContext dc = new DbActivosDataContext();
        
        public static List<listar_modeloResult> Listar_Modelo()          
        {
            var list = dc.listar_modelo();
            return list.ToList();
        }

        public static List<buscar_modeloResult> Buscar_Modelo(string desc_modelo)
        {
            var list = dc.buscar_modelo(desc_modelo);
            return list.ToList();
        }

        public static void Insertar_Modelo(tbl_modelo tm)
        {
            try
            {
                var insertar = dc.insertar_modelo(tm.desc_modelo);
            }
            catch (Exception ex)
            {
                throw new System.ArgumentException("Error al guardar <br/>" + ex.Message);
            }
        }
        public static void Editar_Modelo(tbl_modelo tm, int id_modelo)
        {
            try
            {
                var editar = dc.actualizar_modelo(id_modelo, tm.desc_modelo);
            }
            catch (Exception ex)
            {
                throw new System.ArgumentException("Error al editar <br/>" + ex.Message);
            }
        }

    }
}
