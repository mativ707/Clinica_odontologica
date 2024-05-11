package logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import logica.enums.EstadoTurno;

@Entity
public class Turno implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_turno;
    @Temporal(TemporalType.DATE)
    private Date fechaTurno;
    private String hora_turno;
    private String afeccion;
    private String observaciones;
    @Column(name = "estado")
    @Enumerated(EnumType.STRING)
    private EstadoTurno estado;
    @ManyToOne
    @JoinColumn(name = "id_odonto")
    private Odontologo odonto;
    @ManyToOne
    @JoinColumn(name = "id_pacien")
    private Paciente pacien;

    public Turno() {
    }

    public Turno(int id_turno, Date fechaTurno, String hora_turno, String afeccion, String observaciones, EstadoTurno estado, Odontologo odonto, Paciente pacien) {
        this.id_turno = id_turno;
        this.fechaTurno = fechaTurno;
        this.hora_turno = hora_turno;
        this.afeccion = afeccion;
        this.observaciones = observaciones;
        this.estado = estado;
        this.odonto = odonto;
        this.pacien = pacien;
    }

    
    
    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    

    public EstadoTurno getEstado() {
        return estado;
    }

    public void setEstado(EstadoTurno estado) {
        this.estado = estado;
    }

    public Odontologo getOdonto() {
        return odonto;
    }

    public void setOdonto(Odontologo odonto) {
        this.odonto = odonto;
    }

    public Paciente getPacien() {
        return pacien;
    }

    public void setPacien(Paciente pacien) {
        this.pacien = pacien;
    }

    public int getId_turno() {
        return id_turno;
    }

    public void setId_turno(int id_turno) {
        this.id_turno = id_turno;
    }

    public Date getFechaTurno() {
        return fechaTurno;
    }

    public void setFechaTurno(Date fechaTurno) {
        this.fechaTurno = fechaTurno;
    }

    public String getHora_turno() {
        return hora_turno;
    }

    public void setHora_turno(String hora_turno) {
        this.hora_turno = hora_turno;
    }

    public String getAfeccion() {
        return afeccion;
    }

    public void setAfeccion(String afeccion) {
        this.afeccion = afeccion;
    }

}
