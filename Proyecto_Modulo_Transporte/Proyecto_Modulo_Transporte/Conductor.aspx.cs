

using Entidades;
using System;
using System.Data;
using System.Web.Services;
using System.Web.UI.WebControls;

namespace Proyecto_Modulo_Transporte
{
    public partial class Conductor : System.Web.UI.Page
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
            LISTACATEGORIA();
        }



        public void listaPersonas()
        {

            if (buscar.Text == "")
            {
               
                
                   var tabla = moConeccion.getConductorby(0,"","L");
                tablapersona.DataSource = tabla;
                tablapersona.DataBind();
 
            }
            else
            {
                var tabla = moConeccion.getConductorby(0,buscar.Text.Trim(),"C");
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
        public static Entidades.E_Conductor Registraconductor(E_Conductor objconducto)
        {
            Conn.Connect moConeccion = new Conn.Connect("SQLServer");

            moConeccion.ABMCONDUTOR(objconducto, "I");

            return objconducto;

        }
        [WebMethod]
        public static E_Conductor ActulizarConductor(E_Conductor objconducto)
        {
            Persona a = new Persona();
            Conn.Connect moConeccion = new Conn.Connect("SQLServer");
            moConeccion.ABMCONDUTOR(objconducto, "U");

            return objconducto;

        }
        [WebMethod]
        public static E_Conductor Listaconductor(int Listaconductor)
        {
            Conn.Connect moConeccion = new Conn.Connect("SQLServer");
            E_Conductor LISTA = new E_Conductor();
            //    LISTA.p_ci = Listapersona;
            var tabla = moConeccion.getConductorby(Listaconductor,"","G");
            if (tabla.Rows.Count > 0)
            {
                LISTA.p_ci = tabla.Rows[0]["PER_CI"].ToString();
                LISTA.PER_NOMBRES = tabla.Rows[0]["PER_NOMBRES"].ToString();
                LISTA.PER_APELLIDO_PATERNO = tabla.Rows[0]["PER_APELLIDO_PATERNO"].ToString();
                LISTA.PER_APELLIDO_MATERNO = tabla.Rows[0]["PER_APELLIDO_MATERNO"].ToString();
             
                //Convert.ToString(   fecha).date = tabla.Rows[0]["p_fecha_nacimiento"].ToString();
                LISTA.PER_TELEFONO_FIJO = tabla.Rows[0]["PER_TELEFONO_FIJO"].ToString();
                LISTA.PER_TELEFONO_CELULAR = tabla.Rows[0]["PER_TELEFONO_CELULAR"].ToString();
                LISTA.PER_CORREO = tabla.Rows[0]["PER_CORREO"].ToString();
                LISTA.PER_DIRECCION = tabla.Rows[0]["PER_DIRECCION"].ToString();
                LISTA.Licencia = tabla.Rows[0]["licencia"].ToString();
                LISTA.Categoriaid = Convert.ToInt32( tabla.Rows[0]["categoriaid"]);
                LISTA.Conductorid = Convert.ToInt32(tabla.Rows[0]["conductorid"]);
            }
            return LISTA;

        }
        [WebMethod]
        public static int Eliminar(int Listaconductor)
        {
            Conn.Connect moConeccion = new Conn.Connect("SQLServer");


            var tabla = moConeccion.getConductorby(Listaconductor, "","E");

            return Listaconductor;


        }



        public void LISTAPERSONA()
        {
            DataTable lIS = moConeccion.Listapersonas();
            carnet.DataSource = lIS;
            carnet.DataTextField = "Detalle";
            carnet.DataValueField = "Codigo";
            carnet.DataBind();

        }
        public void LISTACATEGORIA()
        {
            DataTable CATEGORIA = moConeccion.ListaCategoria();
            categoria.DataSource = CATEGORIA;
            categoria.DataTextField = "Detalle";
            categoria.DataValueField = "Codigo";
            categoria.DataBind();

        }
    }
}