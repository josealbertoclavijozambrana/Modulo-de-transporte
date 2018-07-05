$(document).ready(function () {
    $("#T").on("click", function (e) {

        e.preventDefault();

        if ($("#tx").val() === "") {
            alert("defensa");
            insertarayudante();

        } else {
            alert("actulizar");
            actualizarayudante();
        }
    });




    $(".E").on("click", function (e) {
        var clickeado = $(this);
        e.preventDefault();
        editayudante(clickeado.data('id'));

    });

    $(".EliminarButton").on("click", function (e) {
        var clickeado = $(this);
        e.preventDefault();
        eliminarayudante(clickeado.data('id'));

    });

    $("#carnet").change(function () {

        listadopersona();
    });

    //var tabla, data;

    //function addRowDt(data) {
    //    tabla = $("").DataTable();
    //    for (var o = 0; i < data.length; i++) {
    //        tabla.fnAddData([data[i].p_ci);
    //    }
    //}

    
});
function insertarayudante() {

    var data = {
        objayudante: {
            p_ci: $("#carnet").val()
        }
    }

    $.ajax({

        type: "POST",
        url: "Ayudante.aspx/Registraayudante",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        dataType: "json",

        success: function (data) {

            $('#myModal').modal('hide'),
                $('#tablapersona').show()
            $('#tx').val("");
            fillLimpiarayudante();
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

function actualizarayudante() {


    var data = {
        objayudante: {
            ayudanteid: $(".E").val(),
            p_ci: $("#carnet").val()

        }
    }

    $.ajax({

        type: "POST",
        url: "Ayudante.aspx/ActulizarAyudante",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $('#myModal').modal('hide'),
                $('#tablapersona').show()
            fillLimpiarayudante();
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




function fillLimpiarayudante() {


    $('#carnet').val(null);
    $('#nombre').val("");
    $('#Ap_paterno').val("");
    $('#Ap_materno').val("");
    $('#Telefonof').val("");
    $('#correo').val("");
    $('#Telefonoc').val("");
    $('#Direccion').val("");
   



}

function editayudante(id) {
    $('#tx').val("1");
    var data = {
        Listaayudante: id

   
    };

    $.ajax({

        type: "POST",
        url: "Ayudante.aspx/Listageneral",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $('#myModal').modal('show'),
                fillModalDatacAyudante(data.d)



        },
        error: function (msg) {
            console.log(msg);
        }


    }).done(function (info) {
        console.log(info);
    })

}

function eliminarayudante(id) {
    $('#tx').val("");
    var data = {
        Listaayudante: id


    };

    $.ajax({

        type: "POST",
        url: "Ayudante.aspx/Eliminar",
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


function listadopersona() {

    var data = {
        objayudante: {

            p_ci: $("#carnet").val()
        }
    }

    $.ajax({

        type: "POST",
        url: "Ayudante.aspx/Listaayudante",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            fillModalistadotextob(data.d)



        },
        error: function (msg) {
            console.log(msg);
        }


    }).done(function (info) {
        console.log(info);
    })

}

function fillModalistadotextob(objayudante) {


    $('#nombre').val(objayudante.PER_NOMBRES);
    $('#Ap_paterno').val(objayudante.PER_APELLIDO_PATERNO);
    $('#Ap_materno').val(objayudante.PER_APELLIDO_MATERNO);
    $('#correo').val(objayudante.PER_CORREO);
    $('#Telefonof').val(objayudante.PER_TELEFONO_FIJO);
    $('#Telefonoc').val(objayudante.PER_TELEFONO_CELULAR);
    $('#Direccion').val(objayudante.PER_DIRECCION);

}

function fillModalDatacAyudante(objayudante) {

    $('.E').val(objayudante.ayudanteid);
    $('#carnet').val(objayudante.p_ci);
    $('#nombre').val(objayudante.PER_NOMBRES);
    $('#Ap_paterno').val(objayudante.PER_APELLIDO_PATERNO);
    $('#Ap_materno').val(objayudante.PER_APELLIDO_MATERNO);
    $('#correo').val(objayudante.PER_CORREO);
    $('#Telefonof').val(objayudante.PER_TELEFONO_FIJO);
    $('#Telefonoc').val(objayudante.PER_TELEFONO_CELULAR);
    $('#Direccion').val(objayudante.PER_DIRECCION);





}
