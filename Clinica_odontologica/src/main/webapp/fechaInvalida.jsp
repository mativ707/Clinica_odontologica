<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="util.DateUtils"%>
<%@page import="logica.Paciente"%>
<%@page import="logica.Odontologo"%>
<%@page import="java.util.List"%>
<html lang="es">
    <%@include file="components/head.jsp" %>
    <body class="sb-nav-fixed">
        <%@include file="components/header.jsp" %>
        <%@include file="components/sidebar.jsp" %>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <div class="register-container">
                        <div class="row justify-content-center">
                            <div class="card shadow-lg border-0 mt-5">
                                <div class="card-header"><h3 class="text-center font-weight-light">Registrar Turno</h3></div>
                                <div class="card-body">
                                    <form action="SvTurno" method="POST">
                                        <div class="col-xl-12">
                                            <div class="card bg-warning text-white mt-5 mb-4">
                                                <div class="card-body">
                                                    <h5 class="card-title">Día ingresado no válido</h5>
                                                    <p class="card-text">
                                                        La fecha seleccionada no está registrada como día laboral disponible en el odontólogo seleccionado.
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-md-6 mt-3">
                                                <div class="form-floating">
                                                    <input class="form-control" id="inputFechaTurno" name="fechaTurno" type="date" placeholder="Ingrese fecha del Turno" 
                                                           min="<%= LocalDate.now().toString().substring(0, 10)%>" 
                                                           max="<%= LocalDate.now().plusDays(7).toString().substring(0, 10)%>" />
                                                    <label for="inputFechaTurno">Fecha de turno</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mt-3">
                                            <div class="form-floating">
                                                <select class="form-select" id="horas" name="horaTurno">
                                                    <option value="8">8</option>
                                                    <option value="9">9</option>
                                                    <option value="10">10</option>
                                                    <option value="11">11</option>
                                                    <option value="12">12</option>
                                                    <option value="13">13</option>
                                                    <option value="14">14</option>
                                                    <option value="15">15</option>
                                                    <option value="16">16</option>
                                                    <option value="17">17</option>
                                                    <option value="18">18</option>
                                                    <option value="19">19</option>
                                                </select>
                                                <label for="horas">Hora del Turno</label>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-12 mt-3">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="inputAfeccion" name="afeccion" type="text" placeholder="Ingrese la afección del paciente" />
                                                        <label for="inputAfeccion">Afección</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="card mb-2 mt-4">
                                            <div class="card-header">
                                                <i class="fas fa-table me-1"></i>
                                                Tabla de odontólogos registrados
                                            </div>
                                            <div class="card-body">
                                                <table class="table table-striped table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Nombre Odontólgo</th>
                                                            <th>Apellido</th>
                                                            <th>Teléfono</th>
                                                            <th>Dirección</th>
                                                            <th>Especialidad</th>
                                                            <th>Seleccionar</th>
                                                        </tr>
                                                    </thead>
                                                    <%
                                                        List<Odontologo> listaOdontos = (List) request.getSession().getAttribute("listaOdontos");
                                                        System.out.println("Longitud de la lista de odontos: " + listaOdontos.size());
                                                    %>
                                                    <tbody>
                                                        <% for (Odontologo odonto : listaOdontos) {%>
                                                        <tr>
                                                            <td><%= odonto.getNombre() != null ? odonto.getNombre() : ""%></td>
                                                            <td><%= odonto.getApellido() != null ? odonto.getApellido() : ""%></td>
                                                            <td><%= odonto.getTelefono() != null ? odonto.getTelefono() : ""%></td>
                                                            <td><%= odonto.getDireccion() != null ? odonto.getDireccion() : ""%></td>
                                                            <td><%= odonto.getEspecialidad() != null ? odonto.getEspecialidad() : ""%></td>
                                                            <td>
                                                                <input type="checkbox" name="idOdonto" value="<%= odonto.getId()%>">
                                                            </td>
                                                        </tr>
                                                        <% }%>
                                                    </tbody>
                                                </table>
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
                                                            <th>Seleccionar</th>
                                                        </tr>
                                                    </thead>
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
                                                            <td><%= aux.isTiene_OS() ? "Tiene obra social" : "No posee obra social"%></td>
                                                            <td><%= aux.getTipoSangre() != null ? aux.getTipoSangre() : ""%></td>
                                                            <td><%= aux.getUnResponsable() != null ? aux.getUnResponsable().getNombre() : "No posee responsable"%></td>
                                                            <td style="display: flex; width: 230px;">
                                                                <input type="checkbox" name="idPaciente" value="<%= aux.getId()%>">
                                                            </td>
                                                        </tr>
                                                        <% }%>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <div class="mt-4 mb-0">
                                            <div class="d-grid"><button class="btn btn-primary btn-block" type="submit">Registrar Turno</button></div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>

        <%@include file="components/scripts.jsp" %>
    </body>
</html>