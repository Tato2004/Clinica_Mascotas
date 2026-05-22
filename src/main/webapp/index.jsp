<%@page import="Controller.Gestiones.GestionarMascota"%>
<%@page import="Controller.Gestiones.Mascota"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    GestionarMascota gm = new GestionarMascota();
    List<Mascota> mascotas = (List<Mascota>) request.getAttribute("mascotas");
    if (mascotas == null) mascotas = gm.listar();
    String resultado = (String) session.getAttribute("resultado");
    if (resultado != null) session.removeAttribute("resultado");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Clínica Veterinaria</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<jsp:include page="/Inicio/sidebarDinamico.jsp"/>

<div class="main">

    <div class="page-header">
        <div>
            <h2>Lista de Mascotas</h2>
            <p>Gestiona todas las mascotas registradas</p>
        </div>
        <a href="${pageContext.request.contextPath}/svAgregarMascota"
           class="btn btn-primary">+ Nueva Mascota</a>
    </div>

    <% if (resultado != null) { %>
        <div class="alert alert-info"><%= resultado %></div>
    <% } %>

    <div class="search-box">
        <input type="text" id="buscador"
               placeholder="Buscar por nombre, raza, tipo, propietario...">
    </div>

    <div class="card">
        <div class="card-header">Mascotas Registradas</div>
        <div class="card-body" style="padding:0;">
            <table class="table" id="tablaMascotas">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Raza</th>
                        <th>Edad</th>
                        <th>Género</th>
                        <th>Tipo</th>
                        <th>Propietario</th>
                        <th>Tratamiento</th>
                        <th>Foto</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                <% for (Mascota m : mascotas) { %>
                <tr>
                    <td><%= m.getIdMascota() %></td>
                    <td><strong><%= m.getNombre() %></strong></td>
                    <td><%= m.getRaza() %></td>
                    <td><%= m.getEdad() %> años</td>
                    <td>
                        <span class="badge <%= "Macho".equalsIgnoreCase(m.getGenero()) ? "badge-macho" : "badge-hembra" %>">
                            <%= m.getGenero() %>
                        </span>
                    </td>
                    <td><%= m.getNombreTipo() != null ? m.getNombreTipo() : "—" %></td>
                    <td><%= m.getNombrePropietario() != null ? m.getNombrePropietario() : "—" %></td>
                    <td><%= m.getNombreTx() != null ? m.getNombreTx() : "—" %></td>
                    <td>
                        <% if (m.getFoto() != null && !m.getFoto().isEmpty()) { %>
                            <img src="<%= m.getFoto() %>" width="52" height="52"
                                 style="border-radius:8px; object-fit:cover;">
                        <% } else { %>
                            <span style="color:var(--c2);">—</span>
                        <% } %>
                    </td>
                    <td style="display:flex; gap:6px; flex-wrap:wrap;">
                        <a href="${pageContext.request.contextPath}/svVerMascota?id=<%= m.getIdMascota() %>"
                           class="btn btn-success btn-sm">Ver</a>
                        <a href="${pageContext.request.contextPath}/svEditarMascota?id=<%= m.getIdMascota() %>"
                           class="btn btn-warning btn-sm">Editar</a>
                        <a href="${pageContext.request.contextPath}/svBorrarMascota?id=<%= m.getIdMascota() %>"
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('¿Eliminar esta mascota?')">Eliminar</a>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
            <div class="no-results" id="noResults">
                🐾 No se encontraron mascotas con ese criterio
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
buscarEnTabla("buscador", "tablaMascotas");
</script>

</body>
</html>