<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Persona.aspx.cs" Inherits="Proyecto_Modulo_Transporte.Persona" %>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <link href="css/pikaday.css" rel="stylesheet" />
    <link href="css/site.css" rel="stylesheet" />

    <title></title>






</head>
<body>
    <div id="form2" runat="server">
        <div class=" navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="bordetTop"></div>
            <div class="bordetTop1"></div>
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="Index.aspx"><span></span>Modulo Transporte </a>
                </div>


                <div class="navbar-collapse collapse ">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">vehiculo</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">CONDUCTORES
        <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Registrar Conductores</a></li>
                                <li><a href="#">Mostrar Conductores</a></li>

                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">AYUDANTES
        <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Registrar Ayudante</a></li>
                                <li><a href="#">Mostrar Ayudante</a></li>

                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">PERSONAS
        <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Registrar Personas</a></li>
                                <li><a href="#">Registrar Personas_J</a></li>
                                <li><a href="#">Mostrar Personas</a></li>
                                <li><a href="#">Mostrar Personas_J</a></li>

                            </ul>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
    </div>


    <br />
    <br />
    <br />






    <form id="form1" runat="server" method="POST">

  

        <div class="container">


            <!-- Trigger the modal with a button -->
            <button type="button" class="btn btn-danger btn-lg" data-toggle="modal" data-target="#myModal">REGISTRAR</button>


            <br />
                <br />
            <!-- Modal -->
            <div class="modal fade" id="myModal"  runat="server" role="document">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">REGISTRAR PERSONAS</h4>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <div class="row">
                                    <div class="col-xs-3">
                                   
                                            <asp:Label runat="server">Carnet </asp:Label>
                                        <br />
                                        <asp:TextBox ID="p_ci" runat="server" CssClass="form-control"></asp:TextBox>
                                        <br />
                                        <asp:Label runat="server">Nombre </asp:Label>
                                        <br />
                                        <asp:TextBox ID="nombre" runat="server" CssClass="form-control"></asp:TextBox>
                                        <br />
                                        <asp:Label runat="server">Apellido Materno</asp:Label>
                                        <br />
                                        <asp:TextBox ID="Ap_materno" CssClass="form-control" runat="server"></asp:TextBox>
                                        <asp:Label runat="server">Correo Electronico</asp:Label>

                                        <asp:TextBox ID="correo" runat="server" CssClass="form-control"></asp:TextBox>
                                        <br />
                                        <asp:Label runat="server">Telefono Celular</asp:Label>
                                        <asp:TextBox  id="Telefonoc"  runat="server" CssClass="form-control"></asp:TextBox>


                                    </div>
                                    <div class="col-xs-3">
                                        <asp:Label runat="server">Apellido Paterno</asp:Label>
                                        <asp:TextBox ID="Ap_paterno" runat="server" CssClass="form-control"></asp:TextBox>
                                        <br />
                                            <asp:Label runat="server">Fecha Nacimiento</asp:Label>
                                         <script src="Scripts/pikaday.js"></script>
                                     
                                         <asp:TextBox ID="fecha" runat="server" CssClass="form-control"></asp:TextBox>
                                        <script src="js/z_pikaday.js"></script>
          <script src="js/pikaday.js"></script>
    <script>
        var picker = new Pikaday(
        {
            field: document.getElementById('fecha'),
            firstDay: 1,
            minDate: new Date(),
            maxDate: new Date(2020, 12, 31),
            yearRange: [2000, 2020]
        });
    </script>
                        
                                        <br />
                                        <asp:Label runat="server">Telefono Fijo</asp:Label>
                                        <br />
                                        <asp:TextBox ID="Telefonof" CssClass="form-control" runat="server"></asp:TextBox>

                                        <asp:Label runat="server">Direccion</asp:Label>
                                        <asp:TextBox id="Direccion" runat="server" CssClass="form-control"></asp:TextBox>
                               

                                    </div>

                                </div>
                            </div>
                            <div class="modal-footer">
  
                                <asp:Button  id="T"  runat="server" Text="Registrar"  OnClick="T_Click"  class="btn btn-primary btn-block"   />



                            </div>
                        </div>

                    </div>

                </div>
            </div>
            <input id="tx" runat="server" type="hidden" value=""/>
 
               <div class="col-xs-9">
            <asp:TextBox  ID="buscar" runat="server" CssClass="form-control"></asp:TextBox>
                   </div>
               <div class="col-xs-2">


            <asp:Button  style="width:200px;" id="btnbuscar" onclick="btnbuscar_Click" Text="Buscar" type="submit" runat="server" class=" btn btn-primary" >
             
            </asp:Button>
                   </div>
            <br />
               <br />


        

            <asp:GridView ID="tablapersona" CssClass="table table-hover table-dark " runat="server" AutoGenerateColumns="False"  CellPadding="4"  AllowPaging="True"  BackColor="White" BorderColor="#CCCCCC" GridLines="None"  BorderStyle="None" BorderWidth="1px"  PageSize="5" ForeColor="Black" OnPageIndexChanging="tablapersona_PageIndexChanging" >
              <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns >
                    <asp:BoundField ControlStyle-CssClass="form-control" DataField="p_ci" HeaderText="Carnet Identidad" ReadOnly="True" SortExpression="p_ci" >
<ControlStyle CssClass="form-control"></ControlStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="p_nombres" HeaderText="Nombre" SortExpression="p_nombres" />
                    <asp:BoundField DataField="p_apellido_paterno" HeaderText="Apellido Paterno" SortExpression="p_apellido_paterno" />
                    <asp:BoundField DataField="p_apellido_materno" HeaderText="Apellido Materno" SortExpression="p_apellido_materno" />
                    <asp:BoundField DataField="p_fecha_nacimiento" HeaderText="fecha Nacimiento" SortExpression="p_fecha_nacimiento" />
                    <asp:BoundField DataField="p_correo"   HeaderText="Correo" SortExpression="p_correo" />
                    <asp:BoundField DataField="p_telefono_fijo" HeaderText="Telefono Fijo" SortExpression="p_telefono_fijo" />
                    <asp:BoundField DataField="p_telefono_celular" HeaderText="Telefono Celular" SortExpression="p_telefono_celular" />
                    <asp:BoundField DataField="p_direccion" HeaderText="Direccion" SortExpression="p_direccion" />
                   <asp:TemplateField HeaderText="Actulizar">
                       

                        <ItemTemplate>
                        <asp:LinkButton id="E"  runat="server" data-id='<%# Eval("p_ci") %>'   CommandName="Actulizar"  CssClass="E"
                                     CommandArgument='<%# Eval("p_ci") %>'  >     
                            <i class="glyphicon glyphicon-pencil" ></i>   
                      
                            </asp:LinkButton>
                        </ItemTemplate>
      
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <asp:LinkButton ID="EliminarButton" runat="server" CommandName="Eliminar" CssClass="EliminarButton"   
                                OnClientClick="return confirm('Esta seguro Eliminar este Cliente?')"
                                CommandArgument='<%# Eval("p_ci") %>'>
                                    <i class="glyphicon glyphicon-remove"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
       
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="Black" ForeColor="White" HorizontalAlign="Center" />
                  <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
 
        </div>
    </form>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <script src="js/persona.js"></script>
    <script src="js/moment.js"></script>
    <script src="js/moment.min.js"></script>

</body>
<script src="js/bootstrap.min.js"></script>
<%--          <script src="js/jquery.js"></script>
    <script src="js/jquery-1.11.3.min.js"></script>--%>
</html>
