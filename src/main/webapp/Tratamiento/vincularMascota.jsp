<%@page import="Controller.Gestiones.Mascota"%>
<%@page import="Controller.Gestiones.Tratamientos"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Tratamientos t =
            (Tratamientos) request.getAttribute("tratamiento");

    List<Mascota> todasMascotas =
            (List<Mascota>) request.getAttribute("todasMascotas");

    String resultado =
            (String) request.getAttribute("resultado");
%>

<!DOCTYPE html>
<html lang="es">

<head>

    <meta charset="UTF-8">

    <title>Vincular Mascotas</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

</head>

<body>

<!-- SIDEBAR DINÁMICO -->
<jsp:include page="/Inicio/sidebarDinamico.jsp"/>

<!-- MAIN -->
<div class="main">

    <!-- HEADER -->
    <div class="page-header">

        <div>

            <h2>Vincular Mascota</h2>

            <% if (t != null) { %>

                <p>
                    Tratamiento:
                    <strong>
                        <%= t.getNombreTx() %>
                    </strong>
                </p>

            <% } %>

        </div>

        <a href="svListarTratamiento"
           class="btn btn-secondary">

            ← Volver

        </a>

    </div>

    <!-- MENSAJE -->
    <% if (resultado != null) { %>

        <div class="alert alert-info">

            <%= resultado %>

        </div>

    <% } %>

    <!-- FORM -->
    <div class="form-card">

        <form action="svVincularMascota"
              method="POST">

            <input type="hidden"
                   name="idTx"
                   value="<%= t.getIdTx() %>">

            <input type="hidden"
                   name="accion"
                   value="vincular">

            <div class="form-group">

                <label>Selecciona Mascota</label>

                <select name="idMascota"
                        class="form-select"
                        required>

                    <option value="">
                        Seleccione
                    </option>

                    <% if (todasMascotas != null) {
                        for (Mascota m : todasMascotas) { %>

                        <option value="<%= m.getIdMascota() %>">

                            <%= m.getNombre() %>
                            (<%= m.getRaza() %>)

                        </option>

                    <% }} %>

                </select>

            </div>

            <div class="form-footer">

                <a href="svListarTratamiento"
                   class="btn btn-secondary">

                    Cancelar

                </a>

                <button type="submit"
                        class="btn btn-primary">

                    Vincular

                </button>

            </div>

        </form>

    </div>

</div>

</body>
</html>