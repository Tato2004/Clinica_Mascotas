<%@page import="Controller.Gestiones.Propietario"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Propietario p = (Propietario) request.getAttribute("propietario");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Propietario</title>

    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    
    <link rel="stylesheet" href="css/style.css">
</head>

<body>


<jsp:include page="/Inicio/sidebarDinamico.jsp"/>

<div class="main">

    <div class="page-header">
        <div>
            <h2>Editar Propietario</h2>
            <p>Actualiza la información del propietario</p>
        </div>
    </div>

    <% if (p != null) { %>

    <div class="form-card">

        <form action="svActualizarPropietario" method="POST">

            <input type="hidden" name="id" value="<%= p.getIdPropietario() %>">

           
            <div class="form-group">
                <label>Nombre </label>
                <input type="text"
                       name="nombre"
                       class="form-control"
                       value="<%= p.getNombre() %>"
                       required>
                <label>Apellidos</label>
                <input type="text"
                       name="apellidos"
                       class="form-control"
                       value="<%= p.getNombre() %>"
                       required>
           

          
            <div class="form-group">
                <label>Cédula</label>
                <input type="text"
                       name="cedula"
                       class="form-control"
                       value="<%= p.getCedula() %>"
                       required>
            </div>

            
            <div class="form-group">
                <label>Teléfono</label>
                <input type="text"
                       name="telefono"
                       class="form-control"
                       value="<%= p.getTelefono() != null ? p.getTelefono() : "" %>">
            </div>

            
            <div class="form-group">
                <label>Dirección</label>
                <input type="text"
                       name="direccion"
                       class="form-control"
                       value="<%= p.getDireccion() != null ? p.getDireccion() : "" %>">
            </div>

          
            <div class="form-group">
                <label>Correo electrónico</label>
                <input type="email"
                       name="correo"
                       class="form-control"
                       value="<%= p.getCorreo() != null ? p.getCorreo() : "" %>">
            </div>

         
            <div class="form-footer">
                <a href="svListarPropietario" class="btn btn-secondary">← Cancelar</a>
                <button type="submit" class="btn btn-primary">Actualizar</button>
            </div>

        </form>

    </div>

    <% } else { %>

        <div class="alert alert-danger">
            Propietario no encontrado.
        </div>

    <% } %>

</div>

</body>
</html>