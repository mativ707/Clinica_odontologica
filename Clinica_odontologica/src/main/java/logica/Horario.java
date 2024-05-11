package logica;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;

@Entity
public class Horario implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_horario;
    @ElementCollection
    @CollectionTable(name = "dias_laborales", joinColumns = @JoinColumn(name = "id_horario"))
    @Column(name = "dia")
    private List<String> diasLaborales;
    private String horario_inicio;
    private String horario_fin;

    public Horario() {
    }

    public Horario(int id_horario, List<String> diasLaborales, String horario_inicio, String horario_fin) {
        this.id_horario = id_horario;
        this.diasLaborales = diasLaborales;
        this.horario_inicio = horario_inicio;
        this.horario_fin = horario_fin;
    }

    public List<String> getDiasLaborales() {
        return diasLaborales;
    }

    public void setDiasLaborales(List<String> diasLaborales) {
        this.diasLaborales = diasLaborales;
    }

    
    
    public int getId_horario() {
        return id_horario;
    }

    public void setId_horario(int id_horario) {
        this.id_horario = id_horario;
    }

    public String getHorario_inicio() {
        return horario_inicio;
    }

    public void setHorario_inicio(String horario_inicio) {
        this.horario_inicio = horario_inicio;
    }

    public String getHorario_fin() {
        return horario_fin;
    }

    public void setHorario_fin(String horario_fin) {
        this.horario_fin = horario_fin;
    }
    
}
