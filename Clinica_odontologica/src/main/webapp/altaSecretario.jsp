<%@page import="logica.Usuario"%>
<%@page import="java.util.List"%>
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
                    <div class="register-container">
                        <div class="register-container">
                            <div class="row justify-content-center">
                                <div class="card shadow-lg border-0 mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light">Registrar Secretario</h3></div>
                                    <div class="card-body">
                                        <form action="SvSecretario" method="POST">
                                            <div class="row mb-3">
                                                <div class="col-md-12 mb-3">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="inputDNI" name="dni" type="text" placeholder="Ingrese DNI del Secretario" />
                                                        <label for="inputDNI">DNI</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="inputFirstName" name="nombre" type="text" placeholder="Ingrese nombre del Secretario" />
                                                        <label for="inputFirstName">Nombre</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="inputLastName" name="apellido" type="text" placeholder="Ingrese apellido del Secretario" />
                                                        <label for="inputLastName">Apellido</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 mt-3">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="inputTel" name="tel" type="text" placeholder="Ingrese teléfono del Secretario" />
                                                        <label for="inputTel">Teléfono</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 mt-3">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="inputDir" name="direccion" type="text" placeholder="Ingrese dirección del Secretario" />
                                                        <label for="inputDir">Dirección</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 mt-3">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="inputFecha" name="fechaNac" type="date" placeholder="Ingrese fecha de nacimiento del Secretario" />
                                                        <label for="inputFecha">Fecha de Nacimiento</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 mt-3">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="inputEspec" name="sector" type="text" placeholder="Ingrese el sector del secretario" />
                                                        <label for="inputEspec">Sector</label>
                                                    </div>
                                                </div>

                                                <!-- Aqui va lo del usuario -->

                                                <% List<Usuario> listaUsuarios = (List) request.getSession().getAttribute("listaUsuarios");
                                                    System.out.println("Longitud de la lista de usuarios: " + listaUsuarios.size());%>

                                                <h3 class="mt-4 mb-0">Usuario</h3>
                                                <div class="col-md-6 mt-3">
                                                    <div class="form-floating">
                                                        <select class="form-select" id="usuarios" name="idUsuSecretario">
                                                            <% if (listaUsuarios != null) {
                                                                    for (Usuario aux : listaUsuarios) {%>
                                                            <option value="<%= aux.getId_usuario()%>"><%= aux.getNombre_usuario()%></option>
                                                            <% }
                                                                }%>
                                                        </select>
                                                        <label for="usuarios">Lista de usuarios disponibles</label>
                                                    </div>
                                                </div>
                                            </div>
                                    </div>
                                    <div class="mt-4 mb-4">
                                        <div class="d-grid"><button class="btn btn-primary btn-block" type="submit">Registrar Secretario</button></div>
                                    </div>
                                    </form>
                                </div>
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