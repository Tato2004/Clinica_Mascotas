<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String rol = (String) session.getAttribute("rol");

    if (rol == null) {
        rol = "";
    }
%>

<div class="sidebar">

    <div class="sidebar-brand">
        🐾 Clínica
    </div>

    <!-- ADMIN -->
    <% if ("admin".equals(rol)) { %>

        <a href="${pageContext.request.contextPath}/homeAdmin.jsp">
            🏠 Inicio
        </a>

        <a href="${pageContext.request.contextPath}/index.jsp">
            🐾 Mascotas
        </a>

        <a href="${pageContext.request.contextPath}/svAgregarMascota">
            ➕ Nueva Mascota
        </a>

        <a href="${pageContext.request.contextPath}/svListarProfesional">
            👨‍⚕️ Profesionales
        </a>

        <a href="${pageContext.request.contextPath}/svListarTratamiento">
            💊 Tratamientos
        </a>

        <a href="${pageContext.request.contextPath}/svSeleccionarTratamiento">
            🔗 Vincular Tratamiento
        </a>

        <a href="${pageContext.request.contextPath}/svListarTipo">
            🐶 Tipos
        </a>

        <a href="${pageContext.request.contextPath}/svListarPropietario">
            👤 Propietarios
        </a>

    <!-- MEDICO -->
    <% } else if ("medico".equals(rol)) { %>

        <a href="${pageContext.request.contextPath}/homeMedico.jsp">
            🏠 Inicio
        </a>

        <a href="${pageContext.request.contextPath}/index.jsp">
            🐾 Ver Mascotas
        </a>

        <a href="${pageContext.request.contextPath}/svAgregarTratamiento">
            💊 Nuevo Tratamiento
        </a>

        <a href="${pageContext.request.contextPath}/svListarTratamiento">
            📋 Ver Tratamientos
        </a>

        <a href="${pageContext.request.contextPath}/svSeleccionarTratamiento">
            🔗 Vincular Tratamiento
        </a>

    <!-- ESTETICO -->
    <% } else if ("estetico".equals(rol)) { %>

        <a href="${pageContext.request.contextPath}/homeEstetico.jsp">
            🏠 Inicio
        </a>

        <a href="${pageContext.request.contextPath}/index.jsp">
            🐾 Ver Mascotas
        </a>

        <a href="${pageContext.request.contextPath}/svAgregarTratamiento">
            ✂️ Nuevo Tratamiento
        </a>

        <a href="${pageContext.request.contextPath}/svListarTratamiento">
            📋 Ver Tratamientos
        </a>

        <a href="${pageContext.request.contextPath}/svSeleccionarTratamiento">
            🔗 Vincular Tratamiento
        </a>

    <!-- PROPIETARIO -->
    <% } else if ("propietario".equals(rol)) { %>

        <a href="${pageContext.request.contextPath}/homePropietario.jsp">
            🏠 Mi Panel
        </a>

        <a href="${pageContext.request.contextPath}/svMisMascotas">
            🐾 Mis Mascotas
        </a>

    <% } %>

    <!-- CERRAR SESIÓN -->
    <div style="margin-top:40px;">

        <a href="${pageContext.request.contextPath}/svCerrarSesion"
           style="
                background:#e76f51;
                color:white;
                text-align:center;
                border-radius:10px;
                display:block;
                padding:12px;
                text-decoration:none;
           ">

            🚪 Cerrar Sesión

        </a>

    </div>

</div>