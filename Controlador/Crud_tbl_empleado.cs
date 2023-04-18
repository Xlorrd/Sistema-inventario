using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;
namespace Controlador
{
   public class Crud_tbl_empleado
    {
        public static DbActivosDataContext dc = new DbActivosDataContext();

        public static List<listar_empleadoResult> Listar_Empleado()
        {
            var list = dc.listar_empleado();
            return list.ToList();
        }
        public static List<buscaMasiva_empleadoResult> Buscar_Empleado(string descripcion) {

            var list = dc.buscaMasiva_empleado(descripcion);
            return list.ToList();
        }

        public static void Insertar_Empleado(tbl_empleado  te)
        {
            try
            {
                var insert = dc.insertar_persona(
                    te.nombre_empleado,
                    te.apellido_empleado, 
                    te.correo_empleado, 
                    te.id_departamento, 
                    te.id_rol, 
                    te.dni_empleado, 
                    te.contrasena_empleado, 
                    te.estado_empleado);
            }
            catch (Exception ex)
            {

                throw new System.ArgumentException("los datos no han sido guardados <br/>" + ex.Message);

            }

        }
        public static void Editar_Empleado(tbl_empleado te,int id_departamento)
        {
            try
            {
                var edit = dc.editar_empleado(
                    id_departamento,
                    te.nombre_empleado,
                    te.apellido_empleado,
                    te.correo_empleado,
                    te.dni_empleado
                    );
            }
            catch (Exception ex)
            {

                throw new System.ArgumentException("los datos no han sido editados <br/>" + ex.Message);
            }
        }
    }

}
