<%@page import="Controller.Gestiones.Tratamientos"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Tratamientos> tratamientos =
        (List<Tratamientos>) request.getAttribute("tratamientos");
    String resultado = (String) request.getAttribute("resultado");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tratamientos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<jsp:include page="/Inicio/sidebarDinamico.jsp"/>

<div class="main">

    <div class="page-header">
        <div>
            <h2>Lista de Tratamientos</h2>
            <p>Gestión médica y estética</p>
        </div>
        <a href="${pageContext.request.contextPath}/svAgregarTratamiento"
           class="btn btn-primary">+ Nuevo Tratamiento</a>
    </div>

    <% if (resultado != null) { %>
        <div class="alert alert-info"><%= resultado %></div>
    <% } %>

    <div class="search-box">
        <input type="text" id="buscadorTratamiento"
               placeholder="Buscar por nombre, profesional, descripción...">
    </div>

    <div class="card">
        <div class="card-header">Listado de Tratamientos</div>
        <div class="card-body" style="padding:0;">
            <table class="table table-hover text-center" id="tablaTratamientos">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Fecha</th>
                        <th>Precio</th>
                        <th>Descripción</th>
                        <th>Profesional</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                <% if (tratamientos != null) for (Tratamientos t : tratamientos) { %>
                <tr>
                    <td><%= t.getIdTx() %></td>
                    <td><strong><%= t.getNombreTx() %></strong></td>
                    <td><%= t.getFechaTx() %></td>
                    <td>$<%= String.format("%,.2f", t.getPrecio()) %></td>
                    <td><%= t.getDescripcionTx() != null ? t.getDescripcionTx() : "—" %></td>
                    <td><%= t.getNombreProfesional() != null ? t.getNombreProfesional() : "—" %></td>
                    <td style="display:flex; gap:6px; justify-content:center; flex-wrap:wrap;">
                        <a href="${pageContext.request.contextPath}/svVerTratamiento?id=<%= t.getIdTx() %>"
                           class="btn btn-success btn-sm">Ver</a>
                        <a href="${pageContext.request.contextPath}/svVincularMascota?idTx=<%= t.getIdTx() %>"
                           class="btn btn-primary btn-sm">🐾 Vincular</a>
                        <a href="${pageContext.request.contextPath}/svEditarTratamiento?id=<%= t.getIdTx() %>"
                           class="btn btn-warning btn-sm">Editar</a>
                        <a href="${pageContext.request.contextPath}/svEliminarTratamiento?id=<%= t.getIdTx() %>"
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('¿Eliminar tratamiento?')">Eliminar</a>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
            <div class="no-results" id="noResults">
                💊 No se encontraron tratamientos con ese criterio
            </div>
        </div>
    </div>
</div>

<script>
function buscarEnTabla(inputId, tablaId) {
    const input = document.getElementById(inputId);
    const tabla = document.getElementById(tablaId);
    const filas = tabla.getElementsByTagName("tr");
    const noResults = document.getElementById("noResults");
    input.addEventListener("keyup", function() {
        const filtro = input.value.toLowerCase().trim();
        let encontrados = 0;
        for (let i = 1; i < filas.length; i++) {
            const texto = filas[i].textContent.toLowerCase();
            if (texto.includes(filtro)) {
                filas[i].style.display = "";
                encontrados++;
            } else {
                filas[i].style.display = "none";
            }
        }
        if (noResults) {
            noResults.style.display = encontrados === 0 ? "block" : "none";
        }
    });
}
buscarEnTabla("buscadorTratamiento", "tablaTratamientos");
</script>

</body>
</html>