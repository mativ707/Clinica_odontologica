package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.Usuario;

@WebServlet(name = "SvLogin", urlPatterns = {"/SvLogin"})
public class SvLogin extends HttpServlet {

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

        String usuario = request.getParameter("usuario");
        String contrasenia = request.getParameter("contrasenia");

        boolean validacion = validacion = control.comprobarIngreso(usuario, contrasenia);

        if (validacion) {
            HttpSession mySession = request.getSession(true);
            Usuario usu = control.getUsuarioByUsername(usuario);
            mySession.setAttribute("rolUsu", usu.getRol());
            mySession.setAttribute("usuario", usuario);
            
            response.sendRedirect("SvInicio");
        } else {
            System.out.println("Error en el login");
            response.sendRedirect("loginError.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
