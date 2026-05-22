<%@page import="Controller.Gestiones.Profesional"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Profesional> lista = (List<Profesional>) request.getAttribute("listaProfesionales");
    String resultado = (String) request.getAttribute("resultado");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profesionales</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<jsp:include page="/Inicio/sidebarDinamico.jsp"/>

<div class="main">

    <div class="page-header">
        <div>
            <h2>Profesionales</h2>
            <p>Gestiona los profesionales registrados</p>
        </div>
        <a href="${pageContext.request.contextPath}/svAgregarProfesional"
           class="btn btn-primary">+ Nuevo Profesional</a>
    </div>

    <% if (resultado != null) { %>
        <div class="alert alert-info"><%= resultado %></div>
    <% } %>

    <div class="search-box">
        <input type="text" id="buscadorProfesional"
               placeholder="Buscar por nombre, cédula, tipo...">
    </div>

    <div class="card">
        <div class="card-header">Listado de Profesionales</div>
        <div class="card-body" style="padding:0;">
            <table class="table table-hover align-middle mb-0" id="tablaProfesionales">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Cédula</th>
                        <th>Teléfono</th>
                        <th>Correo</th>
                        <th>Tipo</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                <% if (lista != null) for (Profesional p : lista) { %>
                <tr>
                    <td><%= p.getIdProfesional() %></td>
                    <td>
                        <strong>
                            <%= p.getNombreProfesional() %>
                            <%= p.getApellidoProfesional() != null ? p.getApellidoProfesional() : "" %>
                        </strong>
                    </td>
                    <td><%= p.getCedulaProfesional() %></td>
                    <td><%= p.getTelefonoProfesional() != null ? p.getTelefonoProfesional() : "—" %></td>
                    <td><%= p.getCorreoProfesional() != null ? p.getCorreoProfesional() : "—" %></td>
                    <td>
                        <span class="badge bg-secondary">
                            <%= p.getTipoProfesional() %>
                        </span>
                    </td>
                    <td style="display:flex; gap:6px;">
                        <a href="${pageContext.request.contextPath}/svVerProfesional?id=<%= p.getIdProfesional() %>"
                           class="btn btn-info btn-sm">Ver</a>
                        <a href="${pageContext.request.contextPath}/svEditarProfesional?id=<%= p.getIdProfesional() %>"
                           class="btn btn-warning btn-sm">Editar</a>
                        <a href="${pageContext.request.contextPath}/svEliminarProfesional?id=<%= p.getIdProfesional() %>"
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('¿Eliminar este profesional?')">Eliminar</a>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
            <div class="no-results" id="noResults">
                👨‍⚕️ No se encontraron profesionales con ese criterio
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
buscarEnTabla("buscadorProfesional", "tablaProfesionales");
</script>

</body>
</html>