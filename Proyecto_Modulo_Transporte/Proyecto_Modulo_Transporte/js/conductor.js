$(document).ready(function () {
    $("#T").on("click", function (e) {

        e.preventDefault();

        if ($("#tx").val() === "") {
            alert("defensa");
            insertarconducto();

        } else {
            alert("actulizar");
            actualizarconductor();
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
        eliminarconductor(clickeado.data('id'));

    });

 

    //var tabla, data;

    //function addRowDt(data) {
    //    tabla = $("").DataTable();
    //    for (var o = 0; i < data.length; i++) {
    //        tabla.fnAddData([data[i].p_ci);
    //    }
    //}

    
});
function insertarconducto() {

    var data = {
        objconducto: {
            p_ci: $("#carnet").val(),
            Licencia: $("#Licencia").val(),

            Categoriaid: $("#categoria").val()
         

        }
    }

    $.ajax({

        type: "POST",
        url: "Conductor.aspx/Registraconductor",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        dataType: "json",

        success: function (data) {

            $('#myModal').modal('hide'),
                $('#tablapersona').show()
            $('#tx').val("");
            fillLimpiar();
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

function actualizarconductor() {


    var data = {
        objconducto: {
            Conductorid: $(".E").val(),
            p_ci: $("#carnet").val(),
            Licencia: $("#Licencia").val(),
            Categoriaid: $("#categoria").val()
        }
    }

    $.ajax({

        type: "POST",
        url: "Conductor.aspx/ActulizarConductor",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $('#myModal').modal('hide'),
                $('#tablapersona').show()
            location.reload();
            fillLimpiar();
            $('#tx').val("");
    


        },
        error: function (msg) {
            console.log(msg);
        }


    }).done(function (info) {
        console.log(info);
    })


}

function fillModalDatacConductor(objconducto) {

    $('.E').val(objconducto.Conductorid);
    $('#carnet').val(objconducto.p_ci);
    $('#Licencia').val(objconducto.Licencia);
    $('#categoria').val(objconducto.Categoriaid);



}


function fillLimpiar() {


    $('#carnet').val(null);
    $('#Licencia').val("");
    $('#categoria').val(null);
   



}

function edit(id) {
    $('#tx').val("1");
    var data = {
        Listaconductor: id

   
    };

    $.ajax({

        type: "POST",
        url: "Conductor.aspx/Listaconductor",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $('#myModal').modal('show'),
                fillModalDatacConductor(data.d)



        },
        error: function (msg) {
            console.log(msg);
        }


    }).done(function (info) {
        console.log(info);
    })

}

function eliminarconductor(id) {
    $('#tx').val("");
    var data = {
        Listaconductor: id


    };

    $.ajax({

        type: "POST",
        url: "Conductor.aspx/Eliminar",
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


