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
import logica.Turno;

@WebServlet(name = "SvGetTurnos", urlPatterns = {"/SvGetTurnos"})
public class SvGetTurnos extends HttpServlet {

    Controladora control = new Controladora();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Turno> listaTurnos = control.getTurnos();
        HttpSession mySession = request.getSession();
        mySession.setAttribute("listaTurnos", listaTurnos);
        
        response.sendRedirect("verTurnos.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int idTurno = Integer.parseInt(request.getParameter("turnoId"));
        String estadoTurno = request.getParameter("estadoTurno");
        HttpSession mySession = request.getSession();
        
        switch(estadoTurno){
            case "PENDIENTE":
                control.observarTurno(idTurno, estadoTurno, "-");
                response.sendRedirect("SvGetTurnos");
                break;
            default:
                Turno turnoObservar = control.getTurno(idTurno);
                mySession.setAttribute("turnoObservar", turnoObservar);
                mySession.setAttribute("estadoTurnoNuevo", estadoTurno);
                
                response.sendRedirect("observacionTurno.jsp");
                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
