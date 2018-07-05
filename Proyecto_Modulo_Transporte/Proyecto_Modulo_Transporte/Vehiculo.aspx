<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Vehiculo.aspx.cs" Inherits="Proyecto_Modulo_Transporte.Vehiculo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Vehiculo</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
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


            <%--            <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">PERSONAS
        <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Registrar Personas</a></li>
                                <li><a href="#">Registrar Personas_J</a></li>
                                <li><a href="#">Mostrar Personas</a></li>
                                <li><a href="#">Mostrar Personas_J</a></li>

                            </ul>
                        </li>--%>

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
                            <h4 class="modal-title">REGISTRAR VEHICULO</h4>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <div class="row">
                                    <div class="col-xs-3">
                                           <asp:Label runat="server">Capacidad Maxima </asp:Label>
                                        <br />
                                        <asp:TextBox ID="Capacidad" runat="server" CssClass="form-control"></asp:TextBox>
                                        <br />
                                        <asp:Label runat="server">Matricula </asp:Label>
                                        <br />
                                        <asp:TextBox ID="matricula" runat="server"   CssClass="form-control"    > </asp:TextBox>
                                    <br />
                                        <asp:Label runat="server">Peso Maximo </asp:Label>
                                        <br />
                                        <asp:TextBox ID="PesoMaximo" runat="server"   CssClass="form-control"    > </asp:TextBox>
                                   
                                       

                                       


                                    </div>
                                    <div class="col-xs-3">
                                       
                                           
                                        <asp:Label runat="server">Pasajero Maximo </asp:Label>
                                        <br />
                                        <asp:TextBox ID="pasajeromaximo" runat="server"   CssClass="form-control"    > </asp:TextBox>
                                            <br />
                                                 <asp:Label runat="server">Volumen Maximo </asp:Label>
                                    
                                        <asp:TextBox ID="VolumenMaximo" runat="server"   CssClass="form-control"  > </asp:TextBox>
                                   
                                                     <asp:Label runat="server">Activos </asp:Label>
                                      <asp:TextBox ID="Act" runat="server"   CssClass="form-control" Text="1" > </asp:TextBox>

                                        
                                 

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
            
            
                    <asp:BoundField DataField="capacidadmax" HeaderText="Capacidad Maxima" SortExpression="capacidadmax" />
                    <asp:BoundField DataField="pasajeromax" HeaderText="Pasajero Maximo" SortExpression="pasajeromax" />
                    <asp:BoundField DataField="Matricula" HeaderText="Matricula" SortExpression="Matricula" />
                    <asp:BoundField DataField="volumenmaximo"   HeaderText="Volumane Maximo" SortExpression="volumenmaximo" />
                    <asp:BoundField DataField="pesomaximo" HeaderText="Peso Maximo" SortExpression="pesomaximo" />
                    <asp:BoundField DataField="ACT_COD" HeaderText="Activo Fijos" SortExpression="ACT_COD" />
                   <asp:TemplateField HeaderText="Actulizar">
                       

                        <ItemTemplate>
                        <asp:LinkButton id="E"  runat="server" data-id='<%# Eval("vehiculoid") %>'   CommandName="Actulizar"  CssClass="E"
                                     CommandArgument='<%# Eval("vehiculoid") %>'  >     
                            <i class="glyphicon glyphicon-pencil" ></i>   
                      
                            </asp:LinkButton>
                        </ItemTemplate>
      
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <asp:LinkButton ID="EliminarButton" runat="server" data-id='<%# Eval("vehiculoid") %>'   CommandName="Eliminar" CssClass="EliminarButton"   
                     
                                CommandArgument='<%# Eval("vehiculoid") %>'>
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

    <script src="js/Vehiculo.js"></script>
</body>
</html>
