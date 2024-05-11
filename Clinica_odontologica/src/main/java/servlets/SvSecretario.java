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
import logica.Secretario;
import logica.Usuario;

@WebServlet(name = "SvSecretario", urlPatterns = {"/SvSecretario"})
public class SvSecretario extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Secretario> listaSecretarios = control.getSecretarios();
        List<Usuario> listaUsuarios = control.getUsuarios();
        HttpSession mySession = request.getSession();
        mySession.setAttribute("listaSecretarios", listaSecretarios);
        mySession.setAttribute("listaUsuarios", listaUsuarios);
        response.sendRedirect("verSecretarios.jsp");
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
        String sector = request.getParameter("sector");
        String idUsuSecretario = request.getParameter("idUsuSecretario");
        
        control.crearSecretario(dni,nombre,apellido,telefono,direccion,fechaNacStr,sector,idUsuSecretario);
        response.sendRedirect("SvInicio");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
