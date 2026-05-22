<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="sidebar">
    <div class="sidebar-brand">🐾 Clínica</div>
    <div class="sidebar-section">MASCOTAS</div>
    <a href="${pageContext.request.contextPath}/svAgregarMascota">➕ Nueva Mascota</a>
    <a href="${pageContext.request.contextPath}/index.jsp">📋 Ver Mascotas</a>
    <div class="sidebar-section">CLÍNICA</div>
    <a href="${pageContext.request.contextPath}/svAgregarTratamiento">💊 Nuevo Tratamiento</a>
    <a href="${pageContext.request.contextPath}/svListarTratamiento">📋 Ver Tratamientos</a>
    <a href="${pageContext.request.contextPath}/svAgregarProfesional">👨‍⚕️ Nuevo Profesional</a>
    <a href="${pageContext.request.contextPath}/svListarProfesional">📋 Ver Profesionales</a>
    <div class="sidebar-section">ADMINISTRACIÓN</div>
    <a href="${pageContext.request.contextPath}/svListarPropietario">👤 Propietarios</a>
    <a href="${pageContext.request.contextPath}/svListarTipo">🐶 Tipos de Mascota</a>
    <div class="sidebar-section">SESIÓN</div>
    <a href="${pageContext.request.contextPath}/svCerrarSesion" class="sidebar-logout">🚪 Cerrar Sesión</a>
</div>