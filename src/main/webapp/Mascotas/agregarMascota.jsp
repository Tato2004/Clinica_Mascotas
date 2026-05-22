<%@page import="Controller.Gestiones.Propietario"%>
<%@page import="Controller.Gestiones.tipoMascota"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<tipoMascota> tipos = (List<tipoMascota>) request.getAttribute("tipos");
    List<Propietario> propietarios = (List<Propietario>) request.getAttribute("propietarios");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Mascota</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- CSS -->
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

    <!-- SIDEBAR -->
    <div class="sidebar">
        <jsp:include page="/Inicio/sidebarDinamico.jsp"/>
    </div>

    <!-- CONTENIDO -->
    <div class="main">

        <div class="page-header">
            <div>
                <h2>Registrar Nueva Mascota</h2>
                <p>Ingresa la información de la mascota</p>
            </div>
        </div>

        <div class="form-card">

            <form action="svAgregarMascota" method="POST">

                <!-- Nombre -->
                <div class="form-group mb-3">
                    <label class="form-label">Nombre</label>

                    <input type="text"
                           name="nombre"
                           class="form-control"
                           required>
                </div>

                <!-- Raza + Edad -->
                <div style="display:grid; grid-template-columns:1fr 1fr; gap:18px;">

                    <!-- Raza -->
                    <div class="form-group mb-3">
                        <label class="form-label">Raza</label>

                        <input type="text"
                               name="raza"
                               class="form-control"
                               required>
                    </div>

                    <!-- Edad -->
                    <div class="form-group mb-3">
                        <label class="form-label">Edad</label>

                        <input type="number"
                               name="edad"
                               class="form-control"
                               min="0"
                               required>
                    </div>

                </div>

                <!-- Género -->
                <div class="form-group mb-3">

                    <label class="form-label">Género</label>

                    <select name="genero" class="form-select" required>

                        <option value="">Seleccione</option>
                        <option value="Macho">Macho</option>
                        <option value="Hembra">Hembra</option>

                    </select>
                </div>

                <!-- Foto -->
                <div class="form-group mb-3">

                    <label class="form-label">Foto (URL)</label>

                    <input type="text"
                           name="foto"
                           class="form-control">
                </div>

                <!-- Tipo Mascota -->
                <div class="form-group mb-3">

                    <label class="form-label">Tipo de Mascota</label>

                    <select name="idTipoMascota"
                            class="form-select"
                            required>

                        <option value="">Seleccione tipo</option>

                        <%
                            if (tipos != null) {
                                for (tipoMascota t : tipos) {
                        %>

                            <option value="<%= t.getIdTipoMascota() %>">
                                <%= t.getNombre() %>
                            </option>

                        <%
                                }
                            }
                        %>

                    </select>
                </div>

                <!-- Propietario -->
                <div class="form-group mb-4">

                    <label class="form-label">Propietario</label>

                    <select name="idPropietario"
                            class="form-select"
                            required>

                        <option value="">Seleccione propietario</option>

                        <%
                            if (propietarios != null) {
                                for (Propietario p : propietarios) {
                        %>

                            <option value="<%= p.getIdPropietario() %>">
                                <%= p.getNombre() %>
                            </option>

                        <%
                                }
                            }
                        %>

                    </select>
                </div>

                <!-- BOTONES -->
                <div class="form-footer d-flex gap-2">

                    <a href="index.jsp" class="btn btn-secondary">
                        ← Cancelar
                    </a>

                    <button type="submit" class="btn btn-primary">
                        Guardar
                    </button>

                </div>

            </form>

        </div>

    </div>

</body>
</html>