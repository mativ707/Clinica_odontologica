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
import logica.Paciente;
import logica.Responsable;

@WebServlet(name = "SvPaciente", urlPatterns = {"/SvPaciente"})
public class SvPaciente extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Paciente>listaPacientes = control.getPacientes();
        List<Responsable> listaResp = control.getResponsables();
        
        HttpSession mySession = request.getSession();
        mySession.setAttribute("listaPacientes", listaPacientes);
        mySession.setAttribute("listaResp", listaResp);
        
        response.sendRedirect("verPacientes.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        String dni = request.getParameter("dniPac");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String telefono = request.getParameter("tel");
        String direccion = request.getParameter("direccion");
        String fechaNacStr = request.getParameter("fechaPac");
        String poseeObraSoc = request.getParameter("poseeObraSoc");
        String tipoSangre = request.getParameter("tipoSangre");
        String idRespPaciente = request.getParameter("idRespPaciente");
        
        control.crearPaciente(dni, nombre, apellido, telefono, direccion, fechaNacStr, poseeObraSoc, tipoSangre, idRespPaciente);
        
        response.sendRedirect("SvPaciente");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
