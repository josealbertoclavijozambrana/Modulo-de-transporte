using System.Configuration;
using System.Data;
using System.Data.Common;

namespace Conn
{
    public class Connect
    {
        DbConnection moConn;
        public Connect(string mstrCad)
        {
            // la cadena de conexion debera ser la de nuestro servidor de Oracle	
            //this.myOracleConnection = "Data Source=mpdb_nuevo;Persist Security Info=True;User ID=territory;Password=k29tertdw;Unicode=True;" ;
            this.moConn = CrearConeccion(ConfigurationManager.ConnectionStrings[mstrCad].ProviderName, ConfigurationManager.ConnectionStrings[mstrCad].ConnectionString);
        }
        private DbConnection CrearConeccion(string sProvider, string sCadena)
        {
            DbConnection moConn = null;
            DbProviderFactory pfProxy = DbProviderFactories.GetFactory(sProvider);
            moConn = pfProxy.CreateConnection();
            moConn.ConnectionString = sCadena;

            return moConn;
        }
        public void InsertarPersona(Entidades.E_Personas moTabla, string tipo)

        {

            DbCommand moComm = moConn.CreateCommand();
            moComm.CommandText = "insertarpersona";
            moComm.CommandType = CommandType.StoredProcedure;
            DbParameter param1 = moComm.CreateParameter();
            param1.ParameterName = "@p_ci";
            param1.DbType = DbType.String;
            param1.Value = moTabla.p_ci;
            moComm.Parameters.Add(param1);
            DbParameter param2 = moComm.CreateParameter();
            param2.ParameterName = "@nombre";
            param2.DbType = DbType.String;
            param2.Value = moTabla.PER_NOMBRES;
            moComm.Parameters.Add(param2);
            DbParameter param3 = moComm.CreateParameter();
            param3.ParameterName = "@apellidop";
            param3.Value = moTabla.PER_APELLIDO_PATERNO;
            param3.DbType = DbType.String;
            moComm.Parameters.Add(param3);
            DbParameter param4 = moComm.CreateParameter();
            param4.ParameterName = "@apellidom";
            param4.Value = moTabla.PER_APELLIDO_MATERNO;
            param4.DbType = DbType.String;
            moComm.Parameters.Add(param4);
            DbParameter param5 = moComm.CreateParameter();
            param5.ParameterName = "@fecha";
            param5.DbType = DbType.DateTime;
            param5.Value = moTabla.PER_FECHA_NACIMIENTO;
            moComm.Parameters.Add(param5);
            DbParameter param6 = moComm.CreateParameter();
            param6.ParameterName = "@correo";
            param6.DbType = DbType.String;
            param6.Value = moTabla.PER_CORREO;
            moComm.Parameters.Add(param6);
            DbParameter param7 = moComm.CreateParameter();
            param7.ParameterName = "@t_f";
            param7.Value = moTabla.PER_TELEFONO_FIJO;
            param7.DbType = DbType.String;
            moComm.Parameters.Add(param7);
            DbParameter param8 = moComm.CreateParameter();
            param8.ParameterName = "@t_c";
            param8.DbType = DbType.String;
            param8.Value = moTabla.PER_TELEFONO_CELULAR;
            moComm.Parameters.Add(param8);
            DbParameter param9 = moComm.CreateParameter();
            param9.ParameterName = "@direccion";
            param9.DbType = DbType.String;
            param9.Value = moTabla.PER_DIRECCION;
            moComm.Parameters.Add(param9);
            DbParameter param10 = moComm.CreateParameter();
            param10.ParameterName = "@estado";
            param10.DbType = DbType.String;
            param10.Value = tipo;
            moComm.Parameters.Add(param10);
            moConn.Open();
            moComm.ExecuteNonQuery();
            moConn.Close();
        }
        public DataTable Buspersona(string buscar)
        {
            string sSQL = @"select  PER_CI, PER_NOMBRES , PER_APELLIDO_PATERNO , PER_APELLIDO_MATERNO , PER_FECHA_NACIMIENTO ,PER_CORREO, PER_TELEFONO_FIJO, PER_TELEFONO_CELULAR,PER_DIRECCION
                from Persona ";
            if (buscar.Length > 0)
            {
                sSQL = sSQL.Trim() + " where PER_NOMBRES like '" + buscar + "%'";
            }
            sSQL = sSQL.Trim() + " ORDER by 1";
            DbCommand moComm = moConn.CreateCommand();
            moComm.CommandText = sSQL;
            DataTable table = new DataTable();
            moConn.Open();
            table.Load(moComm.ExecuteReader());
            moConn.Close();
            return table;
        }
        public DataTable listapersonas()
        {
            string sSQL = "select  PER_CI, PER_NOMBRES , PER_APELLIDO_PATERNO , PER_APELLIDO_MATERNO , PER_FECHA_NACIMIENTO ,PER_CORREO, PER_TELEFONO_FIJO, PER_TELEFONO_CELULAR,PER_DIRECCION from Persona";
            DbCommand moComm = moConn.CreateCommand();
            moComm.CommandText = sSQL;
            DataTable table = new DataTable();
            moConn.Open();
            table.Load(moComm.ExecuteReader());
            moConn.Close();
            return table;
        }

