<%@page import="logica.enums.EstadoTurno"%>
<%@page import="util.DateUtils"%>
<%@page import="logica.Turno"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <%@include file="components/head.jsp" %>
    <body class="sb-nav-fixed">
        <%@include file="components/header.jsp" %>
        <%@include file="components/sidebar.jsp" %>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Turnos</h1>
                    <div class="mt-4">
                        <div class="card-body">
                            <h3 class="h3 mb-2 text-gray-800">
                                Esta es la página para ver los turnos registrados
                            </h3>
                        </div>
                    </div>
                    <div class="card mb-2 mt-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            Turnos registrados
                        </div>
                        <div class="card-body">
                            <table id="datatablesSimple" class="table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Fecha turno</th>
                                        <th>Hora</th>
                                        <th style="word-wrap: break-word;">Afección</th>
                                        <th>Odontólogo</th>
                                        <th>Nombre Paciente</th>
                                        <th>DNI Paciente</th>
                                        <th>Estado</th>
                                        <th>Observaciones</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>ID</th>
                                        <th>Fecha turno</th>
                                        <th>Hora</th>
                                        <th style="word-wrap: break-word;">Afección</th>
                                        <th>Odontólogo</th>
                                        <th>Nombre Paciente</th>
                                        <th>DNI Paciente</th>
                                        <th>Estado</th>
                                        <th>Observaciones</th>
                                        <th>Acciones</th>
                                    </tr>
                                </tfoot>

                                <%        
                                    List<Turno> listaTurnos = (List) request.getSession().getAttribute("listaTurnos");
                                    DateUtils dtu = new DateUtils();
                                %>
                                <tbody>
                                    <% for (Turno aux : listaTurnos) {%>
                                    <tr>
                                        <td><%= aux.getId_turno()%></td>
                                        <td><%= aux.getFechaTurno() != null ? dtu.formatoYearMonthDay(aux.getFechaTurno()) : ""%></td>
                                        <td><%= aux.getHora_turno() != null ? aux.getHora_turno() : ""%></td>
                                        <td style="max-width: 150px; word-wrap: break-word;"><%= aux.getAfeccion() != null ? aux.getAfeccion() : ""%></td>
                                        <td><%= aux.getOdonto() != null ? aux.getOdonto().getNombre() + " " + aux.getOdonto().getApellido() + " (" + aux.getOdonto().getEspecialidad() + ")" : "ERROR"%></td>
                                        <td><%= aux.getPacien() != null ? aux.getPacien().getNombre() + " " + aux.getPacien().getApellido() : "ERROR"%></td>
                                        <td><%= aux.getPacien().getDni() != null ? aux.getPacien().getDni() : "ERROR"%></td>
                                        <td><%= aux.getEstado() != null ? aux.getEstado().toString() : ""%></td>
                                        <td><%= aux.getObservaciones() != null ? aux.getObservaciones() : "-"%></td>
                                        <td>
                                            <!-- Botón para modificar el estado del turno -->
                                            <form action="SvGetTurnos" method="POST">
                                                <input type="hidden" name="turnoId" value="<%= aux.getId_turno()%>">
                                                <select name="estadoTurno" class="form-select">
                                                    <% for (EstadoTurno estado : EstadoTurno.values()) {%>
                                                    <option value="<%= estado.name()%>" class="form-option"><%= estado.name()%></option>
                                                    <% } %>
                                                </select>
                                                <div>
                                                    <button type="submit" class="btn btn-outline-secondary mt-3">Actualizar Estado</button>
                                                </div>
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