using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_Modulo_Transporte
{
    public partial class Ayudante : System.Web.UI.Page
    {
        Conn.Connect moConeccion = new Conn.Connect("SQLServer");
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack)
            {

                return;
            }

            listaPersonas();
            LISTAPERSONA();
        }


        public void listaPersonas()
        {

            if (buscar.Text == "")
            {


                var tabla = moConeccion.getAyundateby(0, "", "L");
                tablapersona.DataSource = tabla;
                tablapersona.DataBind();

            }
            else
            {
                var tabla = moConeccion.getAyundateby(0, buscar.Text.Trim(), "C");
                tablapersona.DataSource = tabla;
                tablapersona.DataBind();
            }

        }

        protected void tablapersona_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            tablapersona.PageIndex = e.NewPageIndex;
            listaPersonas();
        }

        protected void btnbuscar_Click(object sender, EventArgs e)
        {
            listaPersonas();
        }


        [WebMethod]
        public static E_Ayudante Listaayudante(E_Ayudante objayudante)
        {
            Conn.Connect moConeccion = new Conn.Connect("SQLServer");
            E_Ayudante LISTA = new E_Ayudante();
            //    LISTA.p_ci = Listapersona;
            var tabla = moConeccion.getPersonaby(objayudante.p_ci);
            if (tabla.Rows.Count > 0)
            {
                LISTA.p_ci = tabla.Rows[0]["PER_CI"].ToString();
                LISTA.PER_NOMBRES = tabla.Rows[0]["PER_NOMBRES"].ToString();
                LISTA.PER_APELLIDO_PATERNO = tabla.Rows[0]["PER_APELLIDO_PATERNO"].ToString();
                LISTA.PER_APELLIDO_MATERNO = tabla.Rows[0]["PER_APELLIDO_MATERNO"].ToString();
                LISTA.PER_TELEFONO_FIJO = tabla.Rows[0]["PER_TELEFONO_FIJO"].ToString();
                LISTA.PER_TELEFONO_CELULAR = tabla.Rows[0]["PER_TELEFONO_CELULAR"].ToString();
                LISTA.PER_CORREO = tabla.Rows[0]["PER_CORREO"].ToString();
                LISTA.PER_DIRECCION = tabla.Rows[0]["PER_DIRECCION"].ToString();

            }
            return LISTA;

        }
        [WebMethod]
        public static E_Ayudante Listageneral(int Listaayudante)
        {
            Conn.Connect moConeccion = new Conn.Connect("SQLServer");
            E_Ayudante LISTA = new E_Ayudante();
            var tabla = moConeccion.getAyundateby(Listaayudante, "", "G");
            if (tabla.Rows.Count > 0)
            {
                LISTA.p_ci = tabla.Rows[0]["PER_CI"].ToString();
                LISTA.PER_NOMBRES = tabla.Rows[0]["PER_NOMBRES"].ToString();
                LISTA.PER_APELLIDO_PATERNO = tabla.Rows[0]["PER_APELLIDO_PATERNO"].ToString();
                LISTA.PER_APELLIDO_MATERNO = tabla.Rows[0]["PER_APELLIDO_MATERNO"].ToString();
                LISTA.PER_TELEFONO_FIJO = tabla.Rows[0]["PER_TELEFONO_FIJO"].ToString();
                LISTA.PER_TELEFONO_CELULAR = tabla.Rows[0]["PER_TELEFONO_CELULAR"].ToString();
                LISTA.PER_CORREO = tabla.Rows[0]["PER_CORREO"].ToString();
                LISTA.PER_DIRECCION = tabla.Rows[0]["PER_DIRECCION"].ToString();
                LISTA.ayudanteid = Convert.ToInt32(tabla.Rows[0]["ayudanteid"]);
            }
            return LISTA;

        }
        [WebMethod]
        public static Entidades.E_Ayudante Registraayudante(E_Ayudante objayudante)
        {
            Conn.Connect moConeccion = new Conn.Connect("SQLServer");

            moConeccion.ABMAyudante(objayudante, "I");

            return objayudante;

        }
        [WebMethod]
        public static E_Ayudante ActulizarAyudante(E_Ayudante objayudante)
        {
 
            Conn.Connect moConeccion = new Conn.Connect("SQLServer");
            moConeccion.ABMAyudante(objayudante, "U");

            return objayudante;

        }

        [WebMethod]
        public static int Eliminar(int Listaayudante)
        {
            Conn.Connect moConeccion = new Conn.Connect("SQLServer");


            var tabla = moConeccion.getAyundateby(Listaayudante, "", "E");

            return Listaayudante;


        }

        public void LISTAPERSONA()
        {
            DataTable Carnet = moConeccion.Carnet();
            carnet.DataSource = Carnet;
            carnet.DataTextField = "Detalle";
            carnet.DataValueField = "Codigo";
            carnet.DataBind();

        }

    }
}