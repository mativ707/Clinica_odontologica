package logica;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import logica.enums.EstadoTurno;
import persistencia.ControladoraPersistencia;
import util.DateUtils;

public class Controladora {

    private final ControladoraPersistencia controlPersis = new ControladoraPersistencia();
    private final DateUtils dtu = new DateUtils();

    //Usuarios
    public void crearUsuario(String nombreUsuario, String contrasenia, String rol) {
        Usuario usu = new Usuario();
        usu.setNombre_usuario(nombreUsuario);
        usu.setContrasenia(contrasenia);
        usu.setRol(rol);

        controlPersis.crearUsuario(usu);
    }

    public List<Usuario> getUsuarios() {
        return controlPersis.getUsuarios();
    }

    public void borrarUsuario(int id) {
        controlPersis.borrarUsuario(id);
    }

    public Usuario getUsuario(int id) {
        return controlPersis.getUsuario(id);
    }

    public void editarUsuario(Usuario usuEditar) {
        controlPersis.editarUsuario(usuEditar);
    }

    public Usuario getUsuarioByUsername(String usuario) {
        return controlPersis.getUsuarioByUsername(usuario);
    }

    //Responsables
    public void crearResponsable(String dni, String nombre, String apellido, String telefono,
            String direccion, String fechaNacStr, String tipoResp) {

        Responsable resp = new Responsable();
        resp.setDni(dni);
        resp.setNombre(nombre);
        resp.setApellido(apellido);
        resp.setTelefono(telefono);
        resp.setDireccion(direccion);
        resp.setTipo_respons(tipoResp);
        Date fecha = dtu.convertirStringADate(fechaNacStr);
        resp.setFechaNac(fecha);

        controlPersis.crearResponsable(resp);
    }

    public List<Responsable> getResponsables() {
        return controlPersis.getResponsables();
    }

    public void borrarResponsable(int id) {
        controlPersis.borrarResponsable(id);
    }

    //Pacientes
    public void crearPaciente(String dni, String nombre, String apellido, String telefono, String direccion, String fechaNacStr, String poseeObraSoc, String tipoSangre, String idRespPaciente) {

        Paciente pac = new Paciente();
        pac.setDni(dni);
        pac.setNombre(nombre);
        pac.setApellido(apellido);
        pac.setTelefono(telefono);
        pac.setDireccion(direccion);
        Date fecha = dtu.convertirStringADate(fechaNacStr);
        System.out.println("fecha convertida: " + fecha);
        pac.setFechaNac(fecha);
        pac.setTiene_OS(Boolean.parseBoolean(poseeObraSoc));
        pac.setTipoSangre(tipoSangre);
        if (idRespPaciente != null) {
            pac.setUnResponsable(controlPersis.getResponsable(Integer.parseInt(idRespPaciente)));
        }

        controlPersis.crearPaciente(pac);
    }

    public List<Paciente> getPacientes() {
        return controlPersis.getPacientes();
    }

    public void borrarPaciente(int id) {
        controlPersis.borrarPaciente(id);
    }

    public void ediarPaciente(Paciente pacienteEdit, String dni, String nombre,
            String apellido, String telefono, String direccion,
            String fechaNacStr, String poseeObraSoc,
            String tipoSangre, String idRespPaciente) {

        pacienteEdit.setDni(dni);
        pacienteEdit.setNombre(nombre);
        pacienteEdit.setApellido(apellido);
        pacienteEdit.setDireccion(direccion);
        pacienteEdit.setTelefono(telefono);
        pacienteEdit.setFechaNac(dtu.convertirStringADate(fechaNacStr));
        pacienteEdit.setTiene_OS(Boolean.parseBoolean(poseeObraSoc));
        pacienteEdit.setTipoSangre(tipoSangre);

        if (idRespPaciente != null) {
            pacienteEdit.setUnResponsable(controlPersis.getResponsable(Integer.parseInt(idRespPaciente)));
        } else {
            pacienteEdit.setUnResponsable(pacienteEdit.getUnResponsable());
        }

        controlPersis.editarPaciente(pacienteEdit);
    }

    public Paciente getPaciente(int idPaciente) {
        return controlPersis.getPaciente(idPaciente);
    }

    public int getCountPacientesConOS() {
        return controlPersis.getCountPacientesConOS();
    }

    public int getCountPacientesSinOS() {
        return controlPersis.getCountPacientesSinOS();
    }

    //Odontologos
    public List<Odontologo> getOdontologos() {
        return controlPersis.getOdontologos();
    }

