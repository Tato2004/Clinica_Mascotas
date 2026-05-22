<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Acceso Denegado</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body style="display:flex; justify-content:center; align-items:center; height:100vh; background:var(--c1);">
    <div class="card" style="padding:40px; text-align:center; max-width:400px;">
        <div style="font-size:60px;">🚫</div>
        <h2 style="color:var(--c5); margin:16px 0 8px;">Acceso Denegado</h2>
        <p style="color:var(--c3); margin-bottom:24px;">
            No tienes permisos para acceder a esta página.
        </p>
        <a href="${pageContext.request.contextPath}/Inicio/iniciodesesion.jsp"
           class="btn btn-primary">Volver al Login</a>
    </div>
</body>
</html>