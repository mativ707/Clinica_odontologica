package logica;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.Odontologo;
import logica.Paciente;
import logica.enums.EstadoTurno;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2024-05-08T16:45:44")
@StaticMetamodel(Turno.class)
public class Turno_ { 

    public static volatile SingularAttribute<Turno, String> afeccion;
    public static volatile SingularAttribute<Turno, Odontologo> odonto;
    public static volatile SingularAttribute<Turno, EstadoTurno> estado;
    public static volatile SingularAttribute<Turno, String> hora_turno;
    public static volatile SingularAttribute<Turno, Paciente> pacien;
    public static volatile SingularAttribute<Turno, String> observaciones;
    public static volatile SingularAttribute<Turno, Integer> id_turno;
    public static volatile SingularAttribute<Turno, Date> fechaTurno;

}