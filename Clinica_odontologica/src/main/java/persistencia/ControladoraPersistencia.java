package persistencia;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import logica.Horario;
import logica.Odontologo;
import logica.Paciente;
import logica.Responsable;
import logica.Secretario;
import logica.Turno;
import logica.Usuario;
import persistencia.exceptions.NonexistentEntityException;

public class ControladoraPersistencia {

    private final HorarioJpaController horaJPA = new HorarioJpaController();
    private final OdontologoJpaController odontoJPA = new OdontologoJpaController();
    private final PacienteJpaController pacJPA = new PacienteJpaController();
    private final SecretarioJpaController secretarioJPA = new SecretarioJpaController();
    private final TurnoJpaController turnoJPA = new TurnoJpaController();
    private final UsuarioJpaController usuJPA = new UsuarioJpaController();
    private final ResponsableJpaController respJPA = new ResponsableJpaController();

    //Usuarios
    public void crearUsuario(Usuario usu) {
        usuJPA.create(usu);
    }

    public List<Usuario> getUsuarios() {
        return usuJPA.findUsuarioEntities();
    }

    public void borrarUsuario(int id) {
        try {
            usuJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Usuario getUsuario(int id) {
        return usuJPA.findUsuario(id);
    }

    public Usuario getUsuarioByUsername(String nombreUsuario) {
        return usuJPA.obtenerUsuarioPorNombre(nombreUsuario);
    }

    public void editarUsuario(Usuario usuEditar) {
        try {
            usuJPA.edit(usuEditar);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //Responsables
    public void crearResponsable(Responsable resp) {
        respJPA.create(resp);
    }

    public Responsable getResponsable(int idRespPaciente) {
        return respJPA.findResponsable(idRespPaciente);
    }
    
    public List<Responsable> getResponsables() {
        return respJPA.findResponsableEntities();
    }

    public void borrarResponsable(int id) {
        try {
            respJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //Pacientes
    public void crearPaciente(Paciente pac) {
        pacJPA.create(pac);
    }

    public List<Paciente> getPacientes() {
        return pacJPA.findPacienteEntities();
    }

    public int getCountPacientesConOS() {
        return pacJPA.getCountPacientesConObraSocial();
    }

    public int getCountPacientesSinOS() {
        return pacJPA.getCountPacientesSinObraSocial();
    }

    public Paciente getPaciente(int idPaciente) {
        return pacJPA.findPaciente(idPaciente);
    }
    
    public void editarPaciente(Paciente pacienteEdit) {
        try {
            pacJPA.edit(pacienteEdit);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //Odontologos
    public List<Odontologo> getOdontologos() {
        return odontoJPA.findOdontologoEntities();
    }

    public Odontologo getOdontologoByUsername(String nombreUsuario) {
        return odontoJPA.obtenerOdontólogoPorUsuario(nombreUsuario);
    }

    public void crearOdontologo(Odontologo odonto) {
        odontoJPA.create(odonto);
    }
    
     public void editarOdontologo(Odontologo odontoEdit) {
        try {
            odontoJPA.edit(odontoEdit);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Odontologo getOdontologo(int idOdonto) {
        return odontoJPA.findOdontologo(idOdonto);
    }
    
    public void borrarOdontologo(int id) {
        try {
            odontoJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //Secretarios
    public List<Secretario> getSecretarios() {
        return secretarioJPA.findSecretarioEntities();
    }

    public void crearSecretario(Secretario secretario) {
        secretarioJPA.create(secretario);
    }

    public void borrarSecretario(int id) {
        try {
            secretarioJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //Horarios
    public List<Horario> getHorarios() {
        return horaJPA.findHorarioEntities();
    }

    public void crearHorario(Horario hor) {
        try {
            horaJPA.create(hor);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editarHorario(Horario hor) {
        try {
            horaJPA.edit(hor);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Horario getHorario(int id_horario) {
        return horaJPA.findHorario(id_horario);
    }

    //Turnos
    public List<Turno> getTurnos() {
        return turnoJPA.findTurnoEntities();
    }

    public List<Turno> getTurnosHoy() {
        return turnoJPA.getTurnosHoy();
    }

    public void crearTurno(Turno turno) {
        turnoJPA.create(turno);
    }
    
    public void cambiarEstadoTurno(Turno turnoEditar){
        try {
            turnoJPA.edit(turnoEditar);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Turno getTurno(int idTurno) {
        return turnoJPA.findTurno(idTurno);
    }

    public void borrarPaciente(int id) {
        try {
            pacJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
