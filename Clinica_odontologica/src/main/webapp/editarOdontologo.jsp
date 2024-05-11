<%@page import="java.util.List"%>
<%@page import="logica.Odontologo"%>
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
                    <div class="register-container">
                        <div class="register-container">
                            <div class="row justify-content-center">
                                <div class="card shadow-lg border-0 mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light">Editar Odontológo</h3></div>
                                    <div class="card-body">
                                        <form action="SvEditarOdontologo" method="POST">
                                            
                                            <%Odontologo odontoEdit = (Odontologo) request.getSession().getAttribute("odontoEdit");%>
                                            
                                            <div class="row mb-3">
                                                <div class="col-md-12 mb-3">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="inputDNI" name="dni" value="<%= odontoEdit.getDni() %>" type="text" placeholder="Ingrese DNI del Odontólogo" />
                                                        <label for="inputDNI">DNI</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="inputFirstName" name="nombre" value="<%= odontoEdit.getNombre() %>" type="text" placeholder="Ingrese nombre del Odontólogo" />
                                                        <label for="inputFirstName">Nombre</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="inputLastName" name="apellido" value="<%= odontoEdit.getApellido() %>" type="text" placeholder="Ingrese apellido del Odontólogo" />
                                                        <label for="inputLastName">Apellido</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 mt-3">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="inputTel" name="tel" value="<%= odontoEdit.getTelefono() %>" type="text" placeholder="Ingrese teléfono del Odontólogo" />
                                                        <label for="inputTel">Teléfono</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 mt-3">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="inputDir" name="direccion" value="<%= odontoEdit.getDireccion() %>" type="text" placeholder="Ingrese dirección del Odontólogo" />
                                                        <label for="inputDir">Dirección</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 mt-3">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="inputFecha" name="fechaNac" value="<%= odontoEdit.getFechaNac() %>" type="date" placeholder="Ingrese fecha de nacimiento del Odontólogo" />
                                                        <label for="inputFecha">Fecha de Nacimiento</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 mt-3">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="inputEspec" name="especialidad" value="<%= odontoEdit.getEspecialidad() %>" type="text" placeholder="Ingrese especialidad del odontólogo" />
                                                        <label for="inputEspec">Especialidad</label>
                                                    </div>
                                                </div>

                                                <!-- Aqui va lo del usuario y el horario -->

                                                <% List<Usuario> listaUsuarios = (List) request.getSession().getAttribute("listaUsuarios");
                                                    System.out.println("Longitud de la lista de usuarios: " + listaUsuarios.size());%>

                                                <div class="col-md-12 mt-3">
                                                    <div class="form-floating">
                                                        <select class="form-select" id="usuarios" name="idUsuOdonto">
                                                            <% if (listaUsuarios != null) {
                                                                    for (Usuario aux : listaUsuarios) {%>
                                                            <option value="<%= aux.getId_usuario()%>"><%= aux.getNombre_usuario()%></option>
                                                            <% }
                                                                }%>
                                                        </select>
                                                        <label for="usuarios">Lista de usuarios disponibles</label>
                                                    </div>
                                                </div>

                                                <h1 class="h4 mt-4 mb-1">Horario</h1>

                                                <div class="col-md-12 mt-3">
                                                    <div class="form-check">
                                                        <label class="form-check-label" for="dias">Días laborales</label><br>
                                                        <input class="form-check-input" type="checkbox" id="lunes" name="diasLaborales" value="Lunes">
                                                        <label class="form-check-label" for="lunes">Lunes</label><br>
                                                        <input class="form-check-input" type="checkbox" id="martes" name="diasLaborales" value="Martes">
                                                        <label class="form-check-label" for="martes">Martes</label><br>
                                                        <input class="form-check-input" type="checkbox" id="miercoles" name="diasLaborales" value="Miercoles">
                                                        <label class="form-check-label" for="miercoles">Miércoles</label><br>
                                                        <input class="form-check-input" type="checkbox" id="jueves" name="diasLaborales" value="Jueves">
                                                        <label class="form-check-label" for="jueves">Jueves</label><br>
                                                        <input class="form-check-input" type="checkbox" id="viernes" name="diasLaborales" value="Viernes">
                                                        <label class="form-check-label" for="viernes">Viernes</label><br>
                                                        <input class="form-check-input" type="checkbox" id="sabado" name="diasLaborales" value="Sabado">
                                                        <label class="form-check-label" for="sabado">Sábado</label><br>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mt-3">
                                                    <div class="form-floating">
                                                        <select class="form-select" id="horasI" name="horario_inicio">
                                                            <option value=8>8</option>
                                                            <option value=9>9</option>
                                                            <option value=10>10</option>
                                                            <option value=11>11</option>
                                                            <option value=12>12</option>
                                                            <option value=13>13</option>
                                                            <option value=14>14</option>
                                                            <option value=15>15</option>
                                                            <option value=16>16</option>
                                                            <option value=17>17</option>
                                                            <option value=18>18</option>
                                                            <option value=19>19</option>
                                                        </select>
                                                        <label for="horasI">Hora inicio</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mt-3">
                                                    <div class="form-floating">
                                                        <select class="form-select" id="horasF" name="horario_fin">
                                                            <option value=9>9</option>
                                                            <option value=10>10</option>
                                                            <option value=11>11</option>
                                                            <option value=12>12</option>
                                                            <option value=13>13</option>
                                                            <option value=14>14</option>
                                                            <option value=15>15</option>
                                                            <option value=16>16</option>
                                                            <option value=17>17</option>
                                                            <option value=18>18</option>
                                                            <option value=19>19</option>
                                                            <option value=20>20</option>
                                                        </select>
                                                        <label for="horasF">Hora fin</label>
                                                    </div>
                                                </div>
                                            </div>
                                    </div>
                                    <div class="mt-4 mb-3">
                                        <div class="d-grid"><button class="btn btn-primary btn-block" type="submit">Modificar Odontólogo</button></div>
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