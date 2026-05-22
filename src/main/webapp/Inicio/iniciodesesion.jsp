<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Login - Clínica Veterinaria</title>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:Arial, sans-serif;
        }

        body{

            height:100vh;

            display:flex;

            justify-content:flex-start;
            align-items:center;

            padding-left:70px;

            background-image:url('https://images.unsplash.com/photo-1450778869180-41d0601e046e?q=80&w=1600&auto=format&fit=crop');

            background-size:cover;
            background-position:center;
            background-repeat:no-repeat;
        }

        .login-box{

            width:360px;

            padding:35px;

            background:rgba(0,0,0,0.35);

            border-radius:20px;

            box-shadow:0 0 20px rgba(0,0,0,0.3);

            color:white;

            backdrop-filter:blur(8px);
        }

        .titulo{
            text-align:center;
            margin-bottom:5px;
            font-size:14px;
            opacity:.9;
        }

        h2{
            text-align:center;
            margin-bottom:25px;
            font-size:30px;
        }

        .input-group{
            margin-bottom:18px;
        }

        .input-group label{
            display:block;
            margin-bottom:8px;
            font-weight:bold;
        }

        .input-group input{

            width:100%;

            padding:12px;

            border:none;

            border-radius:10px;

            outline:none;
        }

        .btn-login{

            width:100%;

            padding:12px;

            border:none;

            border-radius:10px;

            background:#00b894;

            color:white;

            font-size:16px;

            cursor:pointer;

            transition:.3s;
        }

        .btn-login:hover{
            background:#019875;
        }

        .registrarse{

            text-align:center;

            margin-top:18px;
        }

        .registrarse a{

            color:#74b9ff;

            text-decoration:none;
        }

        .registrarse a:hover{
            text-decoration:underline;
        }

        .mensaje-error{

            margin-top:15px;

            background:#ff7675;

            padding:12px;

            border-radius:10px;

            text-align:center;
        }

    </style>

</head>

<body>

<div class="login-box">

    <p class="titulo">🐾 Clínica Veterinaria</p>

    <h2>Iniciar Sesión</h2>

    <form action="${pageContext.request.contextPath}/svInicioSesion"
          method="POST">

        <div class="input-group">

            <label>Usuario</label>

            <input type="text"
                   name="usuario"
                   placeholder="Ingrese su usuario"
                   required>

        </div>

        <div class="input-group">

            <label>Contraseña</label>

            <input type="password"
                   name="clave"
                   placeholder="Ingrese su contraseña"
                   required>

        </div>

        <button type="submit" class="btn-login">
            Entrar
        </button>

    </form>

    <div class="registrarse">

        ¿No tienes cuenta?

        <a href="${pageContext.request.contextPath}/svAgregarPropietario">
            Registrarse
        </a>

    </div>

    <%
        String error = (String) request.getAttribute("error");

        if(error != null){
    %>

        <div class="mensaje-error">
            <%= error %>
        </div>

    <% } %>

</div>

</body>
</html>