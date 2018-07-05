using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_Modulo_Transporte
{
    public partial class Vehiculo : System.Web.UI.Page
    {
        Conn.Connect moConeccion = new Conn.Connect("SQLServer");
        protected void Page_Load(object sender, EventArgs e)
        {
        
            if (IsPostBack)
            {

                return;
            }
            listavehiculo();

        }


        public void listavehiculo()
        {

            if (buscar.Text == "")
            {


                var tabla = moConeccion.getVehiculoby(0, "", "L");
                tablapersona.DataSource = tabla;
                tablapersona.DataBind();

            }
            else
            {
                var tabla = moConeccion.getVehiculoby(0, buscar.Text.Trim(), "C");
                tablapersona.DataSource = tabla;
                tablapersona.DataBind();
            }

        }

        protected void tablapersona_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            tablapersona.PageIndex = e.NewPageIndex;
            listavehiculo();
        }

        protected void btnbuscar_Click(object sender, EventArgs e)
        {
            listavehiculo();
        }
        [WebMethod]
        public static E_Vehiculo Listavehiculo(int Listavehiculo)
        {
            Conn.Connect moConeccion = new Conn.Connect("SQLServer");
            E_Vehiculo LISTA = new E_Vehiculo();
            //    LISTA.p_ci = Listapersona;
            var tabla = moConeccion.getVehiculoby(Listavehiculo, "", "G");
            if (tabla.Rows.Count > 0)
            {
                LISTA.Capacidadmax = Convert.ToInt32(tabla.Rows[0]["capacidadmax"].ToString());
                LISTA.Pasajeromax = Convert.ToInt32( tabla.Rows[0]["pasajeromax"].ToString());
                LISTA.Matricula = tabla.Rows[0]["Matricula"].ToString();
                LISTA.ACT_COD =Convert.ToInt32( tabla.Rows[0]["ACT_COD"].ToString());
                LISTA.Volumenmaximo = Convert.ToInt32( tabla.Rows[0]["volumenmaximo"].ToString());
                LISTA.Pesomaximo = Convert.ToInt32(tabla.Rows[0]["pesomaximo"].ToString());
                LISTA.Vehiculoid = Convert.ToInt32( tabla.Rows[0]["vehiculoid"].ToString());

            }
            return LISTA;

        }

        [WebMethod]
        public static Entidades.E_Vehiculo RegistraVehiculo(E_Vehiculo objvehiculo)
        {
            Conn.Connect moConeccion = new Conn.Connect("SQLServer");

            moConeccion.ABMVEHICULO(objvehiculo, "I");

            return objvehiculo;

        }
        [WebMethod]
        public static E_Vehiculo ActulizarVehiculo(E_Vehiculo objvehiculo)
        {
   
            Conn.Connect moConeccion = new Conn.Connect("SQLServer");
            moConeccion.ABMVEHICULO(objvehiculo, "U");

            return objvehiculo;

        }

        [WebMethod]
        public static int Eliminar(int Listavehiculo)
        {
            Conn.Connect moConeccion = new Conn.Connect("SQLServer");


            var tabla = moConeccion.getVehiculoby(Listavehiculo, "", "E");

            return Listavehiculo;


        }

    }
}