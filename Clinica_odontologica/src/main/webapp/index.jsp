<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="es">
    <%@include file="components/head.jsp" %>
    <body class="sb-nav-fixed">
        <%@include file="components/header.jsp" %>
        <%@include file="components/sidebar.jsp" %>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <%@include file="components/contenido.jsp" %>
                </div>
            </main>
        </div>

        <%@include file="components/scripts.jsp" %>
    </body>
</html>
