<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.Gestiones.GestionarMascota"%>
<%@page import="Controller.Gestiones.GestionarProfesional"%>
<%@page import="Controller.Gestiones.GestionarTratamientos"%>
<%@page import="Controller.Gestiones.GestionarPropietario"%>

<%
    String rol = (String) session.getAttribute("rol");

    if (rol == null || !rol.equals("admin")) {
        response.sendRedirect(request.getContextPath() + "/Inicio/iniciodesesion.jsp");
        return;
    }

    String usuario = (String) session.getAttribute("usuario");

    int totalMascotas =
            new GestionarMascota().listar().size();

    int totalProfesionales =
            new GestionarProfesional().listar().size();

    int totalTratamientos =
            new GestionarTratamientos().listar().size();

    int totalPropietarios =
            new GestionarPropietario().listar().size();
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Panel Admin</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

</head>

<body>

<!-- SIDEBAR CORREGIDO -->
<jsp:include page="/Inicio/sidebarDinamico.jsp"/>

<div class="main">

    <!-- HEADER -->
    <div class="page-header">

        <div>

            <h2>Panel de Administración</h2>

            <p>
                Bienvenido,
                <strong><%= usuario %></strong>
            </p>

        </div>

    </div>

    <!-- TARJETAS -->
    <div style="
        display:grid;
        grid-template-columns:repeat(4,1fr);
        gap:20px;
        margin-bottom:32px;
    ">

        <!-- MASCOTAS -->
        <div class="card"
             style="padding:24px; text-align:center;">

            <div style="font-size:36px;">
                🐾
            </div>

            <div style="
                font-size:32px;
                font-weight:700;
                color:var(--c3);
            ">
                <%= totalMascotas %>
            </div>

            <div style="
                color:var(--c4);
                font-size:13px;
            ">
                Mascotas
            </div>

            <a href="${pageContext.request.contextPath}/index.jsp"
               class="btn btn-primary"
               style="margin-top:12px; width:100%;">

                Ver

            </a>

        </div>

        <!-- PROFESIONALES -->
        <div class="card"
             style="padding:24px; text-align:center;">

            <div style="font-size:36px;">
                👨‍⚕️
            </div>

            <div style="
                font-size:32px;
                font-weight:700;
                color:var(--c3);
            ">
                <%= totalProfesionales %>
            </div>

            <div style="
                color:var(--c4);
                font-size:13px;
            ">
                Profesionales
            </div>

            <a href="${pageContext.request.contextPath}/svListarProfesional"
               class="btn btn-primary"
               style="margin-top:12px; width:100%;">

                Ver

            </a>

        </div>

        <!-- TRATAMIENTOS -->
        <div class="card"
             style="padding:24px; text-align:center;">

            <div style="font-size:36px;">
                💊
            </div>

            <div style="
                font-size:32px;
                font-weight:700;
                color:var(--c3);
            ">
                <%= totalTratamientos %>
            </div>

            <div style="
                color:var(--c4);
                font-size:13px;
            ">
                Tratamientos
            </div>

            <a href="${pageContext.request.contextPath}/svListarTratamiento"
               class="btn btn-primary"
               style="margin-top:12px; width:100%;">

                Ver

            </a>

        </div>

        <!-- PROPIETARIOS -->
        <div class="card"
             style="padding:24px; text-align:center;">

            <div style="font-size:36px;">
                👤
            </div>

            <div style="
                font-size:32px;
                font-weight:700;
                color:var(--c3);
            ">
                <%= totalPropietarios %>
            </div>

            <div style="
                color:var(--c4);
                font-size:13px;
            ">
                Propietarios
            </div>

            <a href="${pageContext.request.contextPath}/svListarPropietario"
               class="btn btn-primary"
               style="margin-top:12px; width:100%;">

                Ver

            </a>

        </div>

    </div>

    <!-- ACCESOS RÁPIDOS -->
    <div class="card">

        <div class="card-header">
            Accesos Rápidos
        </div>

        <div class="card-body"
             style="
                display:grid;
                grid-template-columns:repeat(3,1fr);
                gap:16px;
             ">

            <a href="${pageContext.request.contextPath}/svAgregarMascota"
               class="btn btn-primary">

                ➕ Nueva Mascota

            </a>

            <a href="${pageContext.request.contextPath}/svAgregarProfesional"
               class="btn btn-primary">

                ➕ Nuevo Profesional

            </a>

            <a href="${pageContext.request.contextPath}/svAgregarTratamiento"
               class="btn btn-primary">

                ➕ Nuevo Tratamiento

            </a>

            <a href="${pageContext.request.contextPath}/svListarPropietario"
               class="btn btn-secondary">

                👤 Propietarios

            </a>

            <a href="${pageContext.request.contextPath}/svListarTipo"
               class="btn btn-secondary">

                🐶 Tipos de Mascota

            </a>

            <a href="${pageContext.request.contextPath}/index.jsp"
               class="btn btn-secondary">

                📋 Ver Mascotas

            </a>

            <!-- NUEVO BOTÓN -->
            <a href="${pageContext.request.contextPath}/svVincularMascota"
               class="btn btn-secondary">

                🔗 Vincular Tratamientos

            </a>

        </div>

    </div>

</div>

</body>
</html>