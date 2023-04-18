using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Modelo;
using Controlador;

namespace Controlador
{
   public class crud_tbl_estadoAc
    {

        public static DbActivosDataContext dc = new DbActivosDataContext();

        public static List<listar_estadoAcResult> Listar_estadoAc()
        {
            var list = dc.listar_estadoAc();
            return list.ToList();
        }
        public static List<buscar_estadoAcResult> Buscar_estadoAc(string desc_estadoAc)
        {
            var buscar = dc.buscar_estadoAc(desc_estadoAc);
            return buscar.ToList();
        }

        public static void Insertar_estadoAc(tbl_estadoAc te)
        {
            try
            {
                var insertar = dc.insertar_estadoAc(te.desc_estadoAc);
            }
            catch (Exception ex)
            {

                throw new System.ArgumentException("Error al insertar"+ex.Message);
            }
        }

        public static void Editar_estadoAc(tbl_estadoAc te ,int id_estadoAc)
        {

            try
            {
                var editar = dc.actualizar_estadoAc(id_estadoAc,te.desc_estadoAc);
                
            }
            catch (Exception ex)
            {
                throw new System.ArgumentException("Error al actualizar"+ex.Message);
            }
        }
    }
}
