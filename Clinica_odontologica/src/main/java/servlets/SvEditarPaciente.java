package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Paciente;

@WebServlet(name = "SvEditarPaciente", urlPatterns = {"/SvEditarPaciente"})
public class SvEditarPaciente extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int idPaciente = Integer.parseInt(request.getParameter("idPaciente"));
        Paciente pacienteEdit = control.getPaciente(idPaciente);
        
        HttpSession mySession = request.getSession();
        mySession.setAttribute("pacienteEdit", pacienteEdit);
        
        response.sendRedirect("editarPaciente.jsp");
        
        System.out.println("El odontologo a editar es: " + pacienteEdit.getNombre());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String dni = request.getParameter("dniPac");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String telefono = request.getParameter("tel");
        String direccion = request.getParameter("direccion");
        String fechaNacStr = request.getParameter("fechaPac");
        String poseeObraSoc = request.getParameter("poseeObraSoc");
        String tipoSangre = request.getParameter("tipoSangre");
        String idRespPaciente = request.getParameter("idRespPaciente");
        
        Paciente pacienteEdit = (Paciente) request.getSession().getAttribute("pacienteEdit");
        
        control.ediarPaciente(pacienteEdit, dni, nombre, apellido, telefono, direccion, 
                              fechaNacStr, poseeObraSoc, tipoSangre, idRespPaciente);
        
        response.sendRedirect("SvPaciente");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
