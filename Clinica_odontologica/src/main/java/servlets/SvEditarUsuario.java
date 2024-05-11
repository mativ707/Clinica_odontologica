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

@WebServlet(name = "SvEditarUsuario", urlPatterns = {"/SvEditarUsuario"})
public class SvEditarUsuario extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id_usu"));
        Usuario usuEditar = control.getUsuario(id);
        
        HttpSession mySession = request.getSession();
        mySession.setAttribute("usuEditar", usuEditar);
        
        response.sendRedirect("editarUsuario.jsp");
        
        System.out.println("El usuario a editar es: " + usuEditar.getNombre_usuario());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombreUsu = request.getParameter("nombre_usuario");
        String rol = request.getParameter("rol");
        String contrasenia = request.getParameter("contrasenia");
        
        Usuario usuEditar = (Usuario)request.getSession().getAttribute("usuEditar");
        usuEditar.setNombre_usuario(nombreUsu);
        usuEditar.setRol(rol);
        usuEditar.setContrasenia(contrasenia);
        
        control.editarUsuario(usuEditar);
        
        response.sendRedirect("SvUsuario");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
