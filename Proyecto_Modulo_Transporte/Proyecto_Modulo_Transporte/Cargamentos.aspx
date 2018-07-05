<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cargamentos.aspx.cs" Inherits="Proyecto_Modulo_Transporte.Cargamentos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>


     <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="keywords" content="footer, address, phone, icons" />

    <title>Transporte</title>

      <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
  <script type="text/javascript" src="http://maps.google.com/maps/api/js"></script>
  <script type="text/javascript" src="js/gmaps.js"></script>
  <link rel="stylesheet" href="http://twitter.github.com/bootstrap/1.3.0/bootstrap.min.css" />
    <link href="css/examples.css" rel="stylesheet" />
      <script type="text/javascript">
   var map;
          $(document).ready(function () {
                  $("#cargar").on("click", function (e) {

        e.preventDefault();
                      $lto = $("#lo").val();
                      $lgo  = $("#lgo").val();
                      $ltd = $("#lde").val();
                      $lgd  = $("#lgd").val();

              A($lto,$lgo,$ltd,$lgd);
   
    });







          });

          
          function A($lto,$lgo,$ltd,$lgd ) {
    
      map = new GMaps({
        el: '#map',
         lat:  -17.8145819,
         lng: -63.15608529999997

      });
      map.renderRoute({
        origin: [$lto,$lgo ],
           destination: [$ltd,$lgd ],
        travelMode: 'driving',
        strokeColor: '#131540',
        strokeOpacity: 0.6,
        strokeWeight: 6
      }, {
        panel: '#directions',
        draggable: true
                      });
                  }
  </script>
   
      <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
        <script src="scripts/jquery-1.3.2.min.js" type="text/javascript"></script>
    <link href="css/font-awesome.min.css" rel="stylesheet" />
 

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
    <br />
    <br />
    <br />

    <form id="form1" runat="server" method="post">
        <div class="container">

        <div class="row">
            <div class="col-xs-3">
    <asp:HiddenField ID="cargamentoIDHiddenField" runat="server" Value="0" />
                <input  ID="lo" runat="server" type="hidden" value="-17.7689777" class="form-control" />
                <input  ID="lgo" runat="server"  type="hidden" value="-63.18287069999997" class="form-control" />
                <asp:Label runat="server">Peso</asp:Label>

                <asp:TextBox id="peso" runat="server" CssClass="form-control"></asp:TextBox>
         
                  <asp:HiddenField ID="volumenes"  runat="server" Value="333" />

                    <asp:Label runat="server">Codigo Plan</asp:Label>
                <br />
                <asp:TextBox ID="cd" runat="server" CssClass="form-control" Text="1"></asp:TextBox>
                                <asp:Label runat="server">Costo Transporte</asp:Label>
                <br />
                <asp:TextBox ID="Costo" runat="server" CssClass="form-control" ></asp:TextBox>
                <br />
  <asp:Button ID="Calcular" Class="btn btn-primary btn-block" runat="server"  OnClick="Calcular_Click"  Text="CALCULAR"></asp:Button>


            </div>
            <div class="col-xs-3">
                <asp:Label runat="server">Latitud Destino</asp:Label>
                <br />
                <asp:TextBox ID="lde" Text="-17.9716723"  runat="server" CssClass="form-control"></asp:TextBox>
                <br />
                <asp:Label  runat="server">Longitud Destino</asp:Label>
                <br />
                <asp:TextBox id="lgd" Text=" -67.09313780000002"  CssClass="form-control" runat="server"></asp:TextBox>
            
                <asp:Label runat="server">Tipo Operaciones</asp:Label>
                <asp:DropDownList ID="tipo" CssClass="form-control" runat="server" OnSelectedIndexChanged="tipo_SelectedIndexChanged" AutoPostBack="True">
                                    
                          
                </asp:DropDownList>
                <br />
                <asp:Label runat="server">Numero Operaciones</asp:Label>
                <br />
                <asp:DropDownList ID="n_operacion" CssClass="form-control" runat="server" OnSelectedIndexChanged="n_operacion_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                     <asp:Label runat="server">Registrar Cargamento</asp:Label>
                <br />
                <asp:Button ID="Registrar_C" Class="btn btn-primary btn-block" runat="server"  OnClick="Registrar_C_Click"  Text="REGISTRAR CARGAMENTOS"></asp:Button>
            </div>
            <div class="col-xs-2">
                <asp:Label runat="server">Conductor</asp:Label>
                <br />
                <asp:DropDownList id="conductorid" CssClass="form-control" runat="server"></asp:DropDownList>
                <br />
                <asp:Label runat="server">Ayudante</asp:Label>
                <br />
                <asp:DropDownList ID="ayudanteids" CssClass="form-control" runat="server"></asp:DropDownList>
                      <asp:Label runat="server">Vehiculo</asp:Label>
                <br />
                <asp:DropDownList ID="vehiculoId" CssClass="form-control" runat="server"></asp:DropDownList>
                   <br />
           

                  <asp:HiddenField ID="totales"  runat="server" Value="0" />



            </div>

              <div class="col-xs-2">
                <br />
                <input ID="cargar" type="submit"  class="btn btn-danger" value="Mostrar Mapa" />                                 

            </div>
        </div>






    </div>
    

    </form>

