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
import logica.Usuario;

@WebServlet(name = "SvUsuario", urlPatterns = {"/SvUsuario"})
public class SvUsuario extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Usuario> listaUsuarios = control.getUsuarios();
        
        HttpSession mySession = request.getSession();
        mySession.setAttribute("listaUsuarios", listaUsuarios);
        
        response.sendRedirect("verUsuarios.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombreUsuario = request.getParameter("nombre_usuario");
        String contra = request.getParameter("contrasenia");
        String rol = request.getParameter("rol");
        
        control.crearUsuario(nombreUsuario, contra, rol);
        
        System.out.println("Nombre: " + nombreUsuario);
        System.out.println("Contrasenia: " + contra);
        System.out.println("Rol: " + rol);
        
        response.sendRedirect("SvInicio");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
