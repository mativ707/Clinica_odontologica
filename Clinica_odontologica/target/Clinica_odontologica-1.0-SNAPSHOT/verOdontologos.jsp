<%@page import="logica.Horario"%>
<%@page import="util.DateUtils"%>
<%@page import="logica.Odontologo"%>
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
                    <h1 class="mt-4">Odontólogos</h1>
                    <div class="mt-4">
                        <div class="card-body">
                            <h3 class="h3 mb-2 text-gray-800">
                                Esta es la página para administrar la tabla de los Odontológos registrados
                            </h3>
                        </div>
                    </div>
                    <div class="card mb-2 mt-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            Tabla de Odontologos registrados
                        </div>
                        <div class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>DNI</th>
                                        <th>Nombre Odontólogo</th>
                                        <th>Apellido</th>
                                        <th>Teléfono</th>
                                        <th>Dirección</th>
                                        <th>Fecha de nacimiento</th>
                                        <th>Especialidad</th>
                                        <th>Usuario</th>
                                        <th colspan="3">Horario</th>
                                        <th>Editar</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>DNI</th>
                                        <th>Nombre Odontológo</th>
                                        <th>Apellido</th>
                                        <th>Teléfono</th>
                                        <th>Dirección</th>
                                        <th>Fecha de nacimiento</th>
                                        <th>Especialidad</th>
                                        <th>Usuario</th>
                                        <th colspan="3">Horario</th>
                                        <th>Editar</th>
                                    </tr>
                                </tfoot>

                                <%
                                    List<Odontologo> listaOdontos = (List) request.getSession().getAttribute("listaOdontos");
                                    DateUtils dtu = new DateUtils();
                                %>
                                <tbody>
                                    <% for (Odontologo aux : listaOdontos) {%>
                                    <tr>
                                        <td><%= aux.getDni() != null ? aux.getDni() : ""%></td>
                                        <td><%= aux.getNombre() != null ? aux.getNombre() : ""%></td>
                                        <td><%= aux.getApellido() != null ? aux.getApellido() : ""%></td>
                                        <td><%= aux.getTelefono() != null ? aux.getTelefono() : ""%></td>
                                        <td><%= aux.getDireccion() != null ? aux.getDireccion() : ""%></td>
                                        <td><%= aux.getFechaNac() != null ? dtu.formatoYearMonthDay(aux.getFechaNac()) : ""%></td>
                                        <td><%= aux.getEspecialidad() != null ? aux.getEspecialidad() : ""%></td>
                                        <td><%= aux.getUnUsuario().getNombre_usuario() != null ? aux.getUnUsuario().getNombre_usuario() : "Usuario no asignado!S"%></td>
                                        <td colspan="3">
                                            <% Horario horario = aux.getUnHorario(); %>
                                            <% if (horario != null) { %>
                                            <p>Días: 
                                                <% List<String> diasLaborales = horario.getDiasLaborales(); %>
                                                <% if (diasLaborales != null && !diasLaborales.isEmpty()) { %>
                                                <% for (String dia : diasLaborales) {%>
                                                <%= dia%>
                                                <% if (!dia.equals(diasLaborales.get(diasLaborales.size() - 1))) { %>, <% } %>
                                                <% } %>
                                                <% } else { %>
                                            <p>No se ha definido un horario para este odontólogo.</p>
                                            <% }%>
                                            </p>
                                            <p>Hora de inicio: <%= horario.getHorario_inicio()%></p>
                                            <p>Hora de fin: <%= horario.getHorario_fin()%></p>
                                            <% } else { %>
                                            <p>No se ha definido un horario para este odontólogo.</p>
                                            <% }%>
                                        </td>
                                        <td style="display: flex; width: 230px;">
                                            <form name="eliminar" action="SvEliminarOdontologo" method="POST">
                                                <button type="submit" class="btn btn-outline-danger" style="margin-right: 5px;">
                                                    <i class="fas fa-trash-alt"></i> Eliminar
                                                </button>
                                                <input type="hidden" name="idOdonto" value="<%= aux.getId()%>">
                                            </form>

                                            <form name="editar" action="SvEditarOdontologo" method="GET">
                                                <button type="submit" class="btn btn-outline-primary" style="margin-right: 5px;">
                                                    <i class="fas fa-pencil-alt"></i> Editar
                                                </button>
                                                <input type="hidden" name="idOdonto" value="<%= aux.getId()%>">
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