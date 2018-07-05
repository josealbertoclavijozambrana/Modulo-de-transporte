$(document).ready(function () {
    $("#T").on("click", function (e) {

        e.preventDefault();

        if ($("#tx").val() === "") {
            alert("defensa");
            insertar();

        } else {
            alert("actulizar");
            actualizar();
        }
    });




    $(".E").on("click", function (e) {
        var clickeado = $(this);
        e.preventDefault();
        edit(clickeado.data('id'));

    });

    $(".EliminarButton").on("click", function (e) {
        var clickeado = $(this);
        e.preventDefault();
        eliminar(clickeado.data('id'));

    });

    

    //var tabla, data;

    //function addRowDt(data) {
    //    tabla = $("").DataTable();
    //    for (var o = 0; i < data.length; i++) {
    //        tabla.fnAddData([data[i].p_ci);
    //    }
    //}


});
function insertar() {


    var data = {
        objpersona: {

            p_ci: $("#p_ci").val(),
            Nombre: $("#nombre").val(),
            ApellidoPaterno: $("#Ap_paterno").val(),
            ApellidoMaterno: $("#Ap_materno").val(),
            Fecha_Nacimiento: $("#fecha").val(),
            correo: $("#correo").val(),
            Telefono_Fijo: $("#Telefonof").val(),
            Telefono_Celular: $("#Telefonoc").val(),
            Direccion: $("#Direccion").val()
        }
    }

    $.ajax({

        type: "POST",
        url: "Persona.aspx/Registrapersona",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        dataType: "json",

        success: function (data) {

            $('#myModal').modal('hide'),
                $('#tablapersona').show()
            fillLimpiar();
            $('#tx').val("");
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

function actualizar() {


    var data = {
        objpersona: {

            p_ci: $("#p_ci").val(),
            Nombre: $("#nombre").val(),
            ApellidoPaterno: $("#Ap_paterno").val(),
            ApellidoMaterno: $("#Ap_materno").val(),
            Fecha_Nacimiento: $("#fecha").val(),
            correo: $("#correo").val(),
            Telefono_Fijo: $("#Telefonof").val(),
            Telefono_Celular: $("#Telefonoc").val(),
            Direccion: $("#Direccion").val()
        }
    }

    $.ajax({

        type: "POST",
        url: "Persona.aspx/Actulizarpersona",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $('#myModal').modal('hide'),
                $('#tablapersona').show()
            fillLimpiar();
            $('#tx').val("");
            location.reload();


        },
        error: function (msg) {
            console.log(msg);
        }


    }).done(function (info) {
        console.log(info);
    })


}

function fillModalData(objPersona) {
    $('#p_ci').val(objPersona.p_ci);
    $('#nombre').val(objPersona.Nombre);
    $('#Ap_paterno').val(objPersona.ApellidoPaterno);
    $('#Ap_materno').val(objPersona.ApellidoMaterno);
    $('#fecha').val(objPersona.Fecha_Nacimiento);
    $('#Telefonof').val(objPersona.Telefono_Fijo);
    $('#correo').val(objPersona.correo);
    $('#Telefonoc').val(objPersona.Telefono_Celular);
    $('#Direccion').val(objPersona.Direccion);



}

function fillLimpiar() {
    $('#p_ci').val("");
    $('#nombre').val("");
    $('#Ap_paterno').val("");
    $('#Ap_materno').val("");
    $('#fecha').val("");
    $('#Telefonof').val("");
    $('#correo').val("");
    $('#Telefonoc').val("");
    $('#Direccion').val("");



}

function edit(id) {
    $('#tx').val("1");
    var data = {
        Listapersona: id

   
    };

    $.ajax({

        type: "POST",
        url: "Persona.aspx/Listapersona",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $('#myModal').modal('show'),
                fillModalData(data.d)



        },
        error: function (msg) {
            console.log(msg);
        }


    }).done(function (info) {
        console.log(info);
    })

}

function eliminar(id) {
    $('#tx').val("");
    var data = {
        Listapersona: id


    };

    $.ajax({

        type: "POST",
        url: "Persona.aspx/Eliminar",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
   
            $('#tablapersona').show()


        },
        error: function (msg) {
            console.log(msg);
        }


    }).done(function (info) {
        console.log(info);
    })

}





        //$.ajax({
        //    url: "Persona.aspx/formulario",
        //    type: "GET",
        //    dataType: 'json',
        //    success: function (data) {
        //        $("#p_ci").val(data.toufixhour);
        //        $("#nombre").val(data.Nombre);
        //        $("#Ap_paterno").val(data.ApellidoPaterno),
        //        $("#Ap_materno").val(data.ApellidoPaterno),
        //        $("#fecha").val(data.Fecha_Nacimiento),
        //            $("#correo").val(data.correo),
        //            $("#Telefonof").val(data.Telefono_Fijo),
        //            $("#Telefonoc").val(data.Telefono_Celular),
        //            $("#Direccion").val(data.Direccion)
        //        alert(data);




//}
//function __registrar() {
//    $("#form1").on("submit", function (e) {
//        e.preventDefault();

//        var data = {
//         objpersona : {

//            p_ci: $("#p_ci").val(),
//            Nombre: $("#nombre").val(),
//            ApellidoPaterno: $("#Ap_paterno").val(),
//            ApellidoMaterno: $("#Ap_materno").val(),
//            Fecha_Nacimiento: $("#fecha").val(),
//            correo: $("#correo").val(),
//            Telefono_Fijo: $("#Telefonof").val(),
//            Telefono_Celular: $("#Telefonoc").val(),
//            Direccion: $("#Direccion").val()
//        }
//    }

//        $.ajax({

//            type: "POST",
//            url: "Persona.aspx/Registrapersona",
//            data: JSON.stringify(data),
//            contentType: "application/json; charset=utf-8",
//            dataType: "json",
//            success: function (data) {


//            },
//            error: function (msg) {

//                console.log(msg);
//            }


//        }).done(function (info) {
//            console.log(info);
//        })
//    });

//}
