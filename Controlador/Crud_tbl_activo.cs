using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;
namespace Controlador
{
   public class Crud_tbl_activo
    {
        public static DbActivosDataContext dc = new DbActivosDataContext();

        public static List<listar_activoResult> Listar_Activo()
        {
            var list = dc.listar_activo();
            return list.ToList();
        }

        public static void Insertar_Activo(tbl_activo ta)
        {
            try
            {
                var insert = dc.insertar_activo(
                    ta.cod1_activo,
                    ta.cod2_activo,
                    ta.tipo_activo,
                    ta.id_marca,
                    ta.id_modelo,
                    ta.serial_activo,
                    ta.ubicacion_activo,
                    ta.id_estadoAc,
                    ta.observacion_activo,
                    ta.estado_uso
                    );
            }
            catch (Exception ex)
            {

                throw new System.ArgumentException("los datos no han sido guardados <br/>" + ex.Message);

            }

        }
        public static List<buscaMasiva_activoResult> Buscar_Activo(string descripcion)
        {

            var list = dc.buscaMasiva_activo(descripcion);
            return list.ToList();
        }

        //Lista de la ventana modal para capturar un activos con disponiblilidad "Libre"
        public static List<Activos_disponiblesResult> Activo_disponible()
        {
            var list = dc.Activos_disponibles();
            return list.ToList();
        }
        // Buscar activos con estado 0 ("Disponibles")

        public static List<buscar_AcDisponibleResult> Buscar_ActivoDiponible( string descripcion)
        {
            var list = dc.buscar_AcDisponible(descripcion);
            return list.ToList();

        }
    }
}
