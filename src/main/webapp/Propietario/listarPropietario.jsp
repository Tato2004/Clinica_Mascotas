<%@page import="Controller.Gestiones.Propietario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Propietario> propietarios = (List<Propietario>) request.getAttribute("propietarios");
    String resultado = (String) request.getAttribute("resultado");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Propietarios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<jsp:include page="/Inicio/sidebarDinamico.jsp"/>

<div class="main">

    <div class="page-header">
        <div>
            <h2>Propietarios</h2>
            <p>Gestiona los dueños de mascotas registrados</p>
        </div>
        <a href="${pageContext.request.contextPath}/svAgregarPropietario"
           class="btn btn-primary">+ Nuevo Propietario</a>
    </div>

    <% if (resultado != null) { %>
        <div class="alert alert-info"><%= resultado %></div>
    <% } %>

    <div class="search-box">
        <input type="text" id="buscadorPropietario"
               placeholder="Buscar por nombre, cédula, correo...">
    </div>

    <div class="card">
        <div class="card-header">Listado de Propietarios</div>
        <div class="card-body" style="padding:0;">
            <table class="table" id="tablaPropietarios">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Apellidos</th>
                        <th>Cédula</th>
                        <th>Teléfono</th>
                        <th>Correo</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                <% if (propietarios != null) for (Propietario p : propietarios) { %>
                <tr>
                    <td><%= p.getIdPropietario() %></td>
                    <td><strong><%= p.getNombre() %></strong></td>
                    <td><%= p.getApellidos() != null ? p.getApellidos() : "—" %></td>
                    <td><%= p.getCedula() %></td>
                    <td><%= p.getTelefono() != null ? p.getTelefono() : "—" %></td>
                    <td><%= p.getCorreo() != null ? p.getCorreo() : "—" %></td>
                    <td style="display:flex; gap:6px;">
                        <a href="${pageContext.request.contextPath}/svEditarPropietario?id=<%= p.getIdPropietario() %>"
                           class="btn btn-warning btn-sm">Editar</a>
                        <a href="${pageContext.request.contextPath}/svBorrarPropietario?id=<%= p.getIdPropietario() %>"
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('¿Borrar propietario?')">Borrar</a>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
            <div class="no-results" id="noResults">
                👤 No se encontraron propietarios con ese criterio
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
buscarEnTabla("buscadorPropietario", "tablaPropietarios");
</script>

</body>
</html>