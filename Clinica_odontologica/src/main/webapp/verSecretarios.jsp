<%@page import="util.DateUtils"%>
<%@page import="logica.Secretario"%>
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
                    <h1 class="mt-4">Secretarios</h1>
                    <div class="mt-4">
                        <div class="card-body">
                            <h3 class="h3 mb-2 text-gray-800">
                                Esta es la página para administrar la tabla de los Odontológos registrados
                            </h3>
                        </div>
                    </div>
                    <div class="card mb-2 mt-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            Tabla de Secretarios registrados
                        </div>
                        <div class="card-body">
                            <table id="datatablesSimple">
                                <thead>
                                    <tr>
                                        <th>DNI</th>
                                        <th>Nombre Secretario</th>
                                        <th>Apellido</th>
                                        <th>Teléfono</th>
                                        <th>Dirección</th>
                                        <th>Fecha de nacimiento</th>
                                        <th>Sector</th>
                                        <th>Usuario</th>
                                        <th>Editar</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>DNI</th>
                                        <th>Nombre Odontológo</th>
                                        <th>Apellido</th>
                                        <th>Teléfono</th>
                                        <th>Dirección</th>
                                        <th>Fecha de nacimiento</th>
                                        <th>Sector</th>
                                        <th>Usuario</th>
                                        <th>Editar</th>
                                    </tr>
                                </tfoot>

                                <%
                                    List<Secretario> listaSecretarios = (List) request.getSession().getAttribute("listaSecretarios");
                                    DateUtils dtu = new DateUtils();
                                %>
                                <tbody>
                                    <% for (Secretario aux : listaSecretarios) {%>
                                    <tr>
                                        <td><%= aux.getDni() != null ? aux.getDni() : ""%></td>
                                        <td><%= aux.getNombre() != null ? aux.getNombre() : ""%></td>
                                        <td><%= aux.getApellido() != null ? aux.getApellido() : ""%></td>
                                        <td><%= aux.getTelefono() != null ? aux.getTelefono() : ""%></td>
                                        <td><%= aux.getDireccion() != null ? aux.getDireccion() : ""%></td>
                                        <td><%= aux.getFechaNac() != null ? dtu.formatoYearMonthDay(aux.getFechaNac()) : ""%></td>
                                        <td><%= aux.getSector() != null ? aux.getSector() : ""%></td>
                                        <td><%= aux.getUnUsuario().getNombre_usuario() != null ? aux.getUnUsuario().getNombre_usuario() : "Usuario no asignado!S"%></td>
                                        <td style="display: flex; width: 230px;">
                                            <form name="eliminar" action="SvEliminarSecretario" method="POST">
                                                <button type="submit" class="btn btn-outline-danger" style="margin-right: 5px;">
                                                    <i class="fas fa-trash-alt"></i> Eliminar
                                                </button>
                                                <input type="hidden" name="id_secretario" value="<%= aux.getId()%>">
                                            </form>

                                            <form name="editar" action="SvEditarSecretario" method="GET">
                                                <button type="submit" class="btn btn-outline-primary" style="margin-right: 5px;">
                                                    <i class="fas fa-pencil-alt"></i> Editar
                                                </button>
                                                <input type="hidden" name="id_secretario" value="<%= aux.getId()%>">
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