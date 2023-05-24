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
        //Clase publica instanciando al modelo de base de datos bdactivos ubicado
        //en la capa modelo ne negocio hace referencia a llamada a las tablas y atributos de las mismas
        public static DbActivosDataContext dc = new DbActivosDataContext();

        //metodo creado para listar  los activos con estado ="activo"
        public static List<listar_activoResult> Listar_Activo()
        {
            var list = dc.listar_activo();
            return list.ToList();
        }
        //metodo creado para mostrar los activos con estado activo e inactivo 
        public static List<listar_all_activoResult> Listar_all_Activo()
        {
            var list = dc.listar_all_activo();
            return list.ToList();
        }

        //metodo creado para insertar datos en la tabla tbl_activo
        public static void Insertar_Activo(tbl_activo ta)
        {
            //utilizamos la funcion try para controlar erroes en ejecucion del programa si llegase a ocurrir
            //    un error el programa  no se cerrara y continuara mostrando el error desisgado en la llamada exeption ex
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
        //Metodo creado que necesita un parametro para realiar una busqueda en la tabla tbl_activo 
           
        public static List<buscaMasiva_activoResult> Buscar_Activo(string descripcion)
        {

            var list = dc.buscaMasiva_activo(descripcion);
            return list.ToList();
        }

        //Lista de la ventana modal para capturar un activos con disponiblilidad "Libre" ----> "no utilizado "
        public static List<Activos_disponiblesResult> Activo_disponible()
        {
            var list = dc.Activos_disponibles();
            return list.ToList();
        }
        // Buscar activos con estado 0 ("Disponibles")

            //metodo para buscar activos disponibles- ---> " no utulizado "
        public static List<buscar_AcDisponibleResult> Buscar_ActivoDiponible( string descripcion)
        {
            var list = dc.buscar_AcDisponible(descripcion);
            return list.ToList();

        }
    }
}
