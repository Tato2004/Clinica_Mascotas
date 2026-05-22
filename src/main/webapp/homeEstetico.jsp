<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.Gestiones.GestionarTratamientos"%>
<%@page import="Controller.Gestiones.Tratamientos"%>
<%@page import="java.util.List"%>
<%
    String rol = (String) session.getAttribute("rol");
    if (rol == null || !rol.equals("estetico")) {
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
    <title>Panel Estético</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<jsp:include page="/Inicio/sidebarEstetico.jsp"/>
<div class="main">
    <div class="page-header">
        <div>
            <h2>Panel Estético</h2>
            <p>Bienvenido, <strong><%= usuario %></strong></p>
        </div>
        <a href="${pageContext.request.contextPath}/svAgregarTratamiento"
           class="btn btn-primary">+ Nuevo Servicio</a>
    </div>

    <div class="card">
        <div class="card-header">Servicios Estéticos Registrados</div>
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