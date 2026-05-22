<%@page import="Controller.Gestiones.Profesional"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Profesional p = (Profesional) request.getAttribute("profesional");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clínica Veterinaria</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<jsp:include page="/Inicio/sidebarDinamico.jsp"/>

<div class="main">
    <div class="page-header">
        <div>
            <h2>Detalle del Profesional</h2>
            <p>Información completa del registro</p>
        </div>
        <a href="svListarProfesional" class="btn btn-secondary">← Volver</a>
    </div>

    <% if (p != null) { %>
    <div class="form-card">

        <table style="width:100%; border-collapse:collapse; font-size:14px;">
            <tr style="border-bottom:1px solid var(--c1);">
                <td style="padding:12px 0; color:var(--c3); font-weight:600; width:160px;">ID</td>
                <td style="padding:12px 0;"><%= p.getIdProfesional() %></td>
            </tr>

            <tr style="border-bottom:1px solid var(--c1);">
                <td style="padding:12px 0; color:var(--c3); font-weight:600;">Nombre</td>
                <td style="padding:12px 0;">
                    <strong><%= p.getNombreProfesional() %> <%= p.getApellidoProfesional() %></strong>
                </td>
            </tr>

            <tr style="border-bottom:1px solid var(--c1);">
                <td style="padding:12px 0; color:var(--c3); font-weight:600;">Cédula</td>
                <td style="padding:12px 0;"><%= p.getCedulaProfesional() %></td>
            </tr>

            <tr style="border-bottom:1px solid var(--c1);">
                <td style="padding:12px 0; color:var(--c3); font-weight:600;">Teléfono</td>
                <td style="padding:12px 0;">
                    <%= p.getTelefonoProfesional() != null ? p.getTelefonoProfesional() : "—" %>
                </td>
            </tr>

            <tr style="border-bottom:1px solid var(--c1);">
                <td style="padding:12px 0; color:var(--c3); font-weight:600;">Correo</td>
                <td style="padding:12px 0;">
                    <%= p.getCorreoProfesional() != null ? p.getCorreoProfesional() : "—" %>
                </td>
            </tr>

            <tr>
                <td style="padding:12px 0; color:var(--c3); font-weight:600;">Tipo</td>
                <td style="padding:12px 0;">
                    <span class="badge bg-secondary">
                        <%= p.getTipoProfesional() %>
                    </span>
                </td>
            </tr>
        </table>

        <div class="form-footer">
            <a href="svListarProfesional" class="btn btn-secondary">← Volver</a>
            <a href="svEditarProfesional?id=<%= p.getIdProfesional() %>" class="btn btn-primary">Editar</a>
        </div>

    </div>
    <% } else { %>
        <div class="alert alert-danger">Profesional no encontrado.</div>
    <% } %>
</div>

</body>
</html>