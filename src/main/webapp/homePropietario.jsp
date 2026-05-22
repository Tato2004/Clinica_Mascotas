<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.Gestiones.GestionarMascota"%>
<%@page import="Controller.Gestiones.GestionarUsuario"%>
<%@page import="Controller.Gestiones.Mascota"%>
<%@page import="java.util.List"%>
<%
    String rol = (String) session.getAttribute("rol");
    if (rol == null || !rol.equals("propietario")) {
        response.sendRedirect(request.getContextPath() + "/Inicio/iniciodesesion.jsp");
        return;
    }
    String usuario  = (String) session.getAttribute("usuario");
    int idUsuario   = (int) session.getAttribute("idUsuario");
    GestionarUsuario gu = new GestionarUsuario();
    int idPropietario   = gu.obtenerIdPropietario(idUsuario);
    GestionarMascota gm = new GestionarMascota();
    List<Mascota> misMascotas = gm.listarPorPropietario(idPropietario);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mi Panel</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<jsp:include page="/Inicio/sidebarPropietario.jsp"/>
<div class="main">
    <div class="page-header">
        <div>
            <h2>Mi Panel</h2>
            <p>Bienvenido, <strong><%= usuario %></strong></p>
        </div>
    </div>

    <div class="card" style="margin-bottom:24px; padding:24px; text-align:center; max-width:200px;">
        <div style="font-size:36px;">🐾</div>
        <div style="font-size:32px; font-weight:700; color:var(--c3);"><%= misMascotas.size() %></div>
        <div style="color:var(--c4); font-size:13px;">Mis Mascotas</div>
    </div>

    <div class="card">
        <div class="card-header">Mis Mascotas</div>
        <div class="card-body" style="padding:0;">
            <table class="table">
                <thead>
                    <tr>
                        <th>Nombre</th><th>Raza</th><th>Edad</th>
                        <th>Género</th><th>Foto</th><th>Tratamiento</th>
                    </tr>
                </thead>
                <tbody>
                <% if (misMascotas.isEmpty()) { %>
                    <tr>
                        <td colspan="6" style="text-align:center; padding:20px; color:var(--c3);">
                            No tienes mascotas registradas
                        </td>
                    </tr>
                <% } else { for (Mascota m : misMascotas) { %>
                <tr>
                    <td><strong><%= m.getNombre() %></strong></td>
                    <td><%= m.getRaza() %></td>
                    <td><%= m.getEdad() %> años</td>
                    <td><%= m.getGenero() %></td>
                    <td>
                        <% if (m.getFoto() != null && !m.getFoto().isEmpty()) { %>
                            <img src="<%= m.getFoto() %>" width="50" height="50"
                                 style="border-radius:8px; object-fit:cover;">
                        <% } else { %>—<% } %>
                    </td>
                    <td><%= m.getNombreTx() != null ? m.getNombreTx() : "—" %></td>
                </tr>
                <% } } %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>