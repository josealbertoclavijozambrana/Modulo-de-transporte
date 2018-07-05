$(document).ready(function () {
    $("#T").on("click", function (e) {

        e.preventDefault();

        if ($("#tx").val() === "") {
            alert("defensa");
            insertarvehiculo();

        } else {
            alert("actulizar");
            actualizarvehiculo();
        }
    });




    $(".E").on("click", function (e) {
        var clickeado = $(this);
        e.preventDefault();
        editobjvehiculo(clickeado.data('id'));

    });

    $(".EliminarButton").on("click", function (e) {
        var clickeado = $(this);
        e.preventDefault();
        eliminarvehiculo(clickeado.data('id'));

    });

 

    //var tabla, data;

    //function addRowDt(data) {
    //    tabla = $("").DataTable();
    //    for (var o = 0; i < data.length; i++) {
    //        tabla.fnAddData([data[i].p_ci);
    //    }
    //}

    
});
function insertarvehiculo() {

    var data = {
        objvehiculo: {
            Capacidadmax: $("#Capacidad").val(),
            Matricula: $("#matricula").val(),
            Pesomaximo: $("#PesoMaximo").val(),
            Volumenmaximo: $("#VolumenMaximo").val(),
            ACT_COD: $("#Act").val(),
            Pasajeromax: $("#pasajeromaximo").val()

        }
    }

    $.ajax({

        type: "POST",
        url: "Vehiculo.aspx/RegistraVehiculo",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        dataType: "json",

        success: function (data) {

            $('#myModal').modal('hide'),
                $('#tablapersona').show()
            $('#tx').val("");
            fillLimpiareditobjvehiculo();
            location.reload();

    

            console.log("hola")

        },
        error: function (msg) {
            console.log(msg);
            alert(msg);
        }


    }).done(function (info) {
        console.log(info);
    })
}

function actualizarvehiculo() {


    var data = {
        objvehiculo: {
            Vehiculoid: $(".E").val(),
            Capacidadmax: $("#Capacidad").val(),
            Matricula: $("#matricula").val(),
            Pesomaximo: $("#PesoMaximo").val(),
            Volumenmaximo: $("#VolumenMaximo").val(),
            ACT_COD: $("#Act").val(),
            Pasajeromax: $("#pasajeromaximo").val()
        }
    }

    $.ajax({

        type: "POST",
        url: "Vehiculo.aspx/ActulizarVehiculo",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $('#myModal').modal('hide'),
                $('#tablapersona').show()
            fillLimpiareditobjvehiculo();
            location.reload();
            $('#tx').val("");
    


        },
        error: function (msg) {
            console.log(msg);
        }


    }).done(function (info) {
        console.log(info);
    })


}

function fillModalDatacVehiculo(objvehiculo) {

    $('.E').val(objvehiculo.Vehiculoid);
    $('#Capacidad').val(objvehiculo.Capacidadmax);
    $('#matricula').val(objvehiculo.Matricula);
    $('#PesoMaximo').val(objvehiculo.Pesomaximo);
    $('#VolumenMaximo').val(objvehiculo.Volumenmaximo);
    $('#Act').val(objvehiculo.ACT_COD);
    $('#pasajeromaximo').val(objvehiculo.Pasajeromax);


}


function fillLimpiareditobjvehiculo() {


    $('#Capacidad').val("");
    $('#matricula').val("");
    $('#PesoMaximo').val("");
    $('#VolumenMaximo').val("");
    $('#pasajeromaximo').val("");
   



}

function editobjvehiculo(id) {
    $('#tx').val("1");
    var data = {
        Listavehiculo: id

   
    };

    $.ajax({

        type: "POST",
        url: "Vehiculo.aspx/Listavehiculo",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $('#myModal').modal('show'),
                fillModalDatacVehiculo(data.d)



        },
        error: function (msg) {
            console.log(msg);
        }


    }).done(function (info) {
        console.log(info);
    })

}

function eliminarvehiculo(id) {
    $('#tx').val("");
    var data = {
        Listavehiculo: id


    };

    $.ajax({

        type: "POST",
        url: "Vehiculo.aspx/Eliminar",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
   
            $('#tablapersona').show()
            location.reload();

        },
        error: function (msg) {
            console.log(msg);
        }


    }).done(function (info) {
        console.log(info);
    })

}


