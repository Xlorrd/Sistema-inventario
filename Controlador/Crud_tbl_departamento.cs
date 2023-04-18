using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;


namespace Controlador
{
   public class Crud_tbl_departamento
    {
        public static DbActivosDataContext dc = new DbActivosDataContext();

        public static List<listar_departamentoResult> Listar_Departamento()
        {
            var listar = dc.listar_departamento();
            return listar.ToList();
        }
        public static List<buscar_departamentoResult> Buscar_Departamento(string desc_departamento)
        {
            var buscar = dc.buscar_departamento(desc_departamento);
            return buscar.ToList();
        }

        public static void Insertar_Departamento(tbl_departamento de)
        {
            try
            {
                var insertar = dc.insertar_departamento(de.desc_departamento);
            }
            catch (Exception ex)
            {

                throw new System.ArgumentException("Error al guardar los datos <br/> "+ex.Message);
            }
           
        }

        public static void Editar_Departamento(tbl_departamento td, int id_departamento)
        {
            try
            {
                var editar = dc.actualizar_departamento(id_departamento, td.desc_departamento);
            }
            catch (Exception ex)
            {

                throw new System.ArgumentException("Error al editar los datos <br/>"+ex.Message);
            }
        }
    }
}
