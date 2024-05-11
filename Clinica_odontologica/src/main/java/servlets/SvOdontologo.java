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
import logica.Odontologo;
import logica.Usuario;

@WebServlet(name = "SvOdontologo", urlPatterns = {"/SvOdontologo"})
public class SvOdontologo extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Odontologo> listaOdontos = control.getOdontologos();
        List<Usuario> listaUsuarios = control.getUsuarios();

        HttpSession mySession = request.getSession();
        mySession.setAttribute("listaOdontos", listaOdontos);
        mySession.setAttribute("listaUsuarios", listaUsuarios);

        response.sendRedirect("verOdontologos.jsp");
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
                
        control.crearOdontologo(dni, nombre, apellido, telefono, direccion, fechaNacStr, 
                                especialidad, idUsuOdonto,diasLaborales, horario_inicio, horario_fin);
        
        response.sendRedirect("SvInicio");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
