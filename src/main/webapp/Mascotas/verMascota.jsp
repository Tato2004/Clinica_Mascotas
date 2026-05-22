<%@page import="Controller.Gestiones.Mascota"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Mascota m = (Mascota) request.getAttribute("mascota"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ver Mascota</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<jsp:include page="/Inicio/sidebarDinamico.jsp"/>
<div class="main">
    <div class="page-header">
        <div>
            <h2>Detalle de Mascota</h2>
            <p>Información completa del registro</p>
        </div>
        <a href="${pageContext.request.contextPath}/index.jsp"
           class="btn btn-secondary">← Volver</a>
    </div>

    <% if (m != null) { %>

    <% if (m.getFoto() != null && !m.getFoto().isEmpty()) { %>
        <img src="<%= m.getFoto() %>"
             style="width:100%; max-height:220px; object-fit:cover;
                    border-radius:var(--radio); margin-bottom:24px;">
    <% } %>

    <!-- DATOS GENERALES -->
    <div class="card" style="margin-bottom:20px;">
        <div class="card-header">📋 Datos Generales</div>
        <div class="card-body">
            <table style="width:100%; border-collapse:collapse; font-size:14px;">
                <tr style="border-bottom:1px solid var(--c1);">
                    <td style="padding:12px 0; color:var(--c3); font-weight:600; width:160px;">ID</td>
                    <td><%= m.getIdMascota() %></td>
                </tr>
                <tr style="border-bottom:1px solid var(--c1);">
                    <td style="padding:12px 0; color:var(--c3); font-weight:600;">Nombre</td>
                    <td><strong><%= m.getNombre() %></strong></td>
                </tr>
                <tr style="border-bottom:1px solid var(--c1);">
                    <td style="padding:12px 0; color:var(--c3); font-weight:600;">Raza</td>
                    <td><%= m.getRaza() %></td>
                </tr>
                <tr style="border-bottom:1px solid var(--c1);">
                    <td style="padding:12px 0; color:var(--c3); font-weight:600;">Edad</td>
                    <td><%= m.getEdad() %> años</td>
                </tr>
                <tr style="border-bottom:1px solid var(--c1);">
                    <td style="padding:12px 0; color:var(--c3); font-weight:600;">Género</td>
                    <td>
                        <span class="badge <%="Macho".equalsIgnoreCase(m.getGenero()) ? "badge-macho":"badge-hembra"%>">
                            <%= m.getGenero() %>
                        </span>
                    </td>
                </tr>
                <tr style="border-bottom:1px solid var(--c1);">
                    <td style="padding:12px 0; color:var(--c3); font-weight:600;">Tipo</td>
                    <td><%= m.getNombreTipo() != null ? m.getNombreTipo() : "—" %></td>
                </tr>
                <tr>
                    <td style="padding:12px 0; color:var(--c3); font-weight:600;">Propietario</td>
                    <td><%= m.getNombrePropietario() != null ? m.getNombrePropietario() : "—" %></td>
                </tr>
            </table>
        </div>
    </div>

    <!-- TRATAMIENTO ASIGNADO -->
    <div class="card" style="margin-bottom:20px;">
        <div class="card-header">💊 Tratamiento Asignado</div>
        <div class="card-body">
            <% if (m.getNombreTx() != null) { %>
                <table style="width:100%; border-collapse:collapse; font-size:14px;">
                    <tr style="border-bottom:1px solid var(--c1);">
                        <td style="padding:12px 0; color:var(--c3); font-weight:600; width:160px;">Tratamiento</td>
                        <td><strong><%= m.getNombreTx() %></strong></td>
                    </tr>
                    <tr>
                        <td style="padding:12px 0; color:var(--c3); font-weight:600;">Profesional</td>
                        <td><%= m.getNombreProfesional() != null ? m.getNombreProfesional() : "—" %></td>
                    </tr>
                </table>
            <% } else { %>
                <p style="color:var(--c3); margin:0;">
                    Esta mascota no tiene tratamiento asignado aún.
                    <a href="${pageContext.request.contextPath}/svListarTratamiento">
                        Asignar tratamiento →
                    </a>
                </p>
            <% } %>
        </div>
    </div>

    <!-- BOTONES -->
    <div class="form-footer">
        <a href="${pageContext.request.contextPath}/index.jsp"
           class="btn btn-secondary">← Volver</a>
        <a href="${pageContext.request.contextPath}/svEditarMascota?id=<%= m.getIdMascota() %>"
           class="btn btn-primary">Editar</a>
    </div>

    <% } else { %>
        <div class="alert alert-danger">Mascota no encontrada.</div>
    <% } %>
</div>
</body>
</html>