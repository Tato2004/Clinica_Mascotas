<%@page import="Controller.Gestiones.Mascota"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Mascota> mascotas = (List<Mascota>) request.getAttribute("mascotas");
    String error = (String) request.getAttribute("error");
    String usuario = (String) session.getAttribute("usuario");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mis Mascotas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<jsp:include page="/Inicio/sidebarDinamico.jsp"/>

<div class="main">

    <div class="page-header">
        <div>
            <h2>Mis Mascotas</h2>
            <p>Bienvenido, <strong><%= usuario %></strong> — aquí están tus mascotas registradas</p>
        </div>
    </div>

    <% if (error != null) { %>
        <div class="alert alert-danger"><%= error %></div>
    <% } %>

    <% if (mascotas == null || mascotas.isEmpty()) { %>
        <div class="card" style="padding:40px; text-align:center;">
            <div style="font-size:60px; margin-bottom:16px;">🐾</div>
            <h4 style="color:var(--c4);">No tienes mascotas registradas aún</h4>
            <p style="color:var(--c3);">Comunícate con la clínica para registrar tu mascota.</p>
        </div>

    <% } else { %>

        <!-- TARJETAS DE MASCOTAS -->
        <div style="display:grid; grid-template-columns:repeat(auto-fill, minmax(280px,1fr)); gap:20px;">

            <% for (Mascota m : mascotas) { %>

            <div class="card" style="border-radius:var(--radio); overflow:hidden;">

                <!-- FOTO -->
                <% if (m.getFoto() != null && !m.getFoto().isEmpty()) { %>
                    <img src="<%= m.getFoto() %>"
                         style="width:100%; height:180px; object-fit:cover;">
                <% } else { %>
                    <div style="width:100%; height:180px; background:var(--c1);
                                display:flex; align-items:center; justify-content:center;
                                font-size:60px;">
                        🐾
                    </div>
                <% } %>

                <!-- DATOS -->
                <div style="padding:16px;">
                    <h5 style="color:var(--c5); margin-bottom:8px;">
                        <strong><%= m.getNombre() %></strong>
                        <span class="badge <%="Macho".equalsIgnoreCase(m.getGenero()) ? "badge-macho":"badge-hembra"%>"
                              style="font-size:11px; margin-left:6px;">
                            <%= m.getGenero() %>
                        </span>
                    </h5>

                    <table style="width:100%; font-size:13px; color:var(--texto);">
                        <tr>
                            <td style="color:var(--c3); font-weight:600; padding:4px 0; width:90px;">Raza</td>
                            <td><%= m.getRaza() != null ? m.getRaza() : "—" %></td>
                        </tr>
                        <tr>
                            <td style="color:var(--c3); font-weight:600; padding:4px 0;">Edad</td>
                            <td><%= m.getEdad() %> años</td>
                        </tr>
                        <tr>
                            <td style="color:var(--c3); font-weight:600; padding:4px 0;">Tipo</td>
                            <td><%= m.getNombreTipo() != null ? m.getNombreTipo() : "—" %></td>
                        </tr>
                    </table>

                    <!-- TRATAMIENTO -->
                    <div style="margin-top:12px; padding:10px; background:var(--c1);
                                border-radius:8px; font-size:13px;">
                        <% if (m.getNombreTx() != null) { %>
                            <div style="color:var(--c4); font-weight:600; margin-bottom:4px;">
                                💊 Tratamiento asignado
                            </div>
                            <div><%= m.getNombreTx() %></div>
                            <% if (m.getNombreProfesional() != null) { %>
                                <div style="color:var(--c3); margin-top:4px;">
                                    👨‍⚕️ <%= m.getNombreProfesional() %>
                                </div>
                            <% } %>
                        <% } else { %>
                            <div style="color:var(--c3); text-align:center;">
                                Sin tratamiento asignado
                            </div>
                        <% } %>
                    </div>

                    <!-- BOTÓN VER DETALLE -->
                    <a href="${pageContext.request.contextPath}/svVerMascota?id=<%= m.getIdMascota() %>"
                       class="btn btn-primary"
                       style="width:100%; margin-top:12px;">
                        Ver detalle completo
                    </a>

                </div>
            </div>

            <% } %>

        </div>

    <% } %>

</div>

</body>
</html>