<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Tipo de Mascota</title>

  
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">


    <link rel="stylesheet" href="css/style.css">
</head>

<body>

<jsp:include page="/Inicio/sidebarDinamico.jsp"/>

<div class="main">

   
    <div class="page-header">
        <div>
            <h2>Nuevo Tipo de Mascota</h2>
            <p>Registra una nueva categoría de mascota</p>
        </div>
    </div>

    <!-- FORMULARIO -->
    <div class="form-card">

        <form action="svAgregarTipoMascota" method="POST">

            <div class="form-group">
                <label>Nombre del tipo de mascota</label>

                <input type="text"
                       name="nombre"
                       class="form-control"
                       placeholder="Ej: Perro, Gato, Conejo..."
                       required>
            </div>

            <!-- BOTONES -->
            <div class="form-footer">

                <a href="svListarTipo" class="btn btn-secondary">
                    Cancelar
                </a>

                <button type="submit" class="btn btn-primary">
                    Guardar Tipo
                </button>

            </div>

        </form>

    </div>

</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>