<%@page import="Controller.Gestiones.Tratamientos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Tratamientos t = (Tratamientos) request.getAttribute("tratamiento");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ver Tratamiento</title>

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
    font-family: 'Segoe UI', Arial, sans-serif;
}

.sidebar {
    width: 240px;
    height: 100vh;
    position: fixed;
    top: 0;
    left: 0;
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

.main {
    margin-left: 240px;
    padding: 40px;
}

.card-detail {
    background: var(--blanco);
    border-radius: var(--radio);
    box-shadow: var(--sombra);
    padding: 25px;
}

.label {
    font-weight: bold;
    color: var(--c4);
}

.value {
    margin-bottom: 15px;
}

    </style>
</head>

<body>

<!-- SIDEBAR -->
<jsp:include page="/Inicio/sidebarDinamico.jsp"/>

<!-- MAIN -->
<div class="main">

    <h2 class="mb-3">Detalle del Tratamiento</h2>

    <% if (t != null) { %>

    <div class="card-detail">

        <div class="value">
            <span class="label">ID:</span>
            <%= t.getIdTx() %>
        </div>

        <div class="value">
            <span class="label">Nombre:</span>
            <%= t.getNombreTx() %>
        </div>

        <div class="value">
            <span class="label">Fecha:</span>
            <%= t.getFechaTx() %>
        </div>

        <div class="value">
            <span class="label">Precio:</span>
            $ <%= t.getPrecio() %>
        </div>

        <div class="value">
            <span class="label">Descripción:</span>
            <%= t.getDescripcionTx() %>
        </div>

        <div class="value">
            <span class="label">Profesional:</span>
            <%= t.getNombreProfesional() %>
<div class="mt-3">

    <a href="svEditarTratamiento?id=<%= t.getIdTx() %>"
       class="btn btn-warning">
        ✏️ Editar
    </a>

    <a href="svListarTratamiento"
       class="btn btn-secondary">
        ← Volver
    </a>

</div>
    <% } else { %>

        <div class="alert alert-danger">
            No se encontró el tratamiento.
        </div>

    <% } %>

</div>

</body>
</html>