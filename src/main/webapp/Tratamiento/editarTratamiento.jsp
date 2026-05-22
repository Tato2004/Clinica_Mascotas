<%@page import="Controller.Gestiones.Profesional"%>
<%@page import="Controller.Gestiones.Tratamientos"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Tratamientos t = (Tratamientos) request.getAttribute("tratamiento");
    List<Profesional> profesionales =
        (List<Profesional>) request.getAttribute("profesionales");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Tratamiento</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>

:root {
    --c1: #cad2c5;
    --c2: #84a98c;
    --c3: #52796f;
    --c4: #354f52;
    --c5: #2f3e46;
    --blanco: #ffffff;
    --sombra: 0 2px 12px rgba(47,62,70,0.08);
    --radio: 10px;
}

body {
    background: var(--c1);
    font-family: Arial;
}

/* SIDEBAR */
.sidebar {
    width: 240px;
    height: 100vh;
    position: fixed;
    top: 0;
    left: 0;
    background: var(--c5);
    padding: 30px 20px;
}

.sidebar h2 {
    color: var(--c1);
    margin-bottom: 20px;
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
.card-form {
    background: var(--blanco);
    padding: 25px;
    border-radius: var(--radio);
    box-shadow: var(--sombra);
}

    </style>
</head>

<body>

<!-- SIDEBAR -->
<jsp:include page="/Inicio/sidebarDinamico.jsp"/>
<!-- MAIN -->
<div class="main">

    <h2>Editar Tratamiento</h2>

    <% if (t != null) { %>

    <div class="card-form">

        <form action="svEditarTratamiento" method="POST">

            <input type="hidden" name="id" value="<%= t.getIdTx() %>">

            <div class="mb-3">
                <label>Nombre</label>
                <input type="text" name="nombre" class="form-control"
                       value="<%= t.getNombreTx() %>" required>
            </div>

            <div class="mb-3">
                <label>Fecha</label>
                <input type="datetime-local" name="fecha" class="form-control"
                       value="<%= t.getFechaTx().toString().replace(" ", "T").substring(0,16) %>"
                       required>
            </div>

            <div class="mb-3">
                <label>Precio</label>
                <input type="number" step="0.01" name="precio" class="form-control"
                       value="<%= t.getPrecio() %>" required>
            </div>

            <div class="mb-3">
                <label>Descripción</label>
                <textarea name="descripcion" class="form-control"><%= t.getDescripcionTx() %></textarea>
            </div>

            <div class="mb-3">
                <label>Profesional</label>

                <select name="idProfesional" class="form-select">

                    <% if (profesionales != null) {
                        for (Profesional p : profesionales) { %>

                        <option value="<%= p.getIdProfesional() %>"
                            <%= p.getIdProfesional() == t.getIdProfesional() ? "selected" : "" %>>

                            <%= p.getNombreProfesional() %> <%= p.getApellidoProfesional() %>
                        </option>

                    <% }} %>

                </select>
            </div>

            <a href="svListarTratamiento" class="btn btn-secondary">Cancelar</a>
            <button type="submit" class="btn btn-primary">Actualizar</button>

        </form>

    </div>

    <% } else { %>

        <div class="alert alert-danger">
            No se encontró el tratamiento.
        </div>

    <% } %>

</div>

</body>
</html>