    public void crearOdontologo(String dni, String nombre, String apellido, String telefono,
            String direccion, String fechaNacStr, String especialidad,
            String idUsuOdonto, String[] diasLaborales,
            String horario_inicio, String horario_fin) {

        Odontologo odonto = new Odontologo();

        Usuario usuOdonto = controlPersis.getUsuario(Integer.parseInt(idUsuOdonto));
        System.out.println("Nombre usuario seleccionado: " + usuOdonto.getNombre_usuario());

        //Seteamos atributos al nuevo odontólogo
        odonto.setDni(dni);
        odonto.setNombre(nombre);
        odonto.setApellido(apellido);
        odonto.setTelefono(telefono);
        odonto.setDireccion(direccion);
        odonto.setFechaNac(dtu.convertirStringADate(fechaNacStr));
        odonto.setEspecialidad(especialidad);
        odonto.setUnUsuario(usuOdonto);

        //HORARIO
        Horario hor = new Horario();

        //Creamos el horario
        System.out.println("Horario inicio seleccionado: " + horario_inicio);
        System.out.println("Horario fin seleccionado: " + horario_fin);
        hor.setHorario_inicio(horario_inicio);
        hor.setHorario_fin(horario_fin);

        List<String> listaDiasLaborales = new ArrayList<>();

        if (diasLaborales != null) {
            for (String dia : diasLaborales) {
                listaDiasLaborales.add(dia);
                System.out.println(dia);
            }
        }
        hor.setDiasLaborales(listaDiasLaborales);
        controlPersis.crearHorario(hor);

        odonto.setUnHorario(hor);

        controlPersis.crearOdontologo(odonto);
    }

    public void borrarOdontologo(int id) {
        controlPersis.borrarOdontologo(id);
    }

    public Odontologo getOdontologo(int idOdonto) {
        return controlPersis.getOdontologo(idOdonto);
    }

    public void editarOdontologo(Odontologo odontoEdit, String dni, String nombre,
            String apellido, String telefono, String direccion,
            String fechaNacStr, String especialidad,
            String idUsuOdonto, String[] diasLaborales,
            String horario_inicio, String horario_fin) {

        odontoEdit.setDni(dni);
        odontoEdit.setNombre(nombre);
        odontoEdit.setApellido(apellido);
        odontoEdit.setTelefono(telefono);
        odontoEdit.setDireccion(direccion);
        odontoEdit.setFechaNac(dtu.convertirStringADate(fechaNacStr));
        odontoEdit.setEspecialidad(especialidad);
        odontoEdit.setUnUsuario(controlPersis.getUsuario(Integer.parseInt(idUsuOdonto)));

        //Editamos el horario
        Horario horarioEdit = controlPersis.getHorario(odontoEdit.getUnHorario().getId_horario());
        horarioEdit.setHorario_inicio(horario_inicio);
        horarioEdit.setHorario_fin(horario_fin);

        List<String> listaDiasLaborales = new ArrayList<>();

        if (diasLaborales != null) {
            for (String dia : diasLaborales) {
                listaDiasLaborales.add(dia);
                System.out.println(dia);
            }
        }
        horarioEdit.setDiasLaborales(listaDiasLaborales);

        odontoEdit.setUnHorario(horarioEdit);

        controlPersis.editarHorario(horarioEdit);

        controlPersis.editarOdontologo(odontoEdit);
    }

    //Secretarios
    public List<Secretario> getSecretarios() {
        return controlPersis.getSecretarios();
    }

    public void crearSecretario(String dni, String nombre, String apellido, String telefono, String direccion, String fechaNacStr, String sector, String idUsuSecretario) {
        Secretario secretario = new Secretario();
        Usuario usuSecretario = controlPersis.getUsuario(Integer.parseInt(idUsuSecretario));
        System.out.println("Nombre usuario seleccionado: " + usuSecretario.getNombre_usuario());

        secretario.setDni(dni);
        secretario.setNombre(nombre);
        secretario.setApellido(apellido);
        secretario.setTelefono(telefono);
        secretario.setDireccion(direccion);
        secretario.setFechaNac(dtu.convertirStringADate(fechaNacStr));
        secretario.setSector(sector);
        secretario.setUnUsuario(usuSecretario);

        controlPersis.crearSecretario(secretario);
    }

    public void borrarSecretario(int id) {
        controlPersis.borrarSecretario(id);
    }

    //Horarios
    public List<Horario> getHorarios() {
        return controlPersis.getHorarios();
    }

    public Horario crearHorario(String[] diasLaborales, String horario_inicio, String horario_fin) {

        Horario hor = new Horario();

        //Creamos el horario
        System.out.println("Horario inicio seleccionado: " + horario_inicio);
        System.out.println("Horario fin seleccionado: " + horario_fin);
        hor.setHorario_inicio(horario_inicio);
        hor.setHorario_fin(horario_fin);

        List<String> listaDiasLaborales = new ArrayList<>();

        if (diasLaborales != null) {
            for (String dia : diasLaborales) {
                listaDiasLaborales.add(dia);
                System.out.println(dia);
            }
        }
        hor.setDiasLaborales(listaDiasLaborales);

        controlPersis.crearHorario(hor);

        return hor;
    }

    public void editarHorario(Horario hor) {
        controlPersis.editarHorario(hor);
    }

    public void asignarDiasLaborarlesAHorario(Horario hor, String[] diasLaborales) {

        List<String> listaDiasLaborales = new ArrayList<>();

        if (diasLaborales != null) {
            for (String dia : diasLaborales) {
                listaDiasLaborales.add(dia);
                System.out.println(dia);
            }
        }
        hor.setDiasLaborales(listaDiasLaborales);

        controlPersis.editarHorario(hor);
    }

