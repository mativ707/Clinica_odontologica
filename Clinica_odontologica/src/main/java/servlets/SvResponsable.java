package servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Responsable;

@WebServlet(name = "SvResponsable", urlPatterns = {"/SvResponsable"})
public class SvResponsable extends HttpServlet {
    
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Responsable> listaResp = control.getResponsables();
        HttpSession mySession = request.getSession();
        mySession.setAttribute("listaResp", listaResp);
        response.sendRedirect("verResponsables.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String dni = request.getParameter("dni");
        String telefono = request.getParameter("tel");
        String direccion = request.getParameter("direccion");
        String fechaNacStr = request.getParameter("fechaNac");
        String tipoResp = request.getParameter("tipoResp");
        
        control.crearResponsable(dni, nombre, apellido, telefono, direccion, fechaNacStr, tipoResp);
        response.sendRedirect("SvInicio");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
