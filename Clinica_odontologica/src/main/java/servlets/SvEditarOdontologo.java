package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Odontologo;

@WebServlet(name = "SvEditarOdontologo", urlPatterns = {"/SvEditarOdontologo"})
public class SvEditarOdontologo extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int idOdonto = Integer.parseInt(request.getParameter("idOdonto"));
        Odontologo odontoEdit = control.getOdontologo(idOdonto);
        
        HttpSession mySession = request.getSession();
        mySession.setAttribute("odontoEdit", odontoEdit);
        
        response.sendRedirect("editarOdontologo.jsp");
        
        System.out.println("El odontologo a editar es: " + odontoEdit.getNombre());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String telefono = request.getParameter("tel");
        String direccion = request.getParameter("direccion");
        String fechaNacStr = request.getParameter("fechaNac");
        String especialidad = request.getParameter("especialidad");
        String idUsuOdonto = request.getParameter("idUsuOdonto");
        String[] diasLaborales = request.getParameterValues("diasLaborales");
        String horario_inicio = request.getParameter("horario_inicio");
        String horario_fin = request.getParameter("horario_fin");
        
        Odontologo odontoEdit = (Odontologo)request.getSession().getAttribute("odontoEdit");
        
        control.editarOdontologo(odontoEdit, dni, nombre, apellido, telefono, direccion, fechaNacStr, 
                                 especialidad, idUsuOdonto, diasLaborales, horario_inicio,horario_fin);
        
        response.sendRedirect("SvOdontologo");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
