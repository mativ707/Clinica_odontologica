<%@page import="logica.Usuario"%>
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
                    <div class="row justify-content-center">
                        <div class="card shadow-lg border-0 mt-5">
                            <div class="card-header"><h3 class="text-center font-weight-light">Editar Usuario</h3></div>
                            <div class="card-body">

                                <%Usuario usuEditar = (Usuario) request.getSession().getAttribute("usuEditar");%>

                                <form action="SvEditarUsuario" method="POST">
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input value="<%= usuEditar.getNombre_usuario()%>" class="form-control" id="inputNombre" name="nombre_usuario" type="text" placeholder="Ingrese DNI del Usuario" />
                                                <label for="inputNombre">Nombre</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input value="<%= usuEditar.getRol()%>" class="form-control" id="inputRol" name="rol" type="text" placeholder="Ingrese nombre del Usuario" />
                                                <label for="inputRol">Rol</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input value="<%= usuEditar.getContrasenia()%>" class="form-control" id="inputPassword" name="contrasenia" type="password" placeholder="Ingrese su contraseña" />
                                                <label for="inputPassword">Contraseña</label>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Botón de envío de formulario -->
                                    <div class="d-grid"><button type="submit" class="btn btn-primary btn-block">Guardar Usuario</button></div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>

        <%@include file="components/scripts.jsp" %>
    </body>
</html>
