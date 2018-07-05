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
    public partial class Cargamentos : System.Web.UI.Page
    {
        Conn.Connect moConeccion = new Conn.Connect("SQLServer");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                return;
            }
            if (IsPostBack)
                return;
          
            Vehiculo();
            ayudante();
            Conductor();
            a();
           







        }

        protected void Registrar_C_Click(object sender, EventArgs e)
        {
            try
            {
                Entidades.E_Cargamento cargamentogeneral = new Entidades.E_Cargamento();
                cargamentogeneral.Vehiculoid = Convert.ToInt32(vehiculoId.SelectedValue);
                cargamentogeneral.TOTAL = Decimal.ToInt32(Convert.ToDecimal(Costo.Text));
                cargamentogeneral.NumeroOperaciones = Convert.ToInt32(n_operacion.SelectedValue);
                cargamentogeneral.TipoOperaciones = 1;
                cargamentogeneral.Peso = Convert.ToInt32(peso.Text);
                cargamentogeneral.Volumen = Convert.ToInt32(volumenes.Value);
                cargamentogeneral.Conductorid = Convert.ToInt32(conductorid.SelectedValue);
                cargamentogeneral.ayudanteid = Convert.ToInt32(ayudanteids.SelectedValue);
                cargamentogeneral.Olongitud = Convert.ToDecimal(lgo.Value);
                cargamentogeneral.Olatitud = Convert.ToDecimal(lo.Value);
                cargamentogeneral.Dlongitud = Convert.ToDecimal(lgd.Text);
                cargamentogeneral.Dlatitud = Convert.ToDecimal(lde.Text);
                cargamentogeneral.Cod_Plan = Convert.ToInt32(cd.Text);

              

                    moConeccion.CGM_PRO_INS(cargamentogeneral,"I");
        

                    Response.Redirect("exito.aspx");
            



            }

            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }



        }


        public void Vehiculo()
        {

            DataTable Vehiculo = moConeccion.getComboxby(0,"V");
            vehiculoId.DataSource = Vehiculo;
            vehiculoId.DataTextField = "Detalle";
            vehiculoId.DataValueField = "Codigo";
            vehiculoId.DataBind();



        }

        public void Conductor()
        {
            DataTable Conductor = moConeccion.getComboxby(0,"C");
            conductorid.DataSource = Conductor;
            conductorid.DataTextField = "Detalle";
            conductorid.DataValueField = "Codigo";
            conductorid.DataBind();
        }
        public void ayudante()
        {
            DataTable ayudante = moConeccion.getComboxby(0,"A");
            ayudanteids.DataSource = ayudante;
            ayudanteids.DataTextField = "Detalle";
            ayudanteids.DataValueField = "Codigo";
            ayudanteids.DataBind();

        }

        protected void tipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable tipos = moConeccion.getComboxby(0,tipo.SelectedItem.Text);
            n_operacion.DataSource = tipos;
            n_operacion.DataTextField = "detalle";
            n_operacion.DataValueField = "codigo";
            n_operacion.DataBind();
        }



        protected void n_operacion_SelectedIndexChanged(object sender, EventArgs e)
        {
            var tabla = moConeccion.getComboxby( Convert.ToInt32(n_operacion.SelectedValue), "cons");
          
            if (tabla.Rows.Count > 0)
            {
                peso.Text = tabla.Rows[0]["cantidad"].ToString();
                totales.Value = tabla.Rows[0]["total"].ToString();

            }
        }


        public void a()
        {

            
            
            tipo.Items.Add("Venta");

            tipo.Items.Insert(0, new ListItem("Seleccionar"));


        }

        protected void Calcular_Click(object sender, EventArgs e)

        {

            int resultado = to(Convert.ToInt32(peso.Text) , Convert.ToInt32(volumenes.Value), Decimal.ToInt32(Convert.ToDecimal(totales.Value)));
            Costo.Text = Convert.ToString( resultado);
        }


        public int to(int res , int res2 , int total) {
            int resultado = 0 , resultado2;
            resultado = ( res / res2) ;
            resultado2 = (resultado + total) * 50 ;

            // (Convert.ToInt32(volumenes.Value) * costo) + Convert.ToInt32(totales.Value);


            return resultado2;

        }
    }
}