<%@page import="Controller.Gestiones.Profesional"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Profesional p = (Profesional) request.getAttribute("profesional");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Profesional</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
<jsp:include page="/Inicio/sidebarDinamico.jsp"/>

<div class="main">

    <div class="page-header">
        <div>
            <h2>Editar Profesional</h2>
            <p>Actualiza la información del profesional</p>
        </div>
    </div>

    <% if (p != null) { %>

    <div class="form-card">

        <form action="svActualizarProfesional" method="POST">

            <input type="hidden" name="id" value="<%= p.getIdProfesional() %>">

            <!-- Nombre -->
            <div class="form-group">
                <label>Nombre</label>
                <input type="text"
                       name="nombre"
                       class="form-control"
                       value="<%= p.getNombreProfesional() %>"
                       required>
            </div>

            <!-- Apellido -->
            <div class="form-group">
                <label>Apellido</label>
                <input type="text"
                       name="apellido"
                       class="form-control"
                       value="<%= p.getApellidoProfesional() %>">
            </div>

            <!-- Teléfono + Correo -->
            <div style="display:grid; grid-template-columns:1fr 1fr; gap:18px;">

                <div class="form-group">
                    <label>Teléfono</label>
                    <input type="text"
                           name="telefono"
                           class="form-control"
                           value="<%= p.getTelefonoProfesional() %>">
                </div>

                <div class="form-group">
                    <label>Correo</label>
                    <input type="email"
                           name="correo"
                           class="form-control"
                           value="<%= p.getCorreoProfesional() %>">
                </div>

            </div>

            <!-- Cédula -->
            <div class="form-group">
                <label>Cédula</label>
                <input type="text"
                       name="cedula"
                       class="form-control"
                       value="<%= p.getCedulaProfesional() %>">
            </div>

            <!-- Tipo Profesional -->
            <div class="form-group">
                <label>Tipo Profesional</label>

                <select name="tipo" class="form-select">

                    <option value="medico"
                        <%= "medico".equals(p.getTipoProfesional()) ? "selected" : "" %>>
                        Médico
                    </option>

                    <option value="estetico"
                        <%= "estetico".equals(p.getTipoProfesional()) ? "selected" : "" %>>
                        Estético
                    </option>

                </select>
            </div>

            <!-- BOTONES -->
            <div class="form-footer">
                <a href="svListarProfesional" class="btn btn-secondary">← Cancelar</a>
                <button type="submit" class="btn btn-primary">Actualizar</button>
            </div>

        </form>

    </div>

    <% } else { %>

        <div class="alert alert-danger">
            No se encontró el profesional.
        </div>

    <% } %>

</div>

</body>
</html>