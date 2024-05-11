<%@page import="java.util.List"%>
<%@page import="logica.Horario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="es">
    <%@include file="components/head.jsp" %>
    <body class="sb-nav-fixed">
        <%@include file="components/header.jsp" %>
        <%@include file="components/sidebar.jsp" %>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Horarios</h1>
                    <div class="mt-4">
                        <div class="card-body">
                            <h3 class="h3 mb-2 text-gray-800">
                                Esta es la página para administrar la tabla de los Horarios registrados
                            </h3>
                        </div>
                    </div>
                    <div class="card mb-2 mt-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            Tabla de Horarios registrados
                        </div>
                        <div class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Dias laborales</th>
                                        <th>Horario de Inicio</th>
                                        <th>Horario de Fin</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>ID</th>
                                        <th>Dias laborales</th>
                                        <th>Horario de Inicio</th>
                                        <th>Horario de Fin</th>
                                    </tr>
                                </tfoot>

                                <tbody>
                                    <% List<Horario> listaHorarios = (List) request.getSession().getAttribute("listaHorarios");
                                       for (Horario horario : listaHorarios) {%>
                                    <tr>
                                        <td><%= horario.getId_horario()%></td>
                                        <td>
                                            <% List<String> diasLaborales = horario.getDiasLaborales(); %>
                                            <% if (diasLaborales != null && !diasLaborales.isEmpty()) { %>
                                            <% for (String dia : diasLaborales) {%>
                                            <%= dia%>
                                            <% if (!dia.equals(diasLaborales.get(diasLaborales.size() - 1))) { %>, <% } %>
                                            <% } %>
                                            <% } else { %>
                                            No definido
                                            <% }%>
                                        </td>
                                        <td><%= horario.getHorario_inicio()%></td>
                                        <td><%= horario.getHorario_fin()%></td>
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