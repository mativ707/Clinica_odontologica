package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;

@WebServlet(name = "SvEliminarResponsable", urlPatterns = {"/SvEliminarResponsable"})
public class SvEliminarResponsable extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id_resp"));
        control.borrarResponsable(id);
        
        response.sendRedirect("SvUsuario");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