    //Turnos
    public void crearTurno(String fechaTurnoStr, String horaTurno, String afeccion, String idOdonto, String idPaciente) {

        Turno turno = new Turno();
        Paciente pac = controlPersis.getPaciente(Integer.parseInt(idPaciente));
        Date fechaTurno = dtu.convertirStringADate(fechaTurnoStr);

        //turno.setFechaTurno();
        turno.setHora_turno(horaTurno);
        turno.setAfeccion(afeccion);
        Odontologo odonto = controlPersis.getOdontologo(Integer.parseInt(idOdonto));
        turno.setOdonto(odonto);
        turno.setPacien(pac);
        turno.setFechaTurno(fechaTurno);
        turno.setEstado(EstadoTurno.PENDIENTE);

        controlPersis.crearTurno(turno);
    }

    public List<Turno> getTurnos() {
        return controlPersis.getTurnos();
    }

    public List<Turno> getTurnosHoy(String usuario) {

        Odontologo odonto = controlPersis.getOdontologoByUsername(usuario);
        List<Turno> listaTurnos = odonto.getListaTurnos();
        LocalDate hoy = LocalDate.now();
        List<Turno> turnosHoy = new ArrayList<Turno>();

        // Filtrar los turnos para obtener solo los del día de hoy
        for (Turno turno : listaTurnos) {
            LocalDate fechaTurno = turno.getFechaTurno().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            if (fechaTurno.equals(hoy) && turno.getEstado() == EstadoTurno.PENDIENTE) {
                turnosHoy.add(turno);
            }
        }

        System.out.println("Turnos para hoy (metodo en back): " + turnosHoy.size());
        return turnosHoy;
    }

    public List<Turno> getTurnosAtendidosHoy() {
        List<Turno> turnosAtendidosHoy = new ArrayList<>();
        List<Turno> turnosHoy = controlPersis.getTurnosHoy();

        for (Turno turno : turnosHoy) {
            if (turno.getEstado() == EstadoTurno.ATENDIDO) {
                turnosAtendidosHoy.add(turno);
            }
        }

        return turnosAtendidosHoy;
    }

    public Turno getTurno(int idTurno) {
        return controlPersis.getTurno(idTurno);
    }

    /*   
    public void cambiarEstadoTurno(int idTurno, String estadoTurno) {

        Turno turno = getTurno(idTurno);

        switch (estadoTurno) {
            case "ATENDIDO":
                turno.setEstado(EstadoTurno.ATENDIDO);
                break;
            case "CERRADO":
                turno.setEstado(EstadoTurno.CERRADO);
                break;
            default:
                turno.setEstado(EstadoTurno.PENDIENTE);
        }

        controlPersis.cambiarEstadoTurno(turno);
    } 
     */
    
    public void observarTurno(int idTurno, String estadoTurno, String observacion) {

        Turno turno = getTurno(idTurno);
        
        switch (estadoTurno) {
            case "ATENDIDO":
                turno.setEstado(EstadoTurno.ATENDIDO);
                turno.setObservaciones(observacion);
                break;
            case "CERRADO":
                turno.setEstado(EstadoTurno.CERRADO);
                turno.setObservaciones(observacion);
                break;
            default:
                turno.setEstado(EstadoTurno.PENDIENTE);
        }

        controlPersis.cambiarEstadoTurno(turno);
    }

    // VALIDACIONES
    public boolean comprobarIngreso(String usuario, String contrasenia) {

        boolean ingreso = false;

        List<Usuario> listaUsuarios = new ArrayList<Usuario>();
        listaUsuarios = getUsuarios();

        for (Usuario usu : listaUsuarios) {
            if (usu.getNombre_usuario().equalsIgnoreCase(usuario)) {
                if (usu.getContrasenia().equals(contrasenia)) {
                    ingreso = true;
                } else {
                    ingreso = false;
                }
            }
        }
        return ingreso;
    }

    public boolean validarDiaTurno(String fechaTurnoStr, String idOdonto, String horaTurno) {

        boolean valido = false;
        Odontologo odonto = controlPersis.getOdontologo(Integer.parseInt(idOdonto));

        List<String> diasLaborales = odonto.getUnHorario().getDiasLaborales();
        String horaInicio = odonto.getUnHorario().getHorario_inicio();
        String horaFin = odonto.getUnHorario().getHorario_fin();

        // Crear una instancia de Calendar y establecer la fecha del turno
        Calendar calendario = Calendar.getInstance();
        calendario.setTime(dtu.convertirStringADate(fechaTurnoStr));

        // Obtener el día de la semana del turno
        int diaDeLaSemana = calendario.get(Calendar.DAY_OF_WEEK);
        String[] diasSemana = {"Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado"};

        // Convertir el día de la semana a una representación de texto
        String nombreDia = diasSemana[diaDeLaSemana - 1];

        if (diasLaborales.contains(nombreDia)) {
            valido = true;
        }

        // FALTA AGREGAR VALIDACIÓN DE HORA
        return valido;
    }

}
