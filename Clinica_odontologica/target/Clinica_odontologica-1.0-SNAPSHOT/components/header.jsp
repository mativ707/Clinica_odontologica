<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    HttpSession mySession = request.getSession();
    String usuario = (String) mySession.getAttribute("usuario");
    
    if (usuario == null) {
        response.sendRedirect("sinLogin.jsp");
    }
%>
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <div class="container-fluid"> <!-- Contenedor para ajustar el ancho del navbar -->
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle"><i class="fas fa-solid fa-tooth fa-2x"></i></button>
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3 order-2 order-lg-1" href="SvInicio">Consultorio Odontológico</a>
        <!-- Navbar-->
        <div class="navbar-nav ms-auto order-3 order-lg-2"> <!-- Utilizamos ms-auto para alinear a la derecha -->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> <%=request.getSession().getAttribute("usuario")%> <i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="SvLogout">Cerrar sesión</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>