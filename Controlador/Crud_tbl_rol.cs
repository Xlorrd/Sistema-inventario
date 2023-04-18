using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;

namespace Controlador
{
   public class Crud_tbl_rol
    {
        public static DbActivosDataContext dc = new DbActivosDataContext();

        public static List<listar_rolResult> Listar_Rol()
        {
            var listar = dc.listar_rol();
            return listar.ToList();
        }
        public static List<buscar_rolResult> Buscar_Rol(string descripcion_rol)
        {
            var buscar = dc.buscar_rol(descripcion_rol);
            return buscar.ToList();
        }

        public static void Insertar_Rol(tbl_rol tr)
        {
            try
            {
                var insertar = dc.insertar_rol(tr.descripcion_rol, tr.estado_rol);
            }
            catch (Exception ex)
            {

                throw new System.ArgumentException("Error al guardar"+ex.Message);
            }

        }

        public static void Editar_Rol(tbl_rol tr,int id_rol)
        {
            try
            {
                var editar = dc.actualizar_rol(id_rol,tr.descripcion_rol,tr.estado_rol);
            }
            catch (Exception ex)
            {

                throw new System.ArgumentException("Error al actualizar"+ex.Message);
            }
        }
    }
}
