$(document).ready(function () {
;

    $("#n_operacion").change(function () {

        list();
    });

    //var tabla, data;

    //function addRowDt(data) {
    //    tabla = $("").DataTable();
    //    for (var o = 0; i < data.length; i++) {
    //        tabla.fnAddData([data[i].p_ci);
    //    }
    //}

    
});


function list() {

    var data = {
        objcosto: {

            codigo: $("#n_operacion").val()
        }
    }

    $.ajax({

        type: "POST",
        url: "Cargamentos.aspx/Listaayudante",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {

            fillModa(data.d)



        },
        error: function (msg) {
            console.log(msg);
        }


    }).done(function (info) {
        console.log(info);
    })

}



function fillModa(objcosto) {

    $("#peso").val(objcosto.cantidad);
    $("#total").val(objcosto.total);
   $("#n_operacion").val(obj.codigo)






}
