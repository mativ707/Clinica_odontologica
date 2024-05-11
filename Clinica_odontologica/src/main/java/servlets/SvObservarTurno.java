package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;

@WebServlet(name = "SvObservarTurno", urlPatterns = {"/SvObservarTurno"})
public class SvObservarTurno extends HttpServlet {
    
    private final Controladora control = new Controladora();

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
        
        int idTurno = Integer.parseInt(request.getParameter("idTurnoObservar"));
        String estadoTurno = request.getParameter("estadoTurnoNuevo");
        String observacion = request.getParameter("observacion");
        
        control.observarTurno(idTurno, estadoTurno,observacion);
        response.sendRedirect("SvGetTurnos");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
