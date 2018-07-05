using Entidades;
using Newtonsoft.Json;
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
    public partial class Persona : System.Web.UI.Page
    {
        Conn.Connect moConeccion = new Conn.Connect("SQLServer");

        Entidades.E_Personas cliente = new Entidades.E_Personas();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack)
            {
          
                return;
            }


            //ViewState["p_ci"] = Session["p_ci"];
            //string client_id = Request.QueryString["p_ci"];
            //tx.Text = client_id;
            //string id = client_id;

            //cliente.p_ci = id;
            //if (client_id != null) { 
            //var tabla = moConeccion.getPersonaby(cliente);
            //if (tabla.Rows.Count > 0)
            //{

            //    p_ci.Text = tabla.Rows[0]["p_ci"].ToString();
            //    nombre.Text = tabla.Rows[0]["p_nombres"].ToString();
            //    Ap_paterno.Text = tabla.Rows[0]["p_apellido_paterno"].ToString();
            //    Ap_materno.Text = tabla.Rows[0]["p_apellido_materno"].ToString();
            // fecha.Text =  tabla.Rows[0]["p_fecha_nacimiento"].ToString();
            //    //Convert.ToString(   fecha).date = tabla.Rows[0]["p_fecha_nacimiento"].ToString();
            //    Telefonof.Text = tabla.Rows[0]["p_telefono_fijo"].ToString();
            //    Telefonoc.Text = tabla.Rows[0]["p_telefono_celular"].ToString();
            //        correo.Text = tabla.Rows[0]["p_correo"].ToString();
            //        Direccion.Text = tabla.Rows[0]["p_direccion"].ToString();
            //        p_ci.Text = Convert.ToString(id);



            //}
            //}
            //else { 

            listaPersonas();

            //}





        }
        [WebMethod]

        public static E_Personas Registrapersona(E_Personas objpersona)
        {


            Conn.Connect moConeccion = new Conn.Connect("SQLServer");




            moConeccion.InsertarPersona(objpersona, "insertar");

            return objpersona;

        }
        [WebMethod]
        public static E_Personas Actulizarpersona(E_Personas objpersona)
        {
            Persona a = new Persona();
            Conn.Connect moConeccion = new Conn.Connect("SQLServer");
            moConeccion.InsertarPersona(objpersona, "actualizar");

            return objpersona;

        }
        [WebMethod]
        public static E_Personas Listapersona(string Listapersona)
        {
            Conn.Connect moConeccion = new Conn.Connect("SQLServer");
            E_Personas LISTA = new E_Personas();
        //    LISTA.p_ci = Listapersona;
            var tabla = moConeccion.getPersonaby(Listapersona);
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
        public static E_Personas Eliminar(string Listapersona)
        {
            Conn.Connect moConeccion = new Conn.Connect("SQLServer");
            E_Personas LISTA = new E_Personas();
  
                moConeccion.InsertarPersona(LISTA, "eliminar");

            return LISTA;


        }

     



        protected void btnbuscar_Click(object sender, EventArgs e)
        {



            listaPersonas();
   
        }
    


        public void listaPersonas(){
            
            if (buscar.Text == "")
            {
              var tabla =  moConeccion.listapersonas();
                tablapersona.DataSource = tabla;
                tablapersona.DataBind();
            }
            else
            {
              var tabla=  moConeccion.Buspersona(buscar.Text.Trim());
                tablapersona.DataSource = tabla;
                tablapersona.DataBind();
            }

        }




        protected void tablapersona_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            tablapersona.PageIndex = e.NewPageIndex;
            listaPersonas();
        }

       

        protected void T_Click(object sender, EventArgs e)
        {


            //try
            //{
            //    string personaid = tx.Text;
            //    Entidades.E_Personas clientesgenerales = new Entidades.E_Personas()
            //    {
            //        p_ci = p_ci.Text,
            //        Nombre = nombre.Text,
            //        ApellidoPaterno =  Ap_paterno.Text,
            //        ApellidoMaterno = Ap_materno.Text,
            //        Fecha_Nacimiento = Convert.ToDateTime( fecha.Text),
            //        correo = correo.Text,
            //        Telefono_Fijo = Telefonof.Text,
            //        Telefono_Celular = Telefonof.Text,
            //        Direccion = Direccion.Text,

            //    };
            //    if (tx.Text == "")
            //    {

            //        //moConeccion.InsertarPersona(clientesgenerales ,"insertar");
            //        //p_ci.Text = "";
            //        //nombre.Text = "";
            //        //Ap_paterno.Text = "";
            //        //Ap_materno.Text = "";
            //        //fecha.Text = "";
            //        //correo.Text = "";
            //        //Telefonof.Text = "";
            //        //Telefonof.Text = "";
            //        //Direccion.Text = "";
            //        //var direccion = "~/Persona.aspx?p_ci=" + " ";
            //        //Response.Redirect(direccion);



            //    }
            //    if (tx.Text != "")
            //    {

            //        moConeccion.InsertarPersona(clientesgenerales, "actualizar");
      
            //        p_ci.Text = "";
            //        nombre.Text = "";
            //        Ap_paterno.Text = "";
            //        Ap_materno.Text= "";
            //        fecha.Text = "";
            //        correo.Text = "";
            //        Telefonof.Text = "";
            //        Telefonof.Text = "";
            //        Direccion.Text = "";
        

               

            //    }



            //}

            //catch (Exception ex)
            //{
              
            //}

    

        }
    }
}