        public DataTable getPersonaby(string carnet)

        {

            DbCommand moComm = moConn.CreateCommand();
            moComm.CommandText = "getpersonaby";
            moComm.CommandType = CommandType.StoredProcedure;
            DbParameter param1 = moComm.CreateParameter();
            param1.ParameterName = "@p_ci ";
            param1.DbType = DbType.String;
            param1.Value = carnet;
            moComm.Parameters.Add(param1);
            moConn.Open();
            DataTable table = new DataTable();

            table.Load(moComm.ExecuteReader());
            moConn.Close();
            return table;
        }

        public void ABMCONDUTOR(Entidades.E_Conductor moTabla, string tipo)

        {
           

            DbCommand moComm = moConn.CreateCommand();
            moComm.CommandText = "abmConductor";
            moComm.CommandType = CommandType.StoredProcedure;
            DbParameter param1 = moComm.CreateParameter();
            param1.ParameterName = "@conductorid";
            param1.DbType = DbType.Int32;
            param1.Value = moTabla.Conductorid;
            moComm.Parameters.Add(param1);
            DbParameter param2 = moComm.CreateParameter();
            param2.ParameterName = "@licencia";
            param2.DbType = DbType.String;
            param2.Value = moTabla.Licencia;
            moComm.Parameters.Add(param2);
            DbParameter param3 = moComm.CreateParameter();
            param3.ParameterName = "@catergoria";
            param3.Value = moTabla.Categoriaid;
            param3.DbType = DbType.Int32;
            moComm.Parameters.Add(param3);
            DbParameter param4 = moComm.CreateParameter();
            param4.ParameterName = "@p_ci ";
            param4.Value = moTabla.p_ci;
            param4.DbType = DbType.String;
            moComm.Parameters.Add(param4);
            DbParameter param5 = moComm.CreateParameter();
            param5.ParameterName = "@estado";
            param5.DbType = DbType.String;
            param5.Value = tipo;
            moComm.Parameters.Add(param5);
            moConn.Open();
            moComm.ExecuteNonQuery();
            moConn.Close();
        }

        public DataTable getConductorby(int codigo,string carnet ,string estado)

