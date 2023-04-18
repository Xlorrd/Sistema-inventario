using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;
namespace Controlador
{
    public class Crud_tbl_custodio
    {
        public static DbActivosDataContext dc =new DbActivosDataContext();

        public static List<listar_custodioResult> Listar_Custodio()
        {
            var listar = dc.listar_custodio();
            return listar.ToList();
        }

        //public static List<buscar_custodioResult> Buscar_Custodio(string descripcion)
        //{
        //    var buscar = dc.buscar_custodio(descripcion);
        //    return buscar.ToList();
        //}

        public static void Insertar_Custodio(tbl_custodio tc)
        {
            try
            {
                var insertar = dc.insertar_custodio(
                    tc.id_activo,
                    tc.id_empleado,
                    tc.fecha_entrega,
                    tc.fecha_recepcion,
                    tc.estado_custodio,
                    tc.observacion
                    );
            }
            catch (Exception ex)
            {

                throw new System.ArgumentException("Error al guardar"+ex.Message);
            }
        }
    }
}
