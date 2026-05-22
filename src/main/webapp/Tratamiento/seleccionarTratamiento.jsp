<%@page import="Controller.Gestiones.Tratamientos"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Tratamientos> tratamientos =
            (List<Tratamientos>) request.getAttribute("tratamientos");
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Seleccionar Tratamiento</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

</head>

<body>

<jsp:include page="/Inicio/sidebarDinamico.jsp"/>

<div class="main">

    <div class="page-header">

        <div>

            <h2>Seleccionar Tratamiento</h2>

            <p>
                Elige el tratamiento para vincular mascotas
            </p>

        </div>

    </div>

    <div class="form-card">

        <table class="table table-hover">

            <thead>

                <tr>

                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Acción</th>

                </tr>

            </thead>

            <tbody>

                <% if (tratamientos != null) {
                    for (Tratamientos t : tratamientos) { %>

                    <tr>

                        <td>
                            <%= t.getIdTx() %>
                        </td>

                        <td>
                            <%= t.getNombreTx() %>
                        </td>

                        <td>

                            <a href="svVincularMascota?idTx=<%= t.getIdTx() %>"
                               class="btn btn-primary">

                                Seleccionar

                            </a>

                        </td>

                    </tr>

                <% }} %>

            </tbody>

        </table>

    </div>

</div>

</body>
</html>