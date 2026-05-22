<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.Gestiones.GestionarTratamientos"%>
<%@page import="Controller.Gestiones.Tratamientos"%>
<%@page import="java.util.List"%>
<%
    String rol = (String) session.getAttribute("rol");
    if (rol == null || !rol.equals("medico")) {
        response.sendRedirect(request.getContextPath() + "/Inicio/iniciodesesion.jsp");
        return;
    }
    String usuario = (String) session.getAttribute("usuario");
    GestionarTratamientos gt = new GestionarTratamientos();
    List<Tratamientos> tratamientos = gt.listar();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Panel Médico</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<jsp:include page="/Inicio/sidebarMedico.jsp"/>
<div class="main">
    <div class="page-header">
        <div>
            <h2>Panel Médico</h2>
            <p>Bienvenido, <strong>Dr. <%= usuario %></strong></p>
        </div>
        <a href="${pageContext.request.contextPath}/svAgregarTratamiento"
           class="btn btn-primary">+ Nuevo Tratamiento</a>
    </div>

    <div style="display:grid; grid-template-columns:1fr 1fr; gap:20px; margin-bottom:24px;">
        <div class="card" style="padding:24px; text-align:center;">
            <div style="font-size:36px;">💊</div>
            <div style="font-size:32px; font-weight:700; color:var(--c3);"><%= tratamientos.size() %></div>
            <div style="color:var(--c4); font-size:13px;">Tratamientos registrados</div>
        </div>
        
    </div>

    <div class="card">
        <div class="card-header">Últimos Tratamientos</div>
        <div class="card-body" style="padding:0;">
            <table class="table">
                <thead>
                    <tr><th>Nombre</th><th>Fecha</th><th>Precio</th><th>Acciones</th></tr>
                </thead>
                <tbody>
                <% for (Tratamientos t : tratamientos) { %>
                <tr>
                    <td><strong><%= t.getNombreTx() %></strong></td>
                    <td><%= t.getFechaTx() %></td>
                    <td>$<%= String.format("%,.2f", t.getPrecio()) %></td>
                    <td>
                        
                        <a href="${pageContext.request.contextPath}/svVincularMascota?idTx=<%= t.getIdTx() %>"
                           class="btn btn-success btn-sm">🐾 Mascotas</a>
                        <a href="${pageContext.request.contextPath}/svEditarTratamiento?id=<%= t.getIdTx() %>"
                           class="btn btn-warning btn-sm">Editar</a>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>