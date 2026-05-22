<%@page import="Controller.Gestiones.tipoMascota"%>
<%@page import="Controller.Gestiones.Propietario"%>
<%@page import="Controller.Gestiones.Mascota"%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Mascota m = (Mascota) request.getAttribute("mascota");
    List<tipoMascota> tipos = (List<tipoMascota>) request.getAttribute("tipos");
    List<Propietario> propietarios = (List<Propietario>) request.getAttribute("propietarios");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Mascota</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- TU CSS GENERAL -->
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

<!-- SIDEBAR -->
<jsp:include page="/Inicio/sidebarDinamico.jsp"/>

<!-- CONTENIDO -->
<div class="main">

    <div class="page-header">
        <div>
            <h2>Editar Mascota</h2>
            <p>Actualiza la información de la mascota</p>
        </div>
    </div>

    <% if (m != null) { %>

    <div class="form-card">

        <form action="svActualizarMascota" method="POST">

            <input type="hidden" name="id" value="<%= m.getIdMascota() %>">

            <!-- Nombre -->
            <div class="form-group">
                <label>Nombre</label>
                <input type="text"
                       name="nombre"
                       class="form-control"
                       value="<%= m.getNombre() %>"
                       required>
            </div>

            <!-- Raza + Edad -->
            <div style="display:grid; grid-template-columns:1fr 1fr; gap:18px;">

                <div class="form-group">
                    <label>Raza</label>
                    <input type="text"
                           name="raza"
                           class="form-control"
                           value="<%= m.getRaza() %>">
                </div>

                <div class="form-group">
                    <label>Edad</label>
                    <input type="number"
                           name="edad"
                           class="form-control"
                           value="<%= m.getEdad() %>">
                </div>

            </div>

            <!-- Género -->
            <div class="form-group">
                <label>Género</label>

                <select name="genero" class="form-select">

                    <option value="Macho"
                        <%= "Macho".equals(m.getGenero()) ? "selected" : "" %>>
                        Macho
                    </option>

                    <option value="Hembra"
                        <%= "Hembra".equals(m.getGenero()) ? "selected" : "" %>>
                        Hembra
                    </option>

                </select>
            </div>

            <!-- Tipo -->
            <div class="form-group">
                <label>Tipo de Mascota</label>

                <select name="idTipoMascota" class="form-select">

                    <% if (tipos != null) {
                        for (tipoMascota t : tipos) { %>

                        <option value="<%= t.getIdTipoMascota() %>"
                            <%= t.getIdTipoMascota() == m.getIdTipoMascota() ? "selected" : "" %>>
                            <%= t.getNombre() %>
                        </option>

                    <% }} %>

                </select>
            </div>

            <!-- Propietario -->
            <div class="form-group">
                <label>Propietario</label>

                <select name="idPropietario" class="form-select">

                    <% if (propietarios != null) {
                        for (Propietario p : propietarios) { %>

                        <option value="<%= p.getIdPropietario() %>"
                            <%= p.getIdPropietario() == m.getIdPropietario() ? "selected" : "" %>>
                            <%= p.getNombre() %> <%= p.getApellidos() %>
                        </option>

                    <% }} %>

                </select>
                    
                    
            </div>
                    

            <!-- Foto -->
            <div class="form-group">
                <label>Foto (URL)</label>

                <input type="text"
                       name="foto"
                       class="form-control"
                       value="<%= m.getFoto() != null ? m.getFoto() : "" %>">
            </div>

            <!-- BOTONES -->
            <div class="form-footer">
                <a href="index.jsp" class="btn btn-secondary">← Cancelar</a>
                <button type="submit" class="btn btn-primary">Actualizar</button>
            </div>

        </form>

    </div>

    <% } else { %>

        <div class="alert alert-danger">
            No se encontró la mascota.
        </div>

    <% } %>

</div>

</body>
</html>