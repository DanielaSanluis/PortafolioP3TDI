$(document).ready(function () {

    // 1. Filtrado en vivo sobre tarjetas y tabla
    $("#buscadorProyectos").on("keyup", function () {
        const valor = $(this).val().toLowerCase().trim();

        $(".item-proyecto").each(function () {
            const texto = $(this).text().toLowerCase();
            $(this).toggle(texto.indexOf(valor) > -1);
        });

        $(".fila-proyecto").each(function () {
            const texto = $(this).text().toLowerCase();
            $(this).toggle(texto.indexOf(valor) > -1);
        });
    });

    // 2. Pasar datos dinámicamente al Modal de Bootstrap al hacer clic en Eliminar
    $(".btn-abrir-modal-eliminar").on("click", function () {
        const id = $(this).data("id");
        const titulo = $(this).data("titulo");

        $("#nombreProyectoEliminar").text(titulo);
        $("#formEliminar").attr("action", CONTEXT_PATH + "/proyectos/eliminar/" + id);
    });

    // 3. Validación en cliente antes de enviar el formulario
    $("#formProyecto").on("submit", function (e) {
        const titulo = $("#titulo").val().trim();
        const descripcion = $("#descripcion").val().trim();
        const tecnologias = $("#tecnologias").val().trim();
        const github = $("#urlGithub").val().trim();

        if (!titulo || !descripcion || !tecnologias || !github) {
            e.preventDefault();
            $("#alertaValidacion").removeClass("d-none");
        } else {
            $("#alertaValidacion").addClass("d-none");
        }
    });
	
	$("#btnCopiarCorreo").on("click", function (e) {
	    e.preventDefault();
	    const correo = $(this).data("correo");
	    const $btn = $(this);
	    navigator.clipboard.writeText(correo);
	    $btn.text("¡Copiado! (" + correo + ")");
	    setTimeout(() => $btn.text(correo), 2000);
	});
});