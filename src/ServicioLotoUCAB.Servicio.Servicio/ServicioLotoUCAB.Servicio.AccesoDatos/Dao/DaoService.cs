using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ServicioLotoUCAB.Servicio.AccesoDatos.Dao
{
    public class DaoService
    {
        public string GetData(int value)
        {
            string resultado = string.Empty;
            try
            {
                //Intrumentacion Logger
                resultado = "Usted introdujo el valor " + value;
                //Intrumentacion Logger
            }
            catch (Exception ex)
            {
                //Intrumentacion Logger Error
                throw ex;
            }
            finally
            {
                //Intrumentacion Logger final
            }
            return resultado;
        }
    }
}
