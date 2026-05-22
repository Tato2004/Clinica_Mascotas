<%@page import="Controller.Gestiones.Profesional"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Profesional> profesionales =
        (List<Profesional>) request.getAttribute("profesionales");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Agregar Tratamiento</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>

:root {
    --c1: #cad2c5;
    --c2: #84a98c;
    --c3: #52796f;
    --c4: #354f52;
    --c5: #2f3e46;
    --blanco: #ffffff;
    --radio: 10px;
    --sombra: 0 2px 12px rgba(47,62,70,0.08);
}

body {
    background: var(--c1);
    font-family: 'Segoe UI', Arial, sans-serif;
}

/* SIDEBAR */
.sidebar {
    width: 240px;
    height: 100vh;
    position: fixed;
    top: 0; left: 0;
    background: var(--c5);
    padding: 30px 20px;
}

.sidebar a {
    display: block;
    color: var(--c2);
    text-decoration: none;
    padding: 10px;
    border-radius: var(--radio);
}

.sidebar a:hover {
    background: var(--c4);
    color: var(--c1);
}

/* MAIN */
.main {
    margin-left: 240px;
    padding: 40px;
}

/* CARD */
.form-card {
    background: var(--blanco);
    padding: 25px;
    border-radius: var(--radio);
    box-shadow: var(--sombra);
}

.page-header {
    margin-bottom: 20px;
}

.page-header h2 {
    color: var(--c5);
}

    </style>
</head>

<body>

<!-- SIDEBAR -->
<jsp:include page="/Inicio/sidebarDinamico.jsp"/>
<!-- MAIN -->
<div class="main">

    <div class="page-header">
        <h2>Agregar Tratamiento</h2>
        <p>Registra un nuevo tratamiento médico</p>
    </div>

    <div class="form-card">

        <form action="svAgregarTratamiento" method="POST">

            <!-- Nombre -->
            <div class="mb-3">
                <label>Nombre del tratamiento</label>
                <input type="text" name="nombre" class="form-control" required>
            </div>

            <!-- Fecha -->
            <div class="mb-3">
                <label>Fecha</label>
                <input type="datetime-local" name="fecha" class="form-control" required>
            </div>

            <!-- Precio -->
            <div class="mb-3">
                <label>Precio</label>
                <input type="number" step="0.01" name="precio" class="form-control" required>
            </div>

            <!-- Descripción -->
            <div class="mb-3">
                <label>Descripción</label>
                <textarea name="descripcion" class="form-control"></textarea>
            </div>

            <!-- Profesional -->
            <div class="mb-3">
                <label>Profesional</label>

                <select name="idProfesional" class="form-select" required>

                    <% if (profesionales != null) {
                        for (Profesional p : profesionales) { %>

                        <option value="<%= p.getIdProfesional() %>">
                            <%= p.getNombreProfesional() %>
                            <%= p.getApellidoProfesional() %>
                        </option>

                    <% }} %>

                </select>
            </div>

            <!-- BOTONES -->
            <a href="svListarTratamiento" class="btn btn-secondary">Cancelar</a>
            <button type="submit" class="btn btn-success">Guardar</button>

        </form>

    </div>

</div>

</body>
</html>