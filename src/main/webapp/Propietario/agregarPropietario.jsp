<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro Propietario</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #eef2f7;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .card {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
            width: 100%;
            max-width: 600px;
        }
        h2 { text-align: center; margin-bottom: 20px; }
        .grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }
        .form-group label { font-weight: 600; }
        .form-control { border-radius: 10px; padding: 10px; }
        .btn-primary  { width: 100%; margin-top: 15px; border-radius: 10px; }
        .btn-secondary{ width: 100%; margin-top: 10px;  border-radius: 10px; }
        .alert-error {
            background: #ff7675;
            color: white;
            padding: 10px;
            border-radius: 10px;
            text-align: center;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<div class="card">
    <h2>🐾 Registro de Propietario</h2>

    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <div class="alert-error"><%= error %></div>
    <% } %>

    <form action="${pageContext.request.contextPath}/svAgregarPropietario" method="POST">
        <div class="grid">
            <div class="form-group">
                <label>Nombre</label>
                <input type="text" name="nombre" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Apellidos</label>
                <input type="text" name="apellidos" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Cédula</label>
                <input type="text" name="cedula" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Teléfono</label>
                <input type="text" name="telefono" class="form-control">
            </div>
            <div class="form-group">
                <label>Dirección</label>
                <input type="text" name="direccion" class="form-control">
            </div>
            <div class="form-group">
                <label>Correo</label>
                <input type="email" name="correo" class="form-control">
            </div>
            <div class="form-group">
                <label>Usuario</label>
                <input type="text" name="usuario" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Contraseña</label>
                <input type="password" name="clave" class="form-control" required>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">
            ✅ Registrarse
        </button>
        <a href="${pageContext.request.contextPath}/Inicio/iniciodesesion.jsp"
           class="btn btn-secondary">
            ← Volver al Login
        </a>
    </form>
</div>
</body>
</html>