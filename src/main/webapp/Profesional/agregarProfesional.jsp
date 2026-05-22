<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Agregar Profesional</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<jsp:include page="/Inicio/sidebarDinamico.jsp"/>
<div class="main">
    <div class="page-header">
        <div>
            <h2>Registrar Profesional</h2>
            <p>Completa la información del profesional</p>
        </div>
    </div>
    <div class="form-card">
        <form action="${pageContext.request.contextPath}/svAgregarProfesional" method="POST">

            <div style="display:grid; grid-template-columns:1fr 1fr; gap:16px;">
                <div class="form-group">
                    <label>Nombre</label>
                    <input type="text" name="nombre" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Apellido</label>
                    <input type="text" name="apellido" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Cédula</label>
                    <input type="text" name="cedula" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Teléfono</label>
                    <input type="text" name="telefono" class="form-control">
                </div>
            </div>

            <div class="form-group">
                <label>Correo</label>
                <input type="email" name="correo" class="form-control">
            </div>

            <div class="form-group">
                <label>Tipo de Profesional</label>
                <select name="tipo" class="form-select" required>
                    <option value="">Seleccione</option>
                    <option value="medico">🩺 Médico</option>
                    <option value="estetico">✂️ Estético</option>
                </select>
            </div>

            <!-- CREDENCIALES DE ACCESO -->
            <hr style="margin:20px 0; border-color:var(--c1);">
            <p style="font-weight:700; color:var(--c4); margin-bottom:12px;">
                🔐 Credenciales de acceso al sistema
            </p>

            <div style="display:grid; grid-template-columns:1fr 1fr; gap:16px;">
                <div class="form-group">
                    <label>Usuario</label>
                    <input type="text" name="usuario" class="form-control"
                           placeholder="Ej: laura.martinez" required>
                </div>
                <div class="form-group">
                    <label>Contraseña</label>
                    <input type="password" name="clave" class="form-control"
                           placeholder="Mínimo 4 caracteres" required>
                </div>
            </div>

            <div class="form-footer">
                <a href="${pageContext.request.contextPath}/svListarProfesional"
                   class="btn btn-secondary">← Cancelar</a>
                <button type="submit" class="btn btn-primary">💾 Guardar</button>
            </div>

        </form>
    </div>
</div>
</body>
</html>