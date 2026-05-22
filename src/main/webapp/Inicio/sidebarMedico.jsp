<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="sidebar">
    <div class="sidebar-brand">🐾 Clínica</div>
    <div class="sidebar-section">MI PANEL</div>
    <a href="${pageContext.request.contextPath}/homeEstetico.jsp">🏠 Inicio</a>
    
    <div class="sidebar-section">TRATAMIENTOS</div>
    <a href="${pageContext.request.contextPath}/svAgregarTratamiento">✂️ Nuevo Tratamiento</a>
    <a href="${pageContext.request.contextPath}/svListarTratamiento">📋 Ver Tratamientos</a>
    <div class="sidebar-section">MASCOTAS</div>
    <a href="${pageContext.request.contextPath}/svAgregarMascota">➕ Nueva Mascota</a>
    <a href="${pageContext.request.contextPath}/index.jsp">🐾 Ver Mascotas</a>
    <div class="sidebar-section">SESIÓN</div>
    <a href="${pageContext.request.contextPath}/svCerrarSesion" class="sidebar-logout">🚪 Cerrar Sesión</a>
</div>