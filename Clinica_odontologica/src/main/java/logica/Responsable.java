package logica;

import java.util.Date;
import javax.persistence.Entity;

@Entity
public class Responsable extends Persona{
    
    private String tipo_respons;

    public Responsable() {
    }

    public Responsable(String tipo_respons, int id, String dni, String nombre, String apellido, String telefono, String direccion, Date fechaNac) {
        super(id, dni, nombre, apellido, telefono, direccion, fechaNac);
        this.tipo_respons = tipo_respons;
    }

    public String getTipo_respons() {
        return tipo_respons;
    }

    public void setTipo_respons(String tipo_respons) {
        this.tipo_respons = tipo_respons;
    }
    
    
}
