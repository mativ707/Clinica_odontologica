<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="es">
    <%@include file="components/head.jsp" %>
    <body class="sb-nav-fixed">
        <%@include file="components/header.jsp" %>
        <%
            String rolUsu = (String) request.getSession().getAttribute("rolUsu");

            if (!rolUsu.equals("Secretario")) {
                response.sendRedirect("sinLogin.jsp");
            }
        %>
        <%@include file="components/sidebar.jsp" %>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <!-- Aqui va el contenido -->
                    <div class="register-container">
                        <div class="row justify-content-center">
                            <div class="card shadow-lg border-0 mt-5">
                                <div class="card-header"><h3 class="text-center font-weight-light">Registrar Responsable</h3></div>
                                <div class="card-body">
                                    <form action="SvResponsable" method="POST">
                                        <div class="row mb-3">
                                            <div class="col-md-12 mb-3">
                                                <div class="form-floating mb-3 mb-md-0">
                                                    <input class="form-control" id="inputDNI" name="dni" type="text" placeholder="Ingrese DNI del Responsable" />
                                                    <label for="inputDNI">DNI</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-floating mb-3 mb-md-0">
                                                    <input class="form-control" id="inputFirstName" name="nombre" type="text" placeholder="Ingrese nombre del Responsable" />
                                                    <label for="inputFirstName">Nombre</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-floating">
                                                    <input class="form-control" id="inputLastName" name="apellido" type="text" placeholder="Ingrese apellido del Responsable" />
                                                    <label for="inputLastName">Apellido</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mt-3">
                                                <div class="form-floating">
                                                    <input class="form-control" id="inputTel" name="tel" type="text" placeholder="Ingrese teléfono del Responsable" />
                                                    <label for="inputTel">Teléfono</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mt-3">
                                                <div class="form-floating">
                                                    <input class="form-control" id="inputDir" name="direccion" type="text" placeholder="Ingrese dirección del Responsable" />
                                                    <label for="inputDir">Dirección</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mt-3">
                                                <div class="form-floating">
                                                    <input class="form-control" id="inputDir" name="fechaNac" type="date" placeholder="Ingrese fecha de nacimiento del Responsable" />
                                                    <label for="inputDir">Fecha de Nacimiento</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mt-3">
                                                <div class="form-floating">
                                                    <input class="form-control" id="inputDir" name="tipoResp" type="text" placeholder="Ingrese tipo de sangre del paciente" />
                                                    <label for="inputEsp">Tipo de responsable</label>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Aqui va a ir todo respectivo al usuario y al horario -->
                                        <div class="mt-4 mb-0">
                                            <div class="d-grid"><button class="btn btn-primary btn-block" type="submit">Registrar Responsable</button></div>
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