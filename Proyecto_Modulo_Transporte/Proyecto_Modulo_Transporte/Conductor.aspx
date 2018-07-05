<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Conductor.aspx.cs" Inherits="Proyecto_Modulo_Transporte.Conductor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <title>Conductor</title>
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
                 <li><a href="Vehiculo.aspx">VEHICULO</a></li>
                  <li><a href="Conductor.aspx">CONDUCTOR</a></li>
                 <li><a href="Ayudante.aspx">AYUDANTE</a></li>
                 <li><a href="Cargamentos.aspx">CARGAMENTO</a></li>


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
                            <h4 class="modal-title">REGISTRAR CONDUCTORES</h4>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <div class="row">
                                    <div class="col-xs-3">
                                           <asp:Label runat="server">Licencia </asp:Label>
                                        <br />
                                        <asp:TextBox ID="Licencia" runat="server" CssClass="form-control"></asp:TextBox>
                                        <br />
                                        <asp:Label runat="server">Carnet </asp:Label>
                                        <br />
                                        <asp:ListBox ID="carnet" runat="server"   CssClass="form-control"  style="width:560px;"  > </asp:ListBox>
                                   
                                       


                                    </div>
                                    <div class="col-xs-3">
                                       
                                           
                                          <asp:Label runat="server">Categoria </asp:Label>
                                        <br />

                                        <asp:DropDownList ID="categoria" runat="server" CssClass="form-control"> </asp:DropDownList>
                                  
                                        
                                 

                                    </div>

                                </div>
                            </div>
                            <div class="modal-footer">
  
                                <asp:Button  id="T"  runat="server" Text="Registrar"   class="btn btn-primary btn-block"   />



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

            <asp:Button  style="width:200px;" id="btnbuscar"  Text="Buscar" type="submit" OnClick="btnbuscar_Click" runat="server" class=" btn btn-primary" >
             
            </asp:Button>
                   </div>
            <br />
               <br />


        

            <asp:GridView ID="tablapersona" CssClass="table table-hover table-dark " runat="server" AutoGenerateColumns="False"  CellPadding="4"  AllowPaging="True"  BackColor="White" BorderColor="#CCCCCC" GridLines="None"  BorderStyle="None" BorderWidth="1px"  PageSize="5" ForeColor="Black" OnPageIndexChanging="tablapersona_PageIndexChanging" >
              <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns >
                    <asp:BoundField ControlStyle-CssClass="form-control" DataField="PER_CI" HeaderText="Carnet Identidad" ReadOnly="True" SortExpression="PER_CI" >
<ControlStyle CssClass="form-control"></ControlStyle>
                    </asp:BoundField>
                        <asp:BoundField DataField="PER_NOMBRES" HeaderText="Nombre" SortExpression="PER_NOMBRES" />
                    <asp:BoundField DataField="PER_NOMBRES" HeaderText="Nombre" SortExpression="PER_NOMBRES" />
                    <asp:BoundField DataField="PER_APELLIDO_PATERNO" HeaderText="Apellido Paterno" SortExpression="PER_APELLIDO_PATERNO" />
                    <asp:BoundField DataField="PER_APELLIDO_MATERNO" HeaderText="Apellido Materno" SortExpression="PER_APELLIDO_MATERNO" />
                    <asp:BoundField DataField="PER_CORREO"   HeaderText="Correo" SortExpression="PER_CORREO" />
                    <asp:BoundField DataField="PER_TELEFONO_FIJO" HeaderText="Telefono Fijo" SortExpression="PER_TELEFONO_FIJO" />
                    <asp:BoundField DataField="PER_TELEFONO_CELULAR" HeaderText="Telefono Celular" SortExpression="PER_TELEFONO_CELULAR" />
                    <asp:BoundField DataField="PER_DIRECCION" HeaderText="Direccion" SortExpression="PER_DIRECCION" />
                    <asp:BoundField DataField="licencia" HeaderText="Licencia" SortExpression="b.licencia" />
                    <asp:BoundField DataField="nombre" HeaderText="Direccion" SortExpression="nombre" />
                   <asp:TemplateField HeaderText="Actulizar">
                       

                        <ItemTemplate>
                        <asp:LinkButton id="E"  runat="server" data-id='<%# Eval("conductorid") %>'   CommandName="Actulizar"  CssClass="E"
                                     CommandArgument='<%# Eval("conductorid") %>'  >     
                            <i class="glyphicon glyphicon-pencil" ></i>   
                      
                            </asp:LinkButton>
                        </ItemTemplate>
      
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <asp:LinkButton ID="EliminarButton" runat="server" data-id='<%# Eval("conductorid") %>'   CommandName="Eliminar" CssClass="EliminarButton"   
                     
                                CommandArgument='<%# Eval("conductorid") %>'>
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
    <script src="js/conductor.js"></script>
</body>
</html>
