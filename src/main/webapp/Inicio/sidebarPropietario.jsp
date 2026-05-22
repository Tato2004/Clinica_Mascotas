<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="sidebar">
    <div class="sidebar-brand">🐾 Clínica</div>
    <div class="sidebar-section">MI PANEL</div>
    <a href="${pageContext.request.contextPath}/homePropietario.jsp">🏠 Inicio</a>
    <div class="sidebar-section">MIS MASCOTAS</div>
    <a href="${pageContext.request.contextPath}/svMisMascotas">🐾 Ver Mis Mascotas</a>
    <div class="sidebar-section">SESIÓN</div>
    <a href="${pageContext.request.contextPath}/svCerrarSesion" class="sidebar-logout">🚪 Cerrar Sesión</a>
</div>