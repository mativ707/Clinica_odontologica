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

@WebServlet(name = "SvTurno", urlPatterns = {"/SvTurno"})
public class SvTurno extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Paciente> listaPacientes = control.getPacientes();
        List<Odontologo> listaOdontos = control.getOdontologos();

        HttpSession mySession = request.getSession();
        mySession.setAttribute("listaPacientes", listaPacientes);
        mySession.setAttribute("listaOdontos", listaOdontos);

        response.sendRedirect("altaTurno.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fechaTurnoStr = request.getParameter("fechaTurno");
        String horaTurno = request.getParameter("horaTurno");
        String afeccion = request.getParameter("afeccion");
        String idOdonto = request.getParameter("idOdonto");
        String idPaciente = request.getParameter("idPaciente");

        if (control.validarDiaTurno(fechaTurnoStr, idOdonto, horaTurno)) {
            control.crearTurno(fechaTurnoStr, horaTurno, afeccion, idOdonto, idPaciente);
            response.sendRedirect("SvInicio");
        } else {
            response.sendRedirect("fechaInvalida.jsp");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
