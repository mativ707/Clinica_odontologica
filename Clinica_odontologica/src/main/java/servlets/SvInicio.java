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
import logica.Paciente;
import logica.Responsable;
import logica.Turno;
import logica.Usuario;

@WebServlet(name = "SvInicio", urlPatterns = {"/SvInicio"})
public class SvInicio extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession mySession = request.getSession();
        String nombreUsuario = (String) mySession.getAttribute("usuario");

        try {
            //Usuario usu = control.getUsuarioByUsername(nombreUsuario);
            String rol = (String) mySession.getAttribute("rolUsu");
            if (rol.equalsIgnoreCase("Odontologo")) {
                List<Turno> listaTurnosHoy = control.getTurnosHoy(nombreUsuario);
                mySession.setAttribute("listaTurnosHoy", listaTurnosHoy);
                System.out.println("Lista obtenida nuevamente para el usuario: " + nombreUsuario);
            }

            List<Odontologo> listaOdontos = control.getOdontologos();
            List<Usuario> listaUsuarios = control.getUsuarios();
            List<Paciente> listaPacientes = control.getPacientes();
            List<Responsable> listaResp = control.getResponsables();
            List<Turno> turnosAtendidosHoy = control.getTurnosAtendidosHoy();
            int countPacSinOS = control.getCountPacientesSinOS();
            int countPacConOS = control.getCountPacientesConOS();
            
            mySession.setAttribute("listaPacientes", listaPacientes);
            mySession.setAttribute("listaResp", listaResp);
            mySession.setAttribute("listaOdontos", listaOdontos);
            mySession.setAttribute("listaUsuarios", listaUsuarios);
            mySession.setAttribute("turnosAtendidosHoy", turnosAtendidosHoy);
            mySession.setAttribute("countPacSinOS", countPacSinOS);
            mySession.setAttribute("countPacConOS", countPacConOS);
            
            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            System.out.println("Error en el inicio: " + e.getMessage());
            response.sendRedirect("sinLogin.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
