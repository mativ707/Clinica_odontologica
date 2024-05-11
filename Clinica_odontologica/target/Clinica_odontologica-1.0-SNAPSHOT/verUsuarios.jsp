<%@page import="logica.Usuario"%>
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
                    <h1 class="mt-4">Usuarios</h1>
                    <div class="mt-4">
                        <div class="card-body">
                            <h3 class="h3 mb-2 text-gray-800">
                                Esta es la página para administrar los usuarios registrados
                            </h3>
                        </div>
                    </div>
                    <div class="card mb-2 mt-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            Usuarios registrados
                        </div>
                        <div class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombre Usuario</th>
                                        <th>Rol</th>
                                        <th>Editar</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombre Usuario</th>
                                        <th>Rol</th>
                                        <th>Editar</th>
                                    </tr>
                                </tfoot>

                                <!-- Aqui haremos la consulta para traer los usuarios -->
                                <%
                                    List<Usuario> listaUsuarios = (List) request.getSession().getAttribute("listaUsuarios");
                                %>
                                <tbody>
                                    <% for (Usuario aux : listaUsuarios) {%>
                                    <tr>
                                        <td><%= aux.getId_usuario()%></td>
                                        <td><%= aux.getNombre_usuario()%></td>
                                        <td><%= aux.getRol()%></td>
                                        <td style="display: flex; width: 230px;">
                                            <form name="eliminar" action="SvEliminarUsuario" method="POST">
                                                <button type="submit" class="btn btn-outline-danger" style="margin-right: 5px;">
                                                    <i class="fas fa-trash-alt"></i> Eliminar
                                                </button>
                                                <input type="hidden" name="id_usu" value="<%= aux.getId_usuario()%>">
                                            </form>

                                            <form name="editar" action="SvEditarUsuario" method="GET">
                                                <button type="submit" class="btn btn-outline-light" style="background-color: blue; margin-right: 5px;">
                                                    <i class="fas fa-pencil-alt"></i> Editar
                                                </button>
                                                <input type="hidden" name="id_usu" value="<%= aux.getId_usuario()%>">
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