        {

            DbCommand moComm = moConn.CreateCommand();
            moComm.CommandText = "getConductornaby";
            moComm.CommandType = CommandType.StoredProcedure;
            DbParameter param1 = moComm.CreateParameter();
            param1.ParameterName = "@conductorid";
            param1.DbType = DbType.Int32;
            param1.Value = codigo;
            moComm.Parameters.Add(param1);
            DbParameter param2 = moComm.CreateParameter();
            param2.ParameterName = "@p_ci ";
            param2.DbType = DbType.String;
            param2.Value = carnet;
            moComm.Parameters.Add(param2);
            DbParameter param3 = moComm.CreateParameter();
            param3.ParameterName = "@estado ";
            param3.DbType = DbType.String;
            param3.Value = estado;
            moComm.Parameters.Add(param3);
            moConn.Open();
            DataTable table = new DataTable();

            table.Load(moComm.ExecuteReader());
            moConn.Close();
            return table;
        }
        public DataTable CostoVacuna(string p_ci)
        {

            

            string sSQL = "select  PER_NOMBRES  from PERSONA where  PER_CI = '" +  p_ci + "'" ;
            DbCommand moComm = moConn.CreateCommand();
            moComm.CommandText = sSQL;
            DataTable table = new DataTable();
            moConn.Open();
            table.Load(moComm.ExecuteReader());
            moConn.Close();
            return table;
        }
        public DataTable Listapersonas()
        {
      
            string sSQL = "select PER_CI +' - '+ 'Nombre:'+ PER_NOMBRES +' - '+ 'AP_P:' + PER_APELLIDO_PATERNO +' - ' +'AP_M:'+ PER_APELLIDO_MATERNO as detalle , PER_CI as codigo  from PERSONA";
            DbCommand moComm = moConn.CreateCommand();
            moComm.CommandText = sSQL;
            DataTable table = new DataTable();
            moConn.Open();
            table.Load(moComm.ExecuteReader());
            moConn.Close();
            return table;
        }

        public DataTable Carnet()
        {

            string sSQL = " select PER_CI detalle , PER_CI as codigo from PERSONA A where NOT Exists(select *from conductor b where A.PER_CI = b.p_ci)";
            DbCommand moComm = moConn.CreateCommand();
            moComm.CommandText = sSQL;
            DataTable table = new DataTable();
            moConn.Open();
            table.Load(moComm.ExecuteReader());
            moConn.Close();
            return table;
        }

        public DataTable ListaCategoria()
        {

            string sSQL = "select nombre  as detalle , categoriaid as codigo  from categoria";
            DbCommand moComm = moConn.CreateCommand();
            moComm.CommandText = sSQL;
            DataTable table = new DataTable();
            moConn.Open();
            table.Load(moComm.ExecuteReader());
            moConn.Close();
            return table;
        }


            public void ABMAyudante(Entidades.E_Ayudante moTabla, string tipo)

        {
           

            DbCommand moComm = moConn.CreateCommand();
            moComm.CommandText = "abmAyudante";
            moComm.CommandType = CommandType.StoredProcedure;
            DbParameter param1 = moComm.CreateParameter();
            param1.ParameterName = "@ayudanteid";
            param1.DbType = DbType.Int32;
            param1.Value = moTabla.ayudanteid;
            moComm.Parameters.Add(param1);
            DbParameter param2 = moComm.CreateParameter();
            param2.ParameterName = "@p_ci ";
            param2.Value = moTabla.p_ci;
            param2.DbType = DbType.String;
            moComm.Parameters.Add(param2);
            DbParameter param3 = moComm.CreateParameter();
            param3.ParameterName = "@estado";
            param3.DbType = DbType.String;
            param3.Value = tipo;
            moComm.Parameters.Add(param3);
            moConn.Open();
            moComm.ExecuteNonQuery();
            moConn.Close();
        }
        public DataTable getAyundateby(int codigo, string carnet, string estado)

        {

            DbCommand moComm = moConn.CreateCommand();
            moComm.CommandText = "getAyudanternaby";
            moComm.CommandType = CommandType.StoredProcedure;
            DbParameter param1 = moComm.CreateParameter();
            param1.ParameterName = "@ayudanteid";
            param1.DbType = DbType.Int32;
            param1.Value = codigo;
            moComm.Parameters.Add(param1);
            DbParameter param2 = moComm.CreateParameter();
            param2.ParameterName = "@p_ci ";
            param2.DbType = DbType.String;
            param2.Value = carnet;
            moComm.Parameters.Add(param2);
            DbParameter param3 = moComm.CreateParameter();
            param3.ParameterName = "@estado ";
            param3.DbType = DbType.String;
            param3.Value = estado;
            moComm.Parameters.Add(param3);
            moConn.Open();
            DataTable table = new DataTable();

            table.Load(moComm.ExecuteReader());
            moConn.Close();
            return table;
        }

