<%@page import="logica.enums.EstadoTurno"%>
<%@page import="util.DateUtils"%>
<%@page import="java.util.Date"%>
<%@page import="logica.Usuario"%>
<%@page import="java.time.LocalDate"%>
<%@page import="logica.Turno"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1 class="mt-4 display-4">¡Bienvenido <%= request.getSession().getAttribute("usuario")%>!</h1>
<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item active" aria-current="page">Sección inicial</li>
    </ol>
</nav>

<div class="row">
    <div class="col-lg-12 mb-4">
        <%
            List<Turno> listaTurnosHoy = (List) request.getSession().getAttribute("listaTurnosHoy");
            DateUtils dtu = new DateUtils();
        %>
        <% if (listaTurnosHoy != null) {%>
        <div class="card bg-dark text-white shadow">
            <div class="card-body">
                <h5 class="card-title"><i class="fas fa-calendar-day me-2"></i>Turnos para hoy: <%= dtu.formatoYearMonthDay(new Date())%></h5>
                <% if (!listaTurnosHoy.isEmpty()) {%>
                <p class="card-text">Turnos registrados:  <button type="button" class="btn btn-sm btn-outline-light" data-bs-toggle="modal" data-bs-target="#turnosModal"> <%= listaTurnosHoy.size()%> </button></p>
                    <% } else { %>
                <p class="card-text">Turnos registrados: Ninguno</p>
                <% } %>
            </div>
        </div>
        <!-- Ventana modal -->
        <div class="modal fade" id="turnosModal" tabindex="-1" aria-labelledby="turnosModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl modal-dialog-centered"> <!-- Utilizamos modal-xl para hacer que el modal sea extra grande -->
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="turnosModalLabel">Lista de turnos para hoy</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
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

                            <tbody>
                                <% for (Turno aux : listaTurnosHoy) {%>
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
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>

        <% } %>
    </div>
    <div class="col-lg-12 mb-4">
        <div class="card bg-light shadow">
            <div class="card-body">
                <div class="d-flex align-items-center">
                    <i class="fas fa-clipboard-check fa-3x me-3"></i>
                    <div>
                        <% List<Turno> turnosAtendidosHoy = (List) request.getSession().getAttribute("turnosAtendidosHoy");%>
                        <h5 class="card-title">Pacientes atendidos el día de hoy</h5>
                        <p class="card-text fs-4"><%= "Cantidad: " + turnosAtendidosHoy.size()%></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-lg-6 mb-4">
        <div class="card bg-light shadow">
            <div class="card-body">
                <div class="d-flex align-items-center">
                    <i class="fas fa-users fa-3x me-3"></i>
                    <div>
                        <h5 class="card-title">Pacientes con obra social</h5>
                        <p class="card-text fs-4"><%= "Cantidad: " + request.getSession().getAttribute("countPacConOS")%></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-6 mb-4">
        <div class="card bg-light shadow">
            <div class="card-body">
                <div class="d-flex align-items-center">
                    <i class="fas fa-users-slash fa-3x me-3"></i>
                    <div>
                        <h5 class="card-title">Pacientes sin obra social</h5>
                        <p class="card-text fs-4"><%= "Cantidad: " + request.getSession().getAttribute("countPacSinOS")%></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>