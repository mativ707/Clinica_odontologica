<%@page import="logica.Turno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="es">
    <%@include file="components/head.jsp" %>
    <body class="sb-nav-fixed">
        <%@include file="components/header.jsp" %>
        <%@include file="components/sidebar.jsp" %>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <div class="row justify-content-center">
                        <div class="col-md-6 mt-5">
                            <div class="card shadow-lg border-0">
                                <div class="card-header bg-primary text-white">
                                    <h3 class="text-center font-weight-light">Agregar Observaciones del Turno</h3>
                                </div>
                                <div class="card-body">
                                    <% Turno turnoObservar = (Turno) request.getSession().getAttribute("turnoObservar");%>
                                    <form action="SvObservarTurno" method="POST">
                                        <input type="hidden" value="<%= turnoObservar.getId_turno()%>" name="idTurnoObservar">
                                        <div class="mb-3">
                                            <label for="observacionTextarea" class="form-label">Observaciones</label>
                                            <textarea id="observacionTextarea" name="observacion" rows="5" class="form-control" placeholder="Luego de atender al paciente se observa que..."></textarea>
                                        </div>
                                        <input value="<%= request.getSession().getAttribute("estadoTurnoNuevo")%>" class="form-control" id="inputRol" name="estadoTurnoNuevo" type="hidden"/>
                                        <div class="d-grid">
                                            <button type="submit" class="btn btn-primary btn-block">Modificar Turno</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
    <%@include file="components/scripts.jsp" %>
</body>
</html>