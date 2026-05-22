<%@page import="Controller.Gestiones.tipoMascota"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<tipoMascota> tipos =
            (List<tipoMascota>) request.getAttribute("tipos");

    String resultado =
            (String) request.getAttribute("resultado");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Tipos de Mascota</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- CSS PRINCIPAL -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

</head>

<body>

<!-- SIDEBAR -->
<jsp:include page="/Inicio/sidebarDinamico.jsp"/>

<!-- MAIN -->
<div class="main">

    <!-- HEADER -->
    <div class="page-header">

        <div>

            <h2>Tipos de Mascota</h2>

            <p>
                Gestiona los tipos registrados
            </p>

        </div>

        <a href="svAgregarTipo"
           class="btn btn-success">

            + Nuevo Tipo

        </a>

    </div>

    <!-- ALERTA -->
    <% if (resultado != null) { %>

        <div class="alert alert-info">

            <%= resultado %>

        </div>

    <% } %>

    <!-- CARD -->
    <div class="card">

        <div class="card-body">

            <table class="table table-hover table-bordered">

                <thead class="table-dark">

                    <tr>

                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Acciones</th>

                    </tr>

                </thead>

                <tbody>

                    <% if (tipos != null) {
                        for (tipoMascota t : tipos) { %>

                        <tr>

                            <td>
                                <%= t.getIdTipoMascota() %>
                            </td>

                            <td>
                                <strong>
                                    <%= t.getNombre() %>
                                </strong>
                            </td>

                            <td style="display:flex; gap:6px;">

                                <a href="svEditarTipo?id=<%= t.getIdTipoMascota() %>"
                                   class="btn btn-warning btn-sm">

                                   Editar

                                </a>

                                <a href="svBorrarTipo?id=<%= t.getIdTipoMascota() %>"
                                   class="btn btn-danger btn-sm"
                                   onclick="return confirm('¿Borrar este tipo?')">

                                   Borrar

                                </a>

                            </td>

                        </tr>

                    <% }} %>

                </tbody>

            </table>

        </div>

    </div>

</div>

</body>

</html>