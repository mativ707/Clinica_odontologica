<%@page import="logica.Paciente"%>
<%@page import="logica.Responsable"%>
<%@page import="util.DateUtils"%>
<%@page import="java.util.List"%>
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
                    <div class="register-container">
                        <div class="row justify-content-center">
                            <div class="card shadow-lg border-0 mt-5">
                                <div class="card-header"><h3 class="text-center font-weight-light">Registrar Paciente</h3></div>
                                <div class="card-body">
                                    <form action="SvEditarPaciente" method="POST">
                                        
                                        <% Paciente pacienteEdit = (Paciente) request.getSession().getAttribute("pacienteEdit"); %>
                                        
                                        <div class="row mb-3">
                                            <div class="col-md-12 mb-3">
                                                <div class="form-floating mb-3 mb-md-0">
                                                    <input class="form-control" id="inputDNI" value="<%= pacienteEdit.getDni() %>" name="dniPac" type="text" placeholder="Ingrese DNI del Paciente" />
                                                    <label for="inputDNI">DNI</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-floating mb-3 mb-md-0">
                                                    <input class="form-control" id="inputFirstName" value="<%= pacienteEdit.getNombre() %>" name="nombre" type="text" placeholder="Ingrese nombre del Paciente" />
                                                    <label for="inputFirstName">Nombre</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-floating">
                                                    <input class="form-control" id="inputLastName" value="<%= pacienteEdit.getApellido()%>" name="apellido" type="text" placeholder="Ingrese apellido del Paciente" />
                                                    <label for="inputLastName">Apellido</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mt-3">
                                                <div class="form-floating">
                                                    <input class="form-control" id="inputTel" value="<%= pacienteEdit.getTelefono() %>" name="tel" type="text" placeholder="Ingrese teléfono del Paciente" />
                                                    <label for="inputTel">Teléfono</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mt-3">
                                                <div class="form-floating">
                                                    <input class="form-control" id="inputDir" value="<%= pacienteEdit.getDireccion()%>" name="direccion" type="text" placeholder="Ingrese dirección del Paciente" />
                                                    <label for="inputDir">Dirección</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mt-3">
                                                <div class="form-floating">
                                                    <input class="form-control" id="inputFecha" value="<%= pacienteEdit.getFechaNac() %>" name="fechaPac" type="date" placeholder="Ingrese fecha de nacimiento del Paciente" />
                                                    <label for="inputFecha">Fecha de Nacimiento</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mt-3">
                                                <div class="form-floating">
                                                    <select class="form-select" id="obraSoc" name="poseeObraSoc">
                                                        <option value="TRUE">Sí</option>
                                                        <option value="FALSE">No</option>
                                                    </select>
                                                    <label for="obraSoc">¿Posee obra social?</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mt-3">
                                                <div class="form-floating">
                                                    <select class="form-select" id="inputTipoSangre" name="tipoSangre">
                                                        <option value="<%= pacienteEdit.getTipoSangre() %>" selected>Seleccione tipo de sangre</option>
                                                        <option value="A+">A+</option>
                                                        <option value="A-">A-</option>
                                                        <option value="B+">B+</option>
                                                        <option value="B-">B-</option>
                                                        <option value="AB+">AB+</option>
                                                        <option value="AB-">AB-</option>
                                                        <option value="O+">O+</option>
                                                        <option value="O-">O-</option>
                                                    </select>
                                                    <label for="inputTipoSangre">Tipo de Sangre</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="card mb-2 mt-4">
                                            <div class="card-header">
                                                <i class="fas fa-table me-1"></i>
                                                Tabla de responsables registrados
                                            </div>
                                            <div class="card-body">
                                                <table id="datatablesSimple">
                                                    <thead>
                                                        <tr>
                                                            <th>DNI</th>
                                                            <th>Nombre Responsable</th>
                                                            <th>Apellido</th>
                                                            <th>Teléfono</th>
                                                            <th>Dirección</th>
                                                            <th>Fecha de nacimiento</th>
                                                            <th>Tipo de responsabilidad</th>
                                                            <th>Seleccionar</th>
                                                        </tr>
                                                    </thead>
                                                    <tfoot>
                                                        <tr>
                                                            <th>DNI</th>
                                                            <th>Nombre Responsable</th>
                                                            <th>Apellido</th>
                                                            <th>Teléfono</th>
                                                            <th>Dirección</th>
                                                            <th>Fecha de nacimiento</th>
                                                            <th>Tipo de responsabilidad</th>
                                                            <th>Seleccionar</th>
                                                        </tr>
                                                    </tfoot>

                                                    <!-- Aqui haremos la consulta para traer los Responsables -->
                                                    <%
                                                        List<Responsable> listaResp = (List) request.getSession().getAttribute("listaResp");
                                                        DateUtils dtu = new DateUtils();
                                                    %>
                                                    <tbody>
                                                        <% for (Responsable aux : listaResp) {%>
                                                        <tr>
                                                            <td><%= aux.getDni() != null ? aux.getDni() : ""%></td>
                                                            <td><%= aux.getNombre() != null ? aux.getNombre() : ""%></td>
                                                            <td><%= aux.getApellido() != null ? aux.getApellido() : ""%></td>
                                                            <td><%= aux.getTelefono() != null ? aux.getTelefono() : ""%></td>
                                                            <td><%= aux.getDireccion() != null ? aux.getDireccion() : ""%></td>
                                                            <td><%= aux.getFechaNac() != null ? dtu.formatoYearMonthDay(aux.getFechaNac()) : ""%></td>
                                                            <td><%= aux.getTipo_respons()%></td>
                                                            <td style="display: flex; width: 230px;">
                                                                <input type="checkbox" name="idRespPaciente" value="<%= aux.getId() %>">
                                                            </td>
                                                        </tr>
                                                        <% }%>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <div class="mt-4 mb-0">
                                            <div class="d-grid"><button class="btn btn-primary btn-block" type="submit">Modificar Paciente</button></div>
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