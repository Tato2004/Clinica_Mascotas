<%@page import="Controller.Gestiones.tipoMascota"%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% tipoMascota t = (tipoMascota) request.getAttribute("tipo"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"><title>Editar Tipo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root{--dark:#1d3557;--blue:#457b9d;--light:#f1faee;--sky:#a8dadc;}
        body{background:var(--light);}
        .sidebar{width:240px;height:100vh;position:fixed;background:var(--dark);color:white;padding:20px;}
        .sidebar h3{color:var(--sky);margin-bottom:30px;}
        .sidebar a{display:block;color:white;padding:10px;text-decoration:none;border-radius:8px;margin-bottom:8px;}
        .sidebar a:hover{background:var(--blue);}
        .main{margin-left:260px;padding:30px;}
    </style>
</head>
<body>
<jsp:include page="/Inicio/sidebarDinamico.jsp"/>
<div class="main">
    <h2>Editar Tipo de Mascota</h2>
    <% if (t != null) { %>
    <div class="card p-4 shadow-sm" style="border-radius:15px; max-width:500px;">
        
        <form action="svActualizarTipo" method="POST">
            
            <input type="hidden" name="id" value="<%= t.getIdTipoMascota() %>">
            <div class="mb-3">
                <label class="fw-bold">Nombre</label>
                <input type="text" name="nombre" class="form-control"
                       value="<%= t.getNombre() %>" required>
            </div>
            <div class="d-flex justify-content-between">
                <a href="SvListarTipo" class="btn btn-outline-secondary">Cancelar</a>
                <button type="submit" class="btn btn-primary">Actualizar</button>
            </div>
        </form>
    </div>
    <% } else { %>
        <div class="alert alert-danger">Tipo no encontrado.</div>
    <% } %>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>