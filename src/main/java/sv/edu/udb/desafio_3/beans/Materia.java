package sv.edu.udb.desafio_3.beans;

public class Materia {
    public int idMateria;
    public String materia;

    public Materia(int idMateria, String materia){
        this.idMateria = idMateria;
        this.materia = materia;
    }

    public Materia() {

    }

    // Métodos Setter
    public void setIdMateria(int idMateria) {
        this.idMateria = idMateria;
    }

    public void setMateria(String materia) {
        this.materia = materia;
    }

    // Métodos Getter
    public int getIdMateria() {
        return idMateria;
    }

    public String getMateria() {
        return materia;
    }
}