        public void ABMVEHICULO(Entidades.E_Vehiculo moTabla, string tipo)

        {


            DbCommand moComm = moConn.CreateCommand();
            moComm.CommandText = "abmVehiculo";
            moComm.CommandType = CommandType.StoredProcedure;
            DbParameter param1 = moComm.CreateParameter();
            param1.ParameterName = "@vehiculoid ";
            param1.DbType = DbType.Int32;
            param1.Value = moTabla.Vehiculoid;
            moComm.Parameters.Add(param1);
            DbParameter param2 = moComm.CreateParameter();
            param2.ParameterName = "@capacidadmax";
            param2.DbType = DbType.Int32;
            param2.Value = moTabla.Capacidadmax;
            moComm.Parameters.Add(param2);
            DbParameter param3 = moComm.CreateParameter();
            param3.ParameterName = "@pasajeromax";
            param3.Value = moTabla.Pasajeromax;
            param3.DbType = DbType.Int32;
            moComm.Parameters.Add(param3);
            DbParameter param4 = moComm.CreateParameter();
            param4.ParameterName = "@ACT_COD";
            param4.Value = moTabla.ACT_COD;
            param4.DbType = DbType.Int32;
            moComm.Parameters.Add(param4);
            DbParameter param5 = moComm.CreateParameter();
            param5.ParameterName = "@matricula";
            param5.DbType = DbType.String;
            param5.Value = moTabla.Matricula;
            moComm.Parameters.Add(param5);
            DbParameter param6 = moComm.CreateParameter();
            param6.ParameterName = "@volumenmaximo";
            param6.Value = moTabla.Volumenmaximo;
            param6.DbType = DbType.Int32;
            moComm.Parameters.Add(param6);
            DbParameter param7 = moComm.CreateParameter();
            param7.ParameterName = "@pesomaximo";
            param7.Value = moTabla.Pesomaximo;
            param7.DbType = DbType.Int32;
            moComm.Parameters.Add(param7);
            DbParameter param8 = moComm.CreateParameter();
            param8.ParameterName = "@estado";
            param8.DbType = DbType.String;
            param8.Value = tipo;
            moComm.Parameters.Add(param8);
            moConn.Open();
            moComm.ExecuteNonQuery();
            moConn.Close();
        }
        public DataTable getVehiculoby(int codigo, string carnet, string estado)

        {

            DbCommand moComm = moConn.CreateCommand();
            moComm.CommandText = "getVehiculoby";
            moComm.CommandType = CommandType.StoredProcedure;
            DbParameter param1 = moComm.CreateParameter();
            param1.ParameterName = "@vehiculoid";
            param1.DbType = DbType.Int32;
            param1.Value = codigo;
            moComm.Parameters.Add(param1);
            DbParameter param2 = moComm.CreateParameter();
            param2.ParameterName = "@matricula";
            param2.DbType = DbType.String;
            param2.Value = carnet;
            moComm.Parameters.Add(param2);
            DbParameter param3 = moComm.CreateParameter();
            param3.ParameterName = "@estado ";
            param3.DbType = DbType.String;
            param3.Value = estado;
            moComm.Parameters.Add(param3);
            moConn.Open();
            DataTable table = new DataTable();

            table.Load(moComm.ExecuteReader());
            moConn.Close();
            return table;
        }

        public DataTable getComboxby( int codigo , string estado)

        {

            DbCommand moComm = moConn.CreateCommand();
            moComm.CommandText = "combox";
            moComm.CommandType = CommandType.StoredProcedure;         
            DbParameter param1 = moComm.CreateParameter();
            param1.ParameterName = "@id";
            param1.DbType = DbType.Int32;
            param1.Value = codigo;
            moComm.Parameters.Add(param1);
            DbParameter param2 = moComm.CreateParameter();
            param2.ParameterName = "@estado ";
            param2.DbType = DbType.String;
            param2.Value = estado;
            moComm.Parameters.Add(param2);
            moConn.Open();
            DataTable table = new DataTable();

            table.Load(moComm.ExecuteReader());
            moConn.Close();
            return table;
        }

