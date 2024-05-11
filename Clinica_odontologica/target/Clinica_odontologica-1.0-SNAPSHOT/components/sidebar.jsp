<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="layoutSidenav">
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <div class="sb-sidenav-menu">
                <div class="nav">

                    <!-- Header nav -->
                    <div class="sb-sidenav-menu-heading">Menú</div>
                    <%
                        String rol = (String) request.getSession().getAttribute("rolUsu");
                        if (rol.equalsIgnoreCase("Secretario")) {
                    %>
                    <!-- Item odontólogos -->
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseOdontologos" aria-expanded="false" aria-controls="collapseLayouts">
                        <div class="sb-nav-link-icon"><i class="fas fa-solid fa-user-doctor"></i></div>
                        Odontólogos
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapseOdontologos" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="SvOdontologo">Ver odontólogos</a>
                            <a class="nav-link" href="altaOdontologo.jsp">Alta odontólogos</a>
                        </nav>
                    </div>

                    <!-- Item Secretarios -->
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseSecretarios" aria-expanded="false" aria-controls="collapseLayouts">
                        <div class="sb-nav-link-icon"><i class="fas fa-solid fa-user-tie"></i></div>
                        Secretarios
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapseSecretarios" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="SvSecretario">Ver Secretarios</a>
                            <a class="nav-link" href="altaSecretario.jsp">Alta Secretarios</a>
                        </nav>
                    </div>

                    <!-- Item Responsables -->
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseResponsables" aria-expanded="false" aria-controls="collapseLayouts">
                        <div class="sb-nav-link-icon"><i class="fas fa-solid fa-hands-holding-child"></i></div>
                        Responsables
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapseResponsables" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="SvResponsable">Ver Responsables</a>
                            <a class="nav-link" href="altaResponsable.jsp">Alta Responsables</a>
                        </nav>
                    </div>

                    <!-- Item Usuarios -->
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseUsuarios" aria-expanded="false" aria-controls="collapseLayouts">
                        <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                        Usuarios
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapseUsuarios" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="SvUsuario">Ver Usuarios</a>
                            <a class="nav-link" href="altaUsuario.jsp">Alta Usuarios</a>
                        </nav>
                    </div>

                    <% } %>

                    <!-- Item pacientes -->
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePacientes" aria-expanded="false" aria-controls="collapseLayouts">
                        <div class="sb-nav-link-icon"><i class="fas fa-hospital-user"></i></div>
                        Pacientes
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapsePacientes" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="SvPaciente">Ver pacientes</a>
                            <a class="nav-link" href="altaPaciente.jsp">Alta pacientes</a>
                        </nav>
                    </div>

                    <!-- Item turnos -->
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseTurnos" aria-expanded="false" aria-controls="collapseLayouts">
                        <div class="sb-nav-link-icon"><i class="fas fa-calendar-days"></i></div>
                        Turnos
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapseTurnos" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="SvGetTurnos">Ver turnos</a>
                            <a class="nav-link" href="SvTurno">Alta de un turno</a>
                        </nav>
                    </div>

                    <!-- Item Horarios -->
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseHorarios" aria-expanded="false" aria-controls="collapseLayouts">
                        <div class="sb-nav-link-icon"><i class="fas fa-calendar-days"></i></div>
                        Horarios
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapseHorarios" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="SvHorario">Ver Horarios registrados</a>
                        </nav>
                    </div>

                    <!-- Fin de Items SideNavBar -->
                    <div class="sb-sidenav-footer">
                        <div class="small">Usuario en sesión: </div>
                        <%= request.getSession().getAttribute("usuario")%>
                    </div>

                    </nav>
                </div>