<h1>GMaps.js &mdash; Routes</h1>
  <div class="row">
    <div class="span11">
      <div id="map"></div>
      <div id="directions"></div>
    </div>
    <div class="span6">
      <p>With GMaps.js you can render a directions panel using the following code:</p>
      <pre>map.renderRoute({
  origin: [-38.330766, 144.695692],
  destination: [-39.927193, 175.053218],
  travelMode: 'driving',
  strokeColor: '#131540',
  strokeOpacity: 0.6,
  strokeWeight: 6
}, {
  panel: '#directions',
  draggable: true
});</pre>
      <p>You must define two points (<strong>origin</strong> and <strong>destination</strong>) and color, opacity and weight of the route in the map.</p>
      <p>Also, you can define a <code>travelMode</code>: <code>driving</code>, <code>bicycling</code> or <code>walking</code>. Default is <code>walking</code></p>
    </div>
  </div>
 <%--<div class="row">
    <div class="col-md-12">
        <h2>Example 1 - simple distance between two points</h2>
        <p>
            This demonstrates getting and displaying the distance between two points
        </p>

        <div>
            <div>
                Travel From : <input id="travelfrom" type="text" name="name" value="Chichester, UK" />
                To : <input id="travelto" type="text" name="name" value="Goodwood aerodrome, UK" />
                <input type="button" value="Get Route" onclick="GetRoute()" />

            </div>
            <br />
            <div>
                <div id="dvDistance">
                </div>
            </div>

        </div>

        <div id="dvMap" style="min-height:500px"></div>

    </div>
</div>



   <!--ENSURE YOU CHANGE TO YOUR OWN API KEY HERE !!! --> 
   <script src="https://maps.googleapis.com/maps/api/js?libraries=places&key=YOUR_KEY" type="text/javascript"></script>

    <!-- code for example 1 -->
    <script> 

        var source, destination;
        var directionsDisplay;
        var directionsService = new google.maps.DirectionsService();

        // initialise the location of the map on Chichester in England (ref lat and lng)
        var map = new google.maps.Map(document.getElementById('dvMap'), {
            center: { lat: 50.834697, lng: -0.773792 },
            zoom: 13,
            mapTypeId: 'roadmap'
        });

        google.maps.event.addDomListener(window, 'load', function () {
            new google.maps.places.SearchBox(document.getElementById('travelfrom'));
            new google.maps.places.SearchBox(document.getElementById('travelto'));
            directionsDisplay = new google.maps.DirectionsRenderer({ 'draggable': true });
        });

        function GetRoute() {
           
            directionsDisplay.setMap(map);

            source = document.getElementById("travelfrom").value;
            destination = document.getElementById("travelto").value;

            var request = {
                origin: source,
                destination: destination,
                travelMode: google.maps.TravelMode.DRIVING
            };

            directionsService.route(request, function (response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    directionsDisplay.setDirections(response);
                }
            });

            //*********DISTANCE AND DURATION**********************//
            var service = new google.maps.DistanceMatrixService();
            service.getDistanceMatrix({
                origins: [source],
                destinations: [destination],
                travelMode: google.maps.TravelMode.DRIVING,
                unitSystem: google.maps.UnitSystem.METRIC,
                avoidHighways: false,
                avoidTolls: false
            }, function (response, status) {

                if (status == google.maps.DistanceMatrixStatus.OK && response.rows[0].elements[0].status != "ZERO_RESULTS") {
                    var distance = response.rows[0].elements[0].distance.text;
                    var duration = response.rows[0].elements[0].duration.value;
                    var dvDistance = document.getElementById("dvDistance");
                    duration = parseFloat(duration / 60).toFixed(2);
                    dvDistance.innerHTML = "";
                    dvDistance.innerHTML += "Distance: " + distance + "<br />";
                    dvDistance.innerHTML += "Time:" + duration + " min";

                } else {
                    alert("Unable to find the distance via road.");
                }
            });
        }

    </script>--%>

    

 

         <%--   <div id="map"></div>
    <script>

      var map;
      function initMap() {
       var myLatlng = {lat: -25.363, lng: 131.044};

  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 4,
    center: myLatlng
  });

  var marker = new google.maps.Marker({
    position: myLatlng,
    map: map,
    title: 'Click to zoom'
  });

  map.addListener('center_changed', function() {
    // 3 seconds after the center of the map has changed, pan back to the
    // marker.
    window.setTimeout(function() {
      map.panTo(marker.getPosition());
    }, 3000);
  });

  marker.addListener('click', function() {
    map.setZoom(8);
    map.setCenter(marker.getPosition());
  });

   
    </script>     }--%>
 
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA7YLCnq8DXq9fW1DHzGmrWbgZl6JhEUmI"
  type="text/javascript"></script>

    <script src="js/jquery.js"></script>
    <script src="js/jquery-1.11.3.min.js"></script>
       <script src="js/bootstrap.min.js"></script>

</body>
</html>