        public void CGM_PRO_INS(Entidades.E_Cargamento moTabla, string tipo)

        {

            DbCommand moComm = moConn.CreateCommand();
            moComm.CommandText = "CGM_PROC_INS";
            moComm.CommandType = CommandType.StoredProcedure;
            DbParameter param1 = moComm.CreateParameter();
            param1.ParameterName = "@cargamentoid";
            param1.DbType = DbType.Int32;
            param1.Value = moTabla.Cargamentoid;
            moComm.Parameters.Add(param1);
            DbParameter param2 = moComm.CreateParameter();
            param2.ParameterName = "@vehiculoid";
            param2.DbType = DbType.Int32;
            param2.Value = moTabla.Vehiculoid;
            moComm.Parameters.Add(param2);
            DbParameter param3 = moComm.CreateParameter();
            param3.ParameterName = "@total";
            param3.DbType = DbType.Int32;
            param3.Value = moTabla.TOTAL;
            moComm.Parameters.Add(param3);
            DbParameter param4 = moComm.CreateParameter();
            param4.ParameterName = "@numerooperacion";
            param4.Value = moTabla.NumeroOperaciones;
            param4.DbType = DbType.Int32;
            moComm.Parameters.Add(param4);
            DbParameter param5 = moComm.CreateParameter();
            param5.ParameterName = "@tipooperacion";
            param5.Value = moTabla.TipoOperaciones;
            param5.DbType = DbType.Int32;
            moComm.Parameters.Add(param5);
            DbParameter param6 = moComm.CreateParameter();
            param6.ParameterName = "@peso";
            param6.DbType = DbType.Int32;
            param6.Value = moTabla.Peso;
            moComm.Parameters.Add(param6);
            DbParameter param7 = moComm.CreateParameter();
            param7.ParameterName = "@volumen";
            param7.DbType = DbType.Int32;
            param7.Value = moTabla.Volumen;
            moComm.Parameters.Add(param7);
            DbParameter param8 = moComm.CreateParameter();
            param8.ParameterName = "@conductorid";
            param8.Value = moTabla.Conductorid;
            param8.DbType = DbType.Int32;
            moComm.Parameters.Add(param8);
            DbParameter param9 = moComm.CreateParameter();
            param9.ParameterName = "@ayudanteid";
            param9.DbType = DbType.Int32;
            param9.Value = moTabla.ayudanteid;
            moComm.Parameters.Add(param9);
            DbParameter param10 = moComm.CreateParameter();
            param10.ParameterName = "@olongitud";
            param10.DbType = DbType.Decimal;
            param10.Value = moTabla.Olongitud;
            moComm.Parameters.Add(param10);
            DbParameter param11 = moComm.CreateParameter();
            param11.ParameterName = "@olatitud";
            param11.Value = moTabla.Olatitud;
            param11.DbType = DbType.Decimal;
            moComm.Parameters.Add(param11);
            DbParameter param12 = moComm.CreateParameter();
            param12.ParameterName = "@dlongitud";
            param12.DbType = DbType.Decimal;
            param12.Value = moTabla.Dlongitud;
            moComm.Parameters.Add(param12);
            DbParameter param13 = moComm.CreateParameter();
            param13.ParameterName = "@dlatitud";
            param13.DbType = DbType.Decimal;
            param13.Value = moTabla.Dlatitud;
            moComm.Parameters.Add(param13);
            DbParameter param14 = moComm.CreateParameter();
            param14.ParameterName = "@cod_plan";
            param14.DbType = DbType.Int32;
            param14.Value = moTabla.Cod_Plan;
            moComm.Parameters.Add(param14);
            DbParameter param15 = moComm.CreateParameter();
            param15.ParameterName = "@estado";
            param15.DbType = DbType.String;
            param15.Value = tipo;
            moComm.Parameters.Add(param15);
            moConn.Open();
            moComm.ExecuteNonQuery();
            moConn.Close();
        }


    }
}
