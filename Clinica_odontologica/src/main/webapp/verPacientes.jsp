<%@page import="util.DateUtils"%>
<%@page import="logica.Paciente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="es">
    <%@include file="components/head.jsp" %>
    <body class="sb-nav-fixed">
        <%@include file="components/header.jsp" %>
        <%@include file="components/sidebar.jsp" %>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Pacientes</h1>
                    <div class="mt-4">
                        <div class="card-body">
                            <h3 class="h3 mb-2 text-gray-800">
                                Esta es la página para administrar la tabla de los Pacientes registrados
                            </h3>
                        </div>
                    </div>
                    <div class="card mb-2 mt-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            Tabla de Pacientes registrados
                        </div>
                        <div class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>DNI</th>
                                        <th>Nombre Paciente</th>
                                        <th>Apellido</th>
                                        <th>Teléfono</th>
                                        <th>Dirección</th>
                                        <th>Fecha de nacimiento</th>
                                        <th>Obra Social</th>
                                        <th>Tipo de Sangre</th>
                                        <th>Info. del responsable</th>
                                        <th>Editar</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>DNI</th>
                                        <th>Nombre Paciente</th>
                                        <th>Apellido</th>
                                        <th>Teléfono</th>
                                        <th>Dirección</th>
                                        <th>Fecha de nacimiento</th>
                                        <th>Obra Social</th>
                                        <th>Tipo de Sangre</th>
                                        <th>Info. del responsable</th>
                                        <th>Editar</th>
                                    </tr>
                                </tfoot>

                                <%
                                    List<Paciente> listaPac = (List) request.getSession().getAttribute("listaPacientes");
                                    DateUtils dtu = new DateUtils();
                                %>
                                <tbody>
                                    <% for (Paciente aux : listaPac) {%>
                                    <tr>
                                        <td><%= aux.getDni() != null ? aux.getDni() : ""%></td>
                                        <td><%= aux.getNombre() != null ? aux.getNombre() : ""%></td>
                                        <td><%= aux.getApellido() != null ? aux.getApellido() : ""%></td>
                                        <td><%= aux.getTelefono() != null ? aux.getTelefono() : ""%></td>
                                        <td><%= aux.getDireccion() != null ? aux.getDireccion() : ""%></td>
                                        <td><%= aux.getFechaNac() != null ? dtu.formatoYearMonthDay(aux.getFechaNac()) : ""%></td>
                                        <td><%= aux.isTiene_OS() ? "Posee OS" : "No posee OS"%></td>
                                        <td><%= aux.getTipoSangre() != null ? aux.getTipoSangre() : ""%></td>
                                        <td><%= aux.getUnResponsable() != null ? aux.getUnResponsable().getNombre() : "No posee responsable"%></td>
                                        <td style="display: flex; width: 230px;">
                                            <form name="eliminar" action="SvEliminarPaciente" method="POST">
                                                <button type="submit" class="btn btn-outline-danger" style="margin-right: 5px;">
                                                    <i class="fas fa-trash-alt"></i> Eliminar
                                                </button>
                                                <input type="hidden" name="idPaciente" value="<%= aux.getId()%>">
                                            </form>

                                            <form name="editar" action="SvEditarPaciente" method="GET">
                                                <button type="submit" class="btn btn-outline-primary" style="margin-right: 5px;">
                                                    <i class="fas fa-pencil-alt"></i> Editar
                                                </button>
                                                <input type="hidden" name="idPaciente" value="<%= aux.getId()%>">
                                            </form>
                                        </td>
                                    </tr>
                                    <% }%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </main>
        </div>

        <%@include file="components/scripts.jsp" %>
    </body>
